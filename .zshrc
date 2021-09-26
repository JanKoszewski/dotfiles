#!/bin/bash

#-------
# THEME
#-------

ZSH_THEME="robbyrussell"

#---------
# PLUGINS
#---------

plugins=(
  git
  bundler
  dotenv
  osx
  rake
  rbenv
  ruby
  npm
  yarn
  vscode
  last-working-dir
  zsh-autosuggestions
)

#----------------------
# ENVIROMENT VARIABLES 
#----------------------

# Keep more history
export HISTSIZE=1000000
export HISTFILESIZE=1000000


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