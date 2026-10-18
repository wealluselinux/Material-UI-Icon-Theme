#!/bin/bash

echo "Checking For KDE Plasma"
# Check if KDE Plasma is the current desktop environment or if plasmashell is running
if [[ "${XDG_CURRENT_DESKTOP}" == *"KDE"* ]] || pgrep -x "plasmashell" > /dev/null; then
    echo "KDE Plasma detected! Continuing with the script..."
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

echo "Making Icon Folder"
THEME_DIR="$TARGET_DIR/MaterialUI"
mkdir -p "$THEME_DIR"
echo "done"

echo "Building theme..."
cp -r "$HOME/Material-UI-Icon-Theme/index.theme" "$THEME_DIR/"

mkdir -p "$THEME_DIR/scalable"
cp -r "$HOME/Material-UI-Icon-Theme/actions" "$THEME_DIR/scalable/"
cp -r "$HOME/Material-UI-Icon-Theme/apps" "$THEME_DIR/scalable/"
cp -r "$HOME/Material-UI-Icon-Theme/devices" "$THEME_DIR/scalable/"
cp -r "$HOME/Material-UI-Icon-Theme/emblems" "$THEME_DIR/scalable/"
cp -r "$HOME/Material-UI-Icon-Theme/mimetypes" "$THEME_DIR/scalable/"
cp -r "$HOME/Material-UI-Icon-Theme/places" "$THEME_DIR/scalable/"
cp -r "$HOME/Material-UI-Icon-Theme/status" "$THEME_DIR/scalable/"

echo "Done!"
echo "How to set it as your icon pack:"
echo "Go to Settings -> Colors & Themes -> Icons -> Material UI"
echo "Note: This icon pack is still a work in progress, so some icons may be missing."

exit 0
