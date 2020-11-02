set - o vi

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
PATH=$PATH:$HOME/.rvm/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias hist='$( history -w /dev/stdout | sort | uniq | fzf --reverse )'

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
#export http_proxy=http://shubovich:474290@proxy.bolid.ru:3128/
#export https_proxy=$http_proxy

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

#Promt statement change:
# https://wiki.archlinux.org/index.php/Bash/Prompt_customization_(Русский)
# http://gahcep.github.io/blog/2012/07/28/unix-bash-shell-prompt/
# http://forum.ubuntu.ru/index.php?topic=56010.0


files=(".bash_colors")
path="$HOME/"
for file in ${files[@]}
do
  file_to_load=$path$file
  if [ -f "$file_to_load" ];
  then
    . $file_to_load
    echo "loaded $file_to_load"
  fi
done

PS1="\[$Green\]\u@\h \[$Yellow\]\w \[$ColorReset\]\n\$ "


[ -f ~/.fzf.bash ] && source ~/.fzf.bash


export GOROOT=$HOME/go_root
export GOPATH=$HOME/go_path
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

