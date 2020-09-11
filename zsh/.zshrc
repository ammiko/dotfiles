HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd
bindkey -v
autoload -U colors && colors
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
bindkey -M menuselect 'h' vi-backward-char

bindkey -M menuselect 'k' vi-up-line-or-history

bindkey -M menuselect 'l' vi-forward-char

bindkey -M menuselect 'j' vi-down-line-or-history

bindkey -v '^?' backward-delete-char
# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export EDITOR="emacsclient -nw"
export VISUAL="emacsclient -nw"
alias e="emacsclient -nw"
alias p="sudo pacman"
alias ls='ls --color=auto'
[[ -s /home/lamp/.autojump/etc/profile.d/autojump.sh ]] && source /home/lamp/.autojump/etc/profile.d/autojump.sh
eval "$(starship init zsh)"