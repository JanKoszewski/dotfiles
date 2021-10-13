#-------------------
# CODESPACES DEFAULT
#-------------------

# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Codespaces bash prompt theme
__bash_prompt() {
    local userpart='`export XIT=$? \
        && [ ! -z "${GITHUB_USER}" ] && echo -n "\[\033[0;32m\]@${GITHUB_USER} " || echo -n "\[\033[0;32m\]\u " \
        && [ "$XIT" -ne "0" ] && echo -n "\[\033[1;31m\]➜" || echo -n "\[\033[0m\]➜"`'
    local lightblue='\[\033[1;34m\]'
    local removecolor='\[\033[0m\]'
    PS1="${userpart} ${lightblue}\w${removecolor} \$ "
    unset -f __bash_prompt
}
__bash_prompt
export PROMPT_DIRTRIM=4
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


#---------
# ALIASES 
#---------


# Navigation

alias lt="ls -ltra"
if [[ `uname -a` =~ Darwin ]]; then
    alias ls="ls -FCG"
else
    alias ls="ls -FC --color"
fi
alias ll="ls -l"
alias l='ls -la'
alias rm="rm -i"
alias llast='less `ls -tr1 | tail -1`'

# Compress the cd, ls -l series of commands.
alias lc='cl'
function cl () {
   if [ $# = 0 ]; then
      cd && ll
   else
      cd "$*" && ll
   fi
}

alias         ..='cd ..'
alias        ...='cd ../..'
alias       ....='cd ../../..'
alias      .....='cd ../../../..'
alias     ......='cd ../../../../..'
alias    .......='cd ../../../../../..'
alias   ........='cd ../../../../../../..'
alias  .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'


# Git/Version Control

alias sdl='git diff master --no-prefix | diff_painter.pl | less -R'
alias gdl='git diff --color-words'
alias gst='git status'
alias gs='git status'
alias grh='git fetch upstream; git reset --hard'
alias viall='vi `git diff --name-only HEAD`';
alias gco='git checkout'
alias gb='git branch'
alias gpom='git pull origin master'
alias gpain='git pull origin main'
alias gf='git fetch'
alias gl='git log'
alias gcm='git commit -m'
alias gp='git pull'
alias gd='git diff'
alias gbd='git branch -D'
alias stash='git checkout -b stash && git add . && git commit -m "stash"'
# Most frequent committers
alias gitcommiters="git ls-files | xargs -n1 git blame | ruby -n -e \"$_ =~ /^.*\((.*?)\s[\d]{4}/; puts $1.strip\" | sort -f | uniq -c | sort -n"


# Rails Helpers

alias rc='bundle exec rails console'
alias sc='bundle exec script/console'
alias fs='bundle exec foreman start'
alias rspek='bundle exec rspec'


# General

# Show most used commands that might be good candidates for aliases
alias mu='history | cut -d " " -f5 | sort | uniq -c | sort -nr | head -50'
# newly updated files in the last 5 minutes
alias nf='find . -cmin -5 -ls'
# Saving test output comes in handy
alias testme='dt=`date +%Y%m%d_%H_%M`; spec --color spec/**/*_spec.rb > spec_results_$dt &'
function tt () # tree top
{
    cwd=$(pwd)
    path_before_work=${cwd%/work/*}
    path_after_work=${cwd#*/work/}
    dir_within_work=${path_after_work%%/*}
    echo $path_before_work/work/$dir_within_work
}
alias drivespeed='dd if=/dev/zero of=test.file bs=1024k count=128 && rm -f test.file'
alias killdns="sudo killall -HUP mDNSResponder"
alias f='find . | grep'
alias remove-trailing-whitespace='perl -p -i -e "s/\s+\n$/\n/g" `find . -type f | grep -v .git`'
alias vi='vim'
alias bi='bundle install'
alias vim="mvim -v"
alias e='open -a "Sublime Text"'
alias subl='open -a "Sublime Text"'
alias atom='open -a "Atom"'