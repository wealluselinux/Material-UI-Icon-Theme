#!/bin/bash

echo "Checking For KDE Plasma"
# Check if KDE Plasma is the current desktop environment or if plasmashell is running
if [[ "${XDG_CURRENT_DESKTOP}" == *"KDE"* ]] || pgrep -x "plasmashell" > /dev/null; then
    echo "KDE Plasma detected! Continuing with the script..."
    # Add your KDE-specific installation or commands here
else
    echo "Error: This script requires KDE Plasma to run." >&2
    exit 1
fi

echo "Script is proceeding..."

TARGET_DIR="$HOME/.local/share/icons"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Folder not found: $TARGET_DIR. Creating it now..."
    mkdir -p "$TARGET_DIR"
else
    echo "Folder already exists. Skipping creation."
fi

echo "Making 
