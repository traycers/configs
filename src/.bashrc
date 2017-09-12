# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Aliases for git
alias gst='git status'
alias ga='git add'
alias gall='git add -- .'
alias gc='git commit -m'
alias gp='git pull && git push'
alias gull='git pull'
alias gush='git push'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
# Show git branch
#export PS1='`__git_ps1 "%s"` \w $ '

#I need this at work
export http_proxy=http://shubovich:474290@proxy.bolid.ru:3128/
export https_proxy=$http_proxy

#Remove duplicates in history
#export HISTCONTROL="ignoredups"
#export HISTIGNORE="&:ls:[bf]g:exit"
#terminal don't save commands begin with s:
#export HISTIGNORE="s*"

#HISTORY SETTINGS:
#append commands:
shopt -s histappend
#PROMT_COMMAND=’history -a’
#set history's size:
HISTSIZE=1000
#set count of rows in history's file:
HISTFILESIZE=10000

#terminal write commands in history:
export HISTCONTROL=ignoredups

#переходить в каталог без cd
shopt -s autocd



#Show git branch:
function git-current-branch {
    git branch --no-color 2> /dev/null | grep \* | colrm 1 2
}
function set_prompt_line {
    local        BLUE="\[\033[0;34m\]"

    # OPTIONAL - if you want to use any of these other colors:
    local         RED="\[\033[0;31m\]"
    local   LIGHT_RED="\[\033[1;31m\]"
    local       GREEN="\[\033[0;32m\]"
    local LIGHT_GREEN="\[\033[1;32m\]"
    local       WHITE="\[\033[1;37m\]"
    local  LIGHT_GRAY="\[\033[0;37m\]"
    # END OPTIONAL
    local     DEFAULT="\[\033[0m\]"
    export PS1="$BLUE\w $LIGHT_RED[\$(git-current-branch)]$DEFAULT \$ "
}
#set_prompt_line

#Promt statement change:
# https://wiki.archlinux.org/index.php/Bash/Prompt_customization_(Русский)
# http://gahcep.github.io/blog/2012/07/28/unix-bash-shell-prompt/
