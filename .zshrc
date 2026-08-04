# ~/dotfiles/.zshrc — shared across all machines, tracked in git.
# Machine-specific stuff (PATH exports, work-only tools) goes in
# ~/.zshrc.local instead, which is NOT tracked here.
# See zshrc.local.example for the template.

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bureau"
plugins=(git z ruby rails zsh-history-substring-search fzf)
source "$ZSH/oh-my-zsh.sh"

alias vim='nvim'

bindkey "^r" history-incremental-search-backward

[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
