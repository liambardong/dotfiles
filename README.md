# Dotfiles

My personal configuration files for neovim and ghostty.

## Contents

- `nvim/` - Neovim configuration (LazyVim)
- `ghostty/` - Ghostty terminal configuration
- `.zshrc` - zsh configuration (machine-specific bits go in `~/.zshrc.local`)
- `set-theme` - switches Ghostty and Neovim to a theme family, e.g. `set-theme tokyonight`

## Installation

### On a new machine

1. Clone this repository:
   ```bash
   git clone git@github.com:liambardong/dotfiles.git ~/dotfiles
   ```

2. Run the install script:
   ```bash
   cd ~/dotfiles
   chmod +x install.sh
   ./install.sh
   ```

The script will backup any existing configs (adding `.backup` suffix) and create symlinks.

## Syncing changes

### After making changes on one machine:
```bash
cd ~/dotfiles
git add -A
git commit -m "Update configs"
git push
```

### To pull changes on another machine:
```bash
cd ~/dotfiles
git pull
```

Changes take effect immediately since configs are symlinked.
