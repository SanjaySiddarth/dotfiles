#!/bin/bash

set -e

# Update these for your own repo + preferred install location
DOTFILES_REPO="https://github.com/yourusername/dotfiles.git"
INSTALL_DIR="$HOME/.dotfiles"

echo "🌐 Cloning dotfiles repo..."
if [ -d "$INSTALL_DIR" ]; then
    echo "⚠️ $INSTALL_DIR already exists. Pulling latest changes..."
    git -C "$INSTALL_DIR" pull
else
    git clone "$DOTFILES_REPO" "$INSTALL_DIR"
fi
