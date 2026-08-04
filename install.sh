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
backup_and_link "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"
mkdir -p "$HOME/.tmux"
backup_and_link "$DOTFILES_DIR/dayfox.tmux.conf" "$HOME/.tmux/dayfox.tmux.conf"
backup_and_link "$DOTFILES_DIR/terafox.tmux.conf" "$HOME/.tmux/terafox.tmux.conf"

# ghostty
backup_and_link "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"

# neovim
backup_and_link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

echo "Done! Dotfiles installed."
