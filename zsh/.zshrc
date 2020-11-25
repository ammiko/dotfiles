# General Settings
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd
bindkey -e
autoload -U colors && colors
autoload -U compinit

# Completions Settings
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char
# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/autojump/autojump.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Setting Defaults
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export PATH=”$HOME/.emacs.d/bin:$PATH”

# Setting Aliases
alias e="nvim"
alias p="sudo pacman"
alias ls='ls --color=auto'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# Starship Prompt Settings
eval "$(starship init zsh)"
