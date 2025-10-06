# Searches for all labs on certskills.com 

if (-not (Get-Module -ListAvailable -Name HtmlToMarkdown)) {
    Write-Host "Installing HtmlToMarkdown module..." -ForegroundColor Yellow
    Install-Module -Name HtmlToMarkdown -Scope CurrentUser -Force
}
Import-Module HtmlToMarkdown

$BaseUrl = "https://www.certskills.com"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if ([string]::IsNullOrEmpty($ScriptDir)) { $ScriptDir = Get-Location }
$OutputDir = Join-Path $ScriptDir "certskills_labs"
$StartLab = 101
$EndLab = 9999

$MarkdownDir = Join-Path $OutputDir "markdown"
$PktDir = Join-Path $OutputDir "pkt_files"
$ImagesDir = Join-Path $OutputDir "images"

New-Item -ItemType Directory -Force -Path $MarkdownDir | Out-Null
New-Item -ItemType Directory -Force -Path $PktDir | Out-Null
New-Item -ItemType Directory -Force -Path $ImagesDir | Out-Null

function Download-Image {
    param(
        [string]$ImageUrl,
        [string]$LabId,
        [hashtable]$ImageCache
    )
    
    if ($ImageCache.ContainsKey($ImageUrl)) {
        return $ImageCache[$ImageUrl]
    }
    
    try {
        if ($ImageUrl -notmatch '^https?://') {
            if ($ImageUrl.StartsWith('//')) {
                $ImageUrl = "https:$ImageUrl"
            } elseif ($ImageUrl.StartsWith('/')) {
                $ImageUrl = "$BaseUrl$ImageUrl"
            } else {
                $ImageUrl = "$BaseUrl/$ImageUrl"
            }
        }
        
        $extension = [System.IO.Path]::GetExtension($ImageUrl)
        if ([string]::IsNullOrEmpty($extension) -or $extension.Length -gt 5) {
            $extension = ".svg"
        }
        
        $imageIndex = $ImageCache.Count + 1
        $imageName = "${LabId}_img${imageIndex}${extension}"
        $outputPath = Join-Path $ImagesDir $imageName
        
        Invoke-WebRequest -Uri $ImageUrl -OutFile $outputPath -ErrorAction Stop
        Write-Host "    ✓ Downloaded image: $imageName" -ForegroundColor Green
        
        $localPath = "../images/$imageName"
        $ImageCache[$ImageUrl] = $localPath
        
        return $localPath
    } catch {
        Write-Host "Failed to download image: $ImageUrl - $_" -ForegroundColor Yellow
        $ImageCache[$ImageUrl] = $ImageUrl
        return $ImageUrl  # Return original URL as fallback
    }
}

function Process-Images {
    param(
        [string]$Html,
        [string]$LabId,
        [hashtable]$ImageCache
    )
    
    $Html = $Html -replace '<img[^>]+src=["'']([^"'']+\.(?:png|jpg|jpeg|gif|webp))["''][^>]*>', ''
    
    $imageMatches = [regex]::Matches($Html, '<img([^>]+)src=["'']([^"'']+\.svg)["''][^>]*>')
    foreach ($match in $imageMatches) {
        $imageUrl = $match.Groups[2].Value
        $localPath = Download-Image -ImageUrl $imageUrl -LabId $LabId -ImageCache $ImageCache
        
        $newImgTag = $match.Value -replace 'src=["''][^"'']+["'']', "src=`"$localPath`""
        $Html = $Html.Replace($match.Value, $newImgTag)
    }
    
    return $Html
}

function Extract-LabContent {
    param(
        [string]$LabId,
        [string]$HtmlContent,
        [string]$LabUrl
    )
    
    $outputFile = Join-Path $MarkdownDir "$LabId.md"
    $imageCache = @{}
    
    $markdown = "# [$LabId]($LabUrl)`n`n"
    
    $mainContent = ""
    
    if ($HtmlContent -match '(?s)<h1[^>]*>The Lab Exercise</h1>(.*?)<div[^>]*class=["''][^"'']*comment') {
        $mainContent = $matches[1]
        Write-Host "Found lab content (before comments)" -ForegroundColor Green
    }
    elseif ($HtmlContent -match '(?s)<div[^>]*class=["''][^"'']*entry-content[^"'']*["''][^>]*>(.*?)<div[^>]*id=["'']comments') {
        $mainContent = $matches[1]
        Write-Host "Found entry content (before comments)" -ForegroundColor Green
    }
    elseif ($HtmlContent -match '(?s)<article[^>]*>(.*?)</article>') {
        $mainContent = $matches[1]
        Write-Host "Found article content" -ForegroundColor Green
    }
    else {
        Write-Host "Using full HTML (couldn't isolate content)" -ForegroundColor Yellow
        $mainContent = $HtmlContent
    }
    
    $mainContent = $mainContent -replace '(?s)<form[^>]*>.*?</form>', ''
    $mainContent = $mainContent -replace '(?s)<div[^>]*class=["''][^"'']*comment[^"'']*["''][^>]*>.*?</div>', ''
    $mainContent = $mainContent -replace '(?s)<!-- // From wpDiscuz.*?-->', ''
    $mainContent = $mainContent -replace '(?s)<section[^>]*class=["''][^"'']*vc_section[^"'']*["''][^>]*>.*?</section>', ''
    
    $mainContent = Process-Images -Html $mainContent -LabId $LabId -ImageCache $imageCache
    
    $sections = @()
    
    if ($mainContent -match '(?s)(<h2[^>]*>Lab Requirements</h2>.*?)(?=<h2[^>]*>(?!<)|<div class=["'']answer-tabs|$)') {
        $sections += @{Name="Lab Requirements"; Content=$matches[1]}
        Write-Host "  ✓ Found Lab Requirements" -ForegroundColor Green
    }
    
    if ($mainContent -match '(?s)(<h2[^>]*>Initial Configuration</h2>.*?)(?=<h2[^>]*>(?!<)|<div class=["'']answer-tabs|$)') {
        $sections += @{Name="Initial Configuration"; Content=$matches[1]}
        Write-Host "  ✓ Found Initial Configuration" -ForegroundColor Green
    }
    
    if ($mainContent -match '(?s)(<h2[^>]*>Answer Options[^<]*</h2>.*?)(?=<h2[^>]*>(?:Lab Answers|Answers(?! Options))|<div id=["'']lab-answers|$)') {
        $sections += @{Name="Answer Options"; Content=$matches[1]}
        Write-Host "  ✓ Found Answer Options" -ForegroundColor Green
    }
    
    $answersContent = ""
    if ($mainContent -match '(?s)(<h2[^>]*>Lab Answers</h2>.*?)(?=<h2[^>]*>(?:Commentary|Known)|<div[^>]*class=["'']comment|$)') {
        $answersContent = $matches[1]
        Write-Host "  ✓ Found Lab Answers" -ForegroundColor Green
    }
    elseif ($mainContent -match '(?s)(<h2[^>]*>Answers</h2>.*?)(?=<h2[^>]*>(?:Commentary|Known)|<div[^>]*class=["'']comment|$)') {
        $answersContent = $matches[1]
        Write-Host "  ✓ Found Answers" -ForegroundColor Green
    }
    
    foreach ($section in $sections) {
        try {
            $converted = Convert-HtmlToMarkdown -Html $section.Content
            if ($converted) {
                $markdown += "$converted`n`n"
            }
        } catch {
            Write-Host "Error converting section $($section.Name): $_" -ForegroundColor Yellow
        }
    }
    
    if ($answersContent) {
        $markdown += "---`n`n"
        try {
            $converted = Convert-HtmlToMarkdown -Html $answersContent
            $markdown += "$converted`n`n"
        } catch {
            Write-Host "Error converting answers: $_" -ForegroundColor Yellow
        }
    }
    
    $markdown = $markdown -replace '\n{3,}', "`n`n"
    $markdown = $markdown.Trim()
    
    
	if ($imageCache.Count -gt 0) {
		$firstImage = ($imageCache.Values | Select-Object -First 1)
		$markdown = $markdown -replace "^(# \[.*?\]\(.*?\)\s*`n`n)", "`$1![]($firstImage)`n`n"
	}
	$utf8NoBom = New-Object System.Text.UTF8Encoding $false
	[System.IO.File]::WriteAllText($outputFile, $markdown, $utf8NoBom)

    
    Write-Host "  ✓ Saved markdown to $outputFile" -ForegroundColor Green
    return $true
}

function Download-PktFile {
    param(
        [string]$LabId,
        [string]$HtmlContent
    )
    
    $pktUrl = ""
    
    if ($HtmlContent -match "https://files\.certskills\.com/virl/$LabId\.pkt") {
        $pktUrl = $matches[0]
    } elseif ($HtmlContent -match "href=`"([^`"]*$LabId\.pkt)`"") {
        $pktUrl = $matches[1]
        if ($pktUrl -notmatch '^https?://') {
            $pktUrl = "https://files.certskills.com/virl/$LabId.pkt"
        }
    }
    
    if ($pktUrl) {
        $outputFile = Join-Path $PktDir "$LabId.pkt"
        
        try {
            Invoke-WebRequest -Uri $pktUrl -OutFile $outputFile -ErrorAction Stop
            Write-Host "Downloaded PKT file" -ForegroundColor Green
            return $true
        } catch {
            Write-Host "PKT download failed" -ForegroundColor Yellow
            return $false
        }
    } else {
        Write-Host "No PKT file found" -ForegroundColor Yellow
        return $false
    }
}

Write-Host "Starting CertSkills lab scraper..." -ForegroundColor Cyan
Write-Host "Searching for labs from clab$StartLab to clab$EndLab..." -ForegroundColor Cyan
Write-Host "Output directory: $OutputDir" -ForegroundColor Cyan
Write-Host ""

$foundLabs = 0
$failedLabs = 0

for ($i = $StartLab; $i -le $EndLab; $i++) {
    $labId = "clab$i"
    $labUrl = "$BaseUrl/$labId/"
    
    Write-Host "[$i] Checking $labId..." -ForegroundColor Yellow
    
    try {
        $response = Invoke-WebRequest -Uri $labUrl -ErrorAction Stop
        
        Write-Host "Found lab at $labUrl" -ForegroundColor Green
        $foundLabs++
        
        Extract-LabContent -LabId $labId -HtmlContent $response.Content -LabUrl $labUrl
        
        Download-PktFile -LabId $labId -HtmlContent $response.Content
        
        Write-Host ""
        
    } catch {
        $statusCode = $_.Exception.Response.StatusCode.value__
        
        if ($statusCode -eq 404) {
            $failedLabs++
        } else {
            Write-Host "Error: $_" -ForegroundColor Red
            $failedLabs++
        }
    }
    
    Start-Sleep -Milliseconds 100
}

Write-Host "Labs found: $foundLabs" -ForegroundColor Green
