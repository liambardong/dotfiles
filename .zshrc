# ~/dotfiles/.zshrc — shared across all machines, tracked in git.
# Machine-specific stuff (PATH exports, work-only tools) goes in
# ~/.zshrc.local instead, which is NOT tracked here.
# See zshrc.local.example for the template.

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source "$ZSH/oh-my-zsh.sh"

[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
