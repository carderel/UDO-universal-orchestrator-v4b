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
BLUE='\033[0;34m'
NC='\033[0m'

# Parse command line arguments
UPDATE_MODE=""
while [[ $# -gt 0 ]]; do
    case $1 in
        --update|-u)
            UPDATE_MODE="update"
            shift
            ;;
        --overwrite|-o)
            UPDATE_MODE="overwrite"
            shift
            ;;
        --force|-f)
            UPDATE_MODE="overwrite"
            shift
            ;;
        --help|-h)
            echo "UDO v${VERSION} Installer"
            echo ""
            echo "Usage: install.sh [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --update, -u     Update core files only (preserves project data)"
            echo "  --overwrite, -o  Full overwrite (replaces everything)"
            echo "  --force, -f      Same as --overwrite"
            echo "  --help, -h       Show this help message"
            echo ""
            echo "Examples:"
            echo "  Fresh install:  curl -fsSL URL/install.sh | bash"
            echo "  Update:         curl -fsSL URL/install.sh | bash -s -- --update"
            echo "  Overwrite:      curl -fsSL URL/install.sh | bash -s -- --overwrite"
            exit 0
            ;;
        *)
            shift
            ;;
    esac
done

echo -e "${GREEN}"
echo "╔════════════════════════════════════════════════════════════╗"
echo "║         UDO - Universal Dynamic Orchestrator v${VERSION}         ║"
echo "║              AI Project Management System                  ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Function to get installed version
get_installed_version() {
    if [ -f "PROJECT_META.json" ]; then
        grep -o '"udo_version"[[:space:]]*:[[:space:]]*"[^"]*"' PROJECT_META.json 2>/dev/null | grep -o '[0-9]\+\.[0-9]\+' || echo "unknown"
    else
        echo "unknown"
    fi
}

# Check if UDO is already installed
if [ -f "ORCHESTRATOR.md" ] || [ -f "START_HERE.md" ]; then
    INSTALLED_VERSION=$(get_installed_version)
    
    echo -e "${YELLOW}UDO is already installed in this directory.${NC}"
    echo ""
    echo -e "  Installed version: ${BLUE}${INSTALLED_VERSION}${NC}"
    echo -e "  Latest version:    ${BLUE}${VERSION}${NC}"
    echo ""
    
    # If no mode specified via command line, show instructions
    if [ -z "$UPDATE_MODE" ]; then
        echo -e "${RED}Cannot prompt interactively when piped.${NC}"
        echo ""
        echo "Please run with one of these options:"
        echo ""
        echo -e "  ${YELLOW}To update (preserve project data):${NC}"
        echo "  curl -fsSL $REPO_URL/install.sh | bash -s -- --update"
        echo ""
        echo -e "  ${YELLOW}To overwrite everything:${NC}"
        echo "  curl -fsSL $REPO_URL/install.sh | bash -s -- --overwrite"
        echo ""
        exit 1
    fi
else
    UPDATE_MODE="fresh"
fi

echo ""
echo "Installing UDO v${VERSION} to: $(pwd)"
echo -e "Mode: ${BLUE}${UPDATE_MODE}${NC}"
echo ""

# Create directory structure (safe - won't overwrite existing)
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

# Download function
download_file() {
    local file=$1
    local url="${REPO_URL}/template/${file}"
    if command -v curl &> /dev/null; then
        curl -fsSL "$url" -o "$file" 2>/dev/null || echo -e "${YELLOW}Warning: Could not download $file${NC}"
    elif command -v wget &> /dev/null; then
        wget -q "$url" -O "$file" 2>/dev/null || echo -e "${YELLOW}Warning: Could not download $file${NC}"
    fi
}

# Core system files (always updated)
CORE_FILES="START_HERE.md ORCHESTRATOR.md COMMANDS.md OVERSIGHT_DASHBOARD.md HANDOFF_PROMPT.md REASONING_CONTRACT.md DEVILS_ADVOCATE.md AUDIENCE_ANTICIPATION.md"

# Config files (only on fresh install or overwrite)
CONFIG_FILES="HARD_STOPS.md LESSONS_LEARNED.md NON_GOALS.md PROJECT_STATE.json PROJECT_META.json CAPABILITIES.json"

# Download core files
echo "Downloading core files..."
for file in $CORE_FILES; do
    download_file "$file"
done

# Download config files based on mode
if [ "$UPDATE_MODE" = "fresh" ] || [ "$UPDATE_MODE" = "overwrite" ]; then
    echo "Downloading configuration files..."
    for file in $CONFIG_FILES; do
        download_file "$file"
    done
else
    echo -e "${BLUE}Preserving existing configuration files.${NC}"
fi

# Template files (always update)
download_file ".templates/agent.md"

# Manifest only on fresh/overwrite
if [ "$UPDATE_MODE" = "fresh" ] || [ "$UPDATE_MODE" = "overwrite" ]; then
    download_file ".inputs/manifest.json"
fi

# Create .gitkeep files (safe - only if don't exist)
echo "Ensuring directory placeholders..."
for dir in .agents/_archive .checkpoints .memory/canonical .memory/working .memory/disposable .outputs/_drafts .project-catalog/sessions .project-catalog/decisions .project-catalog/agents .project-catalog/errors .project-catalog/handoffs .project-catalog/archive .rules; do
    if [ ! -f "$dir/.gitkeep" ]; then
        echo "# This file preserves the directory in git" > "$dir/.gitkeep"
    fi
done

# Update version in PROJECT_META.json if it exists and we're updating
if [ "$UPDATE_MODE" = "update" ] && [ -f "PROJECT_META.json" ]; then
    if command -v sed &> /dev/null; then
        sed -i.bak 's/"udo_version"[[:space:]]*:[[:space:]]*"[^"]*"/"udo_version": "'"$VERSION"'"/' PROJECT_META.json 2>/dev/null && rm -f PROJECT_META.json.bak
    fi
fi

echo ""
if [ "$UPDATE_MODE" = "fresh" ]; then
    echo -e "${GREEN}✓ UDO v${VERSION} installed successfully!${NC}"
elif [ "$UPDATE_MODE" = "update" ]; then
    echo -e "${GREEN}✓ UDO updated to v${VERSION}!${NC}"
    echo -e "${BLUE}  Your project data and configuration were preserved.${NC}"
else
    echo -e "${GREEN}✓ UDO v${VERSION} installed (full overwrite).${NC}"
fi

echo ""
echo "Next steps:"
echo "1. Configure your AI with this system prompt addition:"
echo ""
echo -e "${YELLOW}   Before responding to any request, read the project's"
echo -e "   START_HERE.md and follow its instructions.${NC}"
echo ""
echo "2. Tell your AI: \"Read START_HERE.md and begin\""
