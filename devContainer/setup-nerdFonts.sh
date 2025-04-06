#!/bin/bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

# FONT_NAME="MesloLGS"
FONT_NAME="Meslo"
FONT_VARIANT="Nerd Font Mono"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT_NAME}.tar.xz"
declare -x INSTALL_DIR="$HOME/.local/share/fonts"

mkdir -p "$INSTALL_DIR"

echo "NERD-FONTS : Downloading $FONT_NAME..." | tee -a $HOME/setup.log
curl -fLo "${FONT_NAME}.zip" "$FONT_URL"
TAR_FILE=$(unzip -l "${FONT_NAME}.zip" | awk '{print $4}' | grep '\.tar\.xz$')

# Unzip to font directory
echo "NERD-FONTS : Installing $FONT_NAME $FONT_VARIANT to $INSTALL_DIR" | tee -a $HOME/setup.log
unzip -ol "${FONT_NAME}.zip" -d "$INSTALL_DIR"
tar -xf $TAR_FILE -d "$INSTALL_DIR"

# Clean up
rm "${FONT_NAME}.zip"
rm ${TAR_FILE}

# Refresh font cache
echo "NERD-FONTS : Refreshing font cache..." | tee -a $HOME/setup.log
fc-cache -fv "$INSTALL_DIR"

echo "NERD-FONTS : ${FONT_NAME} ${FONT_VARIANT} installed!." | tee -a $HOME/setup.log
