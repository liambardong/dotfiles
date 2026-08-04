#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

echo "Setting up dotfiles..."

# Create .config directory if it doesn't exist
mkdir -p "$HOME/.config"

# Backup existing configs and create symlinks
backup_and_link() {
    local src="$1"
    local dest="$2"
    
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "Backing up existing $dest to ${dest}.backup"
        mv "$dest" "${dest}.backup"
    elif [ -L "$dest" ]; then
        rm "$dest"
    fi
    
    ln -s "$src" "$dest"
    echo "Linked $src -> $dest"
}

# tmux
backup_and_link "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"

# ghostty
backup_and_link "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"

# neovim
backup_and_link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

echo "Done! Dotfiles installed."
