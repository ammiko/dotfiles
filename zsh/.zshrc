# Autostart
fortune | lolcat
# General Settings
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd
bindkey -e
autoload -U compinit
# Completions Settings
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
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
# Setting Aliases
alias e="nvim"
alias p="sudo pacman"
alias ls='ls --color=auto'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
# Starship Prompt Settings
eval "$(starship init zsh)"
