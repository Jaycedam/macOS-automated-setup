#!/bin/bash

# Restore .config folder backup
echo -e "${ARROW}Restoring .config folder..."
cp -R -v -i ${BACKUP_DIR}/.config $HOME

# WM settings
echo -e "${ARROW}Restoring Amethyst settings..."
cp -v -i ${BACKUP_DIR}/com.amethyst.Amethyst.plist "$PREFERENCES_DIR"

# VSCodium settings and extensions
# Makes sure directory exist, if not, create it
mkdir -p "$VSC_SETTINGS"
# Copy settings.json
cp "$SCRIPT_DIR/$BACKUP_DIR/settings.json" "$VSC_SETTINGS"
# Install Extensions from the backup list vsc-extensions.txt
cat "$SCRIPT_DIR/$BACKUP_DIR/vsc-extensions.txt" | xargs -L 1 codium --install-extension

# Developer folder for projects
echo -e "${ARROW}Creating Developer folder..."
mkdir -p $HOME/Developer