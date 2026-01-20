# UDO v4.5 Installer for Windows PowerShell

$ErrorActionPreference = "Stop"
$VERSION = "4.5"
$REPO_URL = "https://raw.githubusercontent.com/carderel/UDO-universal-orchestrator-v4b/main"

Write-Host ""
Write-Host "UDO - Universal Dynamic Orchestrator v$VERSION" -ForegroundColor Green
Write-Host "AI Project Management System" -ForegroundColor Green
Write-Host ""

if ((Test-Path "ORCHESTRATOR.md") -or (Test-Path "START_HERE.md")) {
    Write-Host "Warning: UDO files already exist." -ForegroundColor Yellow
    $confirm = Read-Host "Overwrite? (y/N)"
    if ($confirm -ne "y") { exit 0 }
}

Write-Host "Installing UDO v$VERSION..."

# Create directories
$dirs = @(".agents\_archive", ".checkpoints", ".inputs", ".memory\canonical", ".memory\working", ".memory\disposable", ".outputs\_drafts", ".project-catalog\sessions", ".project-catalog\decisions", ".project-catalog\agents", ".project-catalog\errors", ".project-catalog\handoffs", ".project-catalog\archive", ".rules", ".templates")
foreach ($dir in $dirs) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }

# Download files
$files = @("START_HERE.md", "ORCHESTRATOR.md", "COMMANDS.md", "HARD_STOPS.md", "LESSONS_LEARNED.md", "NON_GOALS.md", "OVERSIGHT_DASHBOARD.md", "HANDOFF_PROMPT.md", "PROJECT_STATE.json", "PROJECT_META.json", "CAPABILITIES.json")
foreach ($file in $files) {
    try { Invoke-WebRequest -Uri "$REPO_URL/template/$file" -OutFile $file -UseBasicParsing }
    catch { Write-Host "Warning: Could not download $file" -ForegroundColor Yellow }
}

# Template files
try { Invoke-WebRequest -Uri "$REPO_URL/template/.templates/agent.md" -OutFile ".templates\agent.md" -UseBasicParsing } catch {}
try { Invoke-WebRequest -Uri "$REPO_URL/template/.inputs/manifest.json" -OutFile ".inputs\manifest.json" -UseBasicParsing } catch {}

# Create .gitkeep files
$keepDirs = @(".agents\_archive", ".checkpoints", ".memory\canonical", ".memory\working", ".memory\disposable", ".outputs\_drafts", ".project-catalog\sessions", ".project-catalog\decisions", ".project-catalog\agents", ".project-catalog\errors", ".project-catalog\handoffs", ".project-catalog\archive", ".rules")
foreach ($dir in $keepDirs) { "# Preserves directory" | Out-File -FilePath "$dir\.gitkeep" -Encoding UTF8 }

Write-Host ""
Write-Host "UDO v$VERSION installed!" -ForegroundColor Green
Write-Host ""
Write-Host "Add to your AI system prompt:" -ForegroundColor Yellow
Write-Host "  Before responding, read START_HERE.md and follow its instructions."
