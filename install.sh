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

# zsh
backup_and_link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
if [ ! -e "$HOME/.zshrc.local" ]; then
    cp "$DOTFILES_DIR/zshrc.local.example" "$HOME/.zshrc.local"
    echo "Created $HOME/.zshrc.local from template — edit it for this machine."
fi

# tmux
# Theme files are read directly from $DOTFILES_DIR by tmux-dark-notify,
# so they don't need symlinking. See tmux.conf and ./set-theme.
backup_and_link "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"

# ghostty
backup_and_link "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"

# neovim
backup_and_link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# set-theme helper script
mkdir -p "$HOME/.local/bin"
backup_and_link "$DOTFILES_DIR/set-theme" "$HOME/.local/bin/set-theme"

echo "Done! Dotfiles installed."
