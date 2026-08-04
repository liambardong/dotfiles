# Dotfiles

My personal configuration files for tmux, neovim, and ghostty.

## Contents

- `tmux.conf` - tmux configuration
- `nvim/` - Neovim configuration (LazyVim)
- `ghostty/` - Ghostty terminal configuration

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
