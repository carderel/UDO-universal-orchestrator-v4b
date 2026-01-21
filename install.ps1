# UDO v4.5 Installer for Windows PowerShell

$ErrorActionPreference = "Stop"
$VERSION = "4.5"
$REPO_URL = "https://raw.githubusercontent.com/carderel/UDO-universal-orchestrator-v4b/main"

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║         UDO - Universal Dynamic Orchestrator v$VERSION         ║" -ForegroundColor Green
Write-Host "║              AI Project Management System                  ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""

# Function to get installed version
function Get-InstalledVersion {
    if (Test-Path "PROJECT_META.json") {
        try {
            $meta = Get-Content "PROJECT_META.json" | ConvertFrom-Json
            return $meta.udo_version
        } catch {
            return "unknown"
        }
    }
    return "unknown"
}

$UpdateMode = "fresh"

# Check if UDO is already installed
if ((Test-Path "ORCHESTRATOR.md") -or (Test-Path "START_HERE.md")) {
    $InstalledVersion = Get-InstalledVersion
    
    Write-Host "UDO is already installed in this directory." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Installed version: $InstalledVersion" -ForegroundColor Cyan
    Write-Host "  Latest version:    $VERSION" -ForegroundColor Cyan
    Write-Host ""
    
    if ($InstalledVersion -eq $VERSION) {
        Write-Host "You already have the latest version." -ForegroundColor Green
        Write-Host ""
    }
    
    Write-Host "What would you like to do?"
    Write-Host ""
    Write-Host "  1) Cancel installation"
    Write-Host "  2) Update core files only (preserves project data)"
    Write-Host "  3) Full overwrite (replaces everything - DESTRUCTIVE)"
    Write-Host ""
    $choice = Read-Host "Enter choice [1-3]"
    
    switch ($choice) {
        "1" {
            Write-Host "Installation cancelled."
            exit 0
        }
        "2" {
            Write-Host ""
            Write-Host "Updating core UDO files..." -ForegroundColor Yellow
            $UpdateMode = "update"
        }
        "3" {
            Write-Host ""
            $confirm = Read-Host "Are you sure? This will overwrite all UDO files. Type 'yes' to confirm"
            if ($confirm -ne "yes") {
                Write-Host "Installation cancelled."
                exit 0
            }
            $UpdateMode = "overwrite"
        }
        default {
            Write-Host "Invalid choice. Installation cancelled."
            exit 1
        }
    }
}

Write-Host ""
Write-Host "Installing UDO v$VERSION..."
Write-Host ""

# Create directories
$dirs = @(".agents\_archive", ".checkpoints", ".inputs", ".memory\canonical", ".memory\working", ".memory\disposable", ".outputs\_drafts", ".project-catalog\sessions", ".project-catalog\decisions", ".project-catalog\agents", ".project-catalog\errors", ".project-catalog\handoffs", ".project-catalog\archive", ".rules", ".templates")
foreach ($dir in $dirs) { 
    New-Item -ItemType Directory -Path $dir -Force | Out-Null 
}

# Core files (always updated)
$coreFiles = @("START_HERE.md", "ORCHESTRATOR.md", "COMMANDS.md", "OVERSIGHT_DASHBOARD.md", "HANDOFF_PROMPT.md")

# Config files (only on fresh/overwrite)
$configFiles = @("HARD_STOPS.md", "LESSONS_LEARNED.md", "NON_GOALS.md", "PROJECT_STATE.json", "PROJECT_META.json", "CAPABILITIES.json")

Write-Host "Downloading core files..."
foreach ($file in $coreFiles) {
    try { 
        Invoke-WebRequest -Uri "$REPO_URL/template/$file" -OutFile $file -UseBasicParsing 
    } catch { 
        Write-Host "Warning: Could not download $file" -ForegroundColor Yellow 
    }
}

if ($UpdateMode -eq "fresh" -or $UpdateMode -eq "overwrite") {
    Write-Host "Downloading configuration files..."
    foreach ($file in $configFiles) {
        try { 
            Invoke-WebRequest -Uri "$REPO_URL/template/$file" -OutFile $file -UseBasicParsing 
        } catch { 
            Write-Host "Warning: Could not download $file" -ForegroundColor Yellow 
        }
    }
} else {
    Write-Host "Preserving existing configuration files." -ForegroundColor Cyan
}

# Template files
try { Invoke-WebRequest -Uri "$REPO_URL/template/.templates/agent.md" -OutFile ".templates\agent.md" -UseBasicParsing } catch {}

if ($UpdateMode -eq "fresh" -or $UpdateMode -eq "overwrite") {
    try { Invoke-WebRequest -Uri "$REPO_URL/template/.inputs/manifest.json" -OutFile ".inputs\manifest.json" -UseBasicParsing } catch {}
}

# Create .gitkeep files
$keepDirs = @(".agents\_archive", ".checkpoints", ".memory\canonical", ".memory\working", ".memory\disposable", ".outputs\_drafts", ".project-catalog\sessions", ".project-catalog\decisions", ".project-catalog\agents", ".project-catalog\errors", ".project-catalog\handoffs", ".project-catalog\archive", ".rules")
foreach ($dir in $keepDirs) { 
    $gitkeep = "$dir\.gitkeep"
    if (-not (Test-Path $gitkeep)) {
        "# Preserves directory" | Out-File -FilePath $gitkeep -Encoding UTF8 
    }
}

# Update version in PROJECT_META.json
if (Test-Path "PROJECT_META.json") {
    try {
        $meta = Get-Content "PROJECT_META.json" | ConvertFrom-Json
        $meta.udo_version = $VERSION
        $meta | ConvertTo-Json | Set-Content "PROJECT_META.json"
    } catch {}
}

Write-Host ""
if ($UpdateMode -eq "fresh") {
    Write-Host "UDO v$VERSION installed successfully!" -ForegroundColor Green
} elseif ($UpdateMode -eq "update") {
    Write-Host "UDO updated to v$VERSION!" -ForegroundColor Green
    Write-Host "Your project data and configuration were preserved." -ForegroundColor Cyan
} else {
    Write-Host "UDO v$VERSION installed (full overwrite)." -ForegroundColor Green
}

Write-Host ""
Write-Host "Add to your AI system prompt:" -ForegroundColor Yellow
Write-Host "  Before responding, read START_HERE.md and follow its instructions."
