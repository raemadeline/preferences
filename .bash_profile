FILE="$(dirname "${BASH_SOURCE[0]}")/.git-completion.bash"
if [ -f $FILE ]; then
   source $FILE
else
   echo "File $FILE does not exist."
fi

#setup PROMPT_COMMAND, which gets run before each prompt is printed
#save the return code for later use in my prompt
#this needs to be at the start of the command, so it needs to be last
#in the list
PROMPT_COMMAND="RET=$?;${PROMPT_COMMAND}"
export PROMPT_COMMAND
#setup my PROMPT
if [[ -n "$PS1" ]] ; then
  #setup some useful colors
  export RED="\[\033[0;31m\]"
  export GREEN="\[\033[0;32m\]"
  export YELLOW="\[\033[0;33m\]"
  export CYAN="\[\033[1;36m\]"
  export GRAY="\[\033[0;37m\]"
  export BLUE="\[\033[1;34m\]"
  export NO_COLOR="\[\033[0m\]"
  #generate fields that aren't going to change, so they can be set once
  export YEAR=`date +%Y`
  function success-color {
  if [[ $1 -eq 0 ]] ; then
    #GREEN
    echo -ne "\033[0;32m"
  else
    #RED
    echo -ne "\033[0;31m"
  fi
  }
  #start with an empty line
  PS1="\n"
  # Choose a color based on whether the last command succeeded or not
  PS1="$PS1"'$([[ ${?:-0} -eq 0 ]] && echo "\033[0;32m" || echo "\033[0;31m")'
  # add the time, date, user@host and full path
  PS1="$PS1[\t \d $YEAR] $YELLOW\u$NO_COLOR@$BLUE${HOSTNAME%.facebook.com} $CYAN\w"
  # add the basename, the git branch the history number and the $ symbol
  PS1="$PS1\n\W $GREEN"'$(git branch 2> /dev/null | grep \'*' | cut -c 3-)'" $RED\! $NO_COLOR\$ "
  export PS1
fi

# Directory aliases
cd() { builtin cd "$@"; pwd; ls -AG; } # Always list directory contents upon 'cd'
alias cd..='cd ../'               # Go back 1 directory level (for fast typers)
alias ..='cd ../'                 # Go back 1 directory level
alias ...='cd ../../'             # Go back 2 directory levels
alias .3='cd ../../../'           # Go back 3 directory levels
alias .4='cd ../../../../'        # Go back 4 directory levels
alias .5='cd ../../../../../'     # Go back 5 directory levels
alias .6='cd ../../../../../../'  # Go back 6 directory levels
alias ls='ls -AG'

# Editing and Saving Bash Configuration
alias edit='atom'
alias s='source'
alias bp='~/.bash_profile'
alias brc='~/.bashrc'
alias editbp='edit ~/.bash_profile'
alias sbp='source ~/.bash_profile'
alias editbrc='edit ~/.bashrc'
alias sbrc='source ~/.bashrc'
alias catbp='cat ~/.bash_profile'
alias catbrc='cat ~/.bashrc'

__git_complete gco _git_checkout
__git_complete gmerge __git_merge
__git_complete gp _git_pull
__git_complete gb _git_branch

# Messaging Aliases
alias weather='curl https://wttr.in/Brooklyn+NY?1FuQ'

# Git aliases
DEFAULT_BRANCH=${DEFAULT_BRANCH:-master}
alias gs='git status --short --branch'
alias gl='git --no-pager log --color --pretty=format:"%C(yellow)%h%C(reset)%C(bold red)%d%C(reset) %s %C(black)— %an (%ad)%C(reset)" --abbrev-commit --relative-date | emojify | less --RAW-CONTROL-CHARS'
alias gd='git diff'
alias gdc='git show $COMMIT'
alias gdsc='git show --name-status $COMMIT'
alias gdb='git diff origin/$DEFAULT_BRANCH $(git rev-parse --abbrev-ref HEAD)'
alias gp='git pull'
alias gpr='git pull --rebase origin' #must include branch name
alias gprb='git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)'
alias gprm='git pull --rebase origin $DEFAULT_BRANCH'
alias gri='git rebase -i $DEFAULT_BRANCH'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias amend='git commit -a --amend'
alias gst='git stash'
alias gsta='git stash apply'
alias gco='git checkout'
alias gcom='git checkout $DEFAULT_BRANCH && git branch'
alias gb='git branch'
alias gcm='git add . && git commit -m' #must include commit message
alias gcp='git cherry-pick'
alias gpb='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpfb='git push -f origin $(git rev-parse --abbrev-ref HEAD)'
alias gmerge='git merge --no-commit --ff-only' #must include branch name
alias greset='git reset --hard HEAD~1'
