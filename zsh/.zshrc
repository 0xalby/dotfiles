bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^B" backward-kill-word
bindkey "^N" kill-word
bindkey "^H" backward-kill-line
bindkey "^J" kill-line

autoload -U colors && colors
PS1="%{$(tput setaf 10)%}%n@%m%{$(tput sgr0)%}:%{$(tput setaf 39)%}%~%{$(tput sgr0)%}$ "
stty stop undef
setopt interactive_comments

HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$HOME/.zhistory"
setopt inc_append_history

export BROWSER="thorium-browser"
export EDITOR="vim"

alias ls="ls --group-directories-first -gh"
alias grep='grep --color=auto'
alias objdump='objdump -M intel'
alias ss="ss -l -n -t"

PATH="$PATH:$HOME/go/bin"
PATH="$PATH:$HOME/path"
export PATH

# plugins
source $HOME/.colored.zsh

# birthdays
if [[ $(date +%d-%m) == "22-06" ]] ; then 
    echo "Happy birthday!"
fi
