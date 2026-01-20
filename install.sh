#!/bin/bash
# UDO v4.5 Installer
# Universal Dynamic Orchestrator - Hybrid Installation

set -e

VERSION="4.5"
REPO_URL="https://raw.githubusercontent.com/carderel/UDO-universal-orchestrator-v4b/main"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}"
echo "╔════════════════════════════════════════════════════════════╗"
echo "║         UDO - Universal Dynamic Orchestrator v${VERSION}         ║"
echo "║              AI Project Management System                  ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Check if UDO is already installed
if [ -f "ORCHESTRATOR.md" ] || [ -f "START_HERE.md" ]; then
    echo -e "${YELLOW}Warning: UDO files already exist in this directory.${NC}"
    read -p "Overwrite existing files? (y/N): " confirm
    if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        echo "Installation cancelled."
        exit 0
    fi
fi

echo "Installing UDO v${VERSION} to: $(pwd)"
echo ""

# Create directory structure
echo "Creating directory structure..."
mkdir -p .agents/_archive
mkdir -p .checkpoints
mkdir -p .inputs
mkdir -p .memory/canonical .memory/working .memory/disposable
mkdir -p .outputs/_drafts
mkdir -p .project-catalog/sessions .project-catalog/decisions .project-catalog/agents
mkdir -p .project-catalog/errors .project-catalog/handoffs .project-catalog/archive
mkdir -p .rules
mkdir -p .templates

# Download core files
echo "Downloading core files..."

download_file() {
    local file=$1
    local url="${REPO_URL}/template/${file}"
    if command -v curl &> /dev/null; then
        curl -fsSL "$url" -o "$file" 2>/dev/null || echo -e "${YELLOW}Warning: Could not download $file${NC}"
    elif command -v wget &> /dev/null; then
        wget -q "$url" -O "$file" 2>/dev/null || echo -e "${YELLOW}Warning: Could not download $file${NC}"
    fi
}

download_file "START_HERE.md"
download_file "ORCHESTRATOR.md"
download_file "COMMANDS.md"
download_file "HARD_STOPS.md"
download_file "LESSONS_LEARNED.md"
download_file "NON_GOALS.md"
download_file "OVERSIGHT_DASHBOARD.md"
download_file "HANDOFF_PROMPT.md"
download_file "PROJECT_STATE.json"
download_file "PROJECT_META.json"
download_file "CAPABILITIES.json"
download_file ".templates/agent.md"
download_file ".inputs/manifest.json"

# Create .gitkeep files
echo "Creating placeholder files..."
for dir in .agents/_archive .checkpoints .memory/canonical .memory/working .memory/disposable .outputs/_drafts .project-catalog/sessions .project-catalog/decisions .project-catalog/agents .project-catalog/errors .project-catalog/handoffs .project-catalog/archive .rules; do
    echo "# This file preserves the directory in git" > "$dir/.gitkeep"
done

echo ""
echo -e "${GREEN}✓ UDO v${VERSION} installed successfully!${NC}"
echo ""
echo "Next steps:"
echo "1. Configure your AI with this system prompt addition:"
echo ""
echo -e "${YELLOW}   Before responding to any request, read the project's"
echo -e "   START_HERE.md and follow its instructions.${NC}"
echo ""
echo "2. Tell your AI: \"Read START_HERE.md and begin\""
