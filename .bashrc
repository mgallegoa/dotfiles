# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# Note: Just welcome one time per reboot. To set per session put in .profile or .bash_profile file
if [ ! -f /tmp/.welcome_manuel ]; then
  echo "##############################################################"
  echo "#                                                            #"
  echo "#   ███╗░░░███╗░█████╗░███╗░░██╗██╗░░░██╗███████╗██╗░░░░░    #"
  echo "#   ████╗░████║██╔══██╗████╗░██║██║░░░██║██╔════╝██║░░░░░    #"
  echo "#   ██╔████╔██║███████║██╔██╗██║██║░░░██║█████╗░░██║░░░░░    #"
  echo "#   ██║╚██╔╝██║██╔══██║██║╚████║██║░░░██║██╔══╝░░██║░░░░░    #"
  echo "#   ██║░╚═╝░██║██║░░██║██║░╚███║╚██████╔╝███████╗███████╗    #"
  echo "#   ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚══════╝╚══════╝    #"
  echo "#                                                            #"
  echo "# Welcome to my personal configuration.                      #"
  echo "# To see the list of the alias, write alias in the console.  #"
  echo "# This configuration is located in the repository:           #"
  echo "# https://www.github.com/mgallegoa/dotfiles                  #"
  echo "# !!Enjoy!!                                                  #"
  echo "##############################################################"
  touch /tmp/.welcome_manuel

  # echo -e "\033[0;36m"
  # echo ""
  # echo "   ▀▄   ▄▀  "
  # echo -e "  ▄█▀███▀█▄  \033[1;31m \033[0;36m Manuel personal configurations. Enjoy!!!"
  # echo " █▀███████▀█"
  # echo " ▀ ▀▄▄ ▄▄▀ ▀"
  # echo ""
  # echo -e "\033[m"
fi

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# https://zserge.com/posts/tmux/
# Added to support 256 colors for use kitty + tmux (tmux-256color)
# export TERM=xterm-kitty
# export TERM=screen-256color
export TERM=xterm-256color
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    # PS1='\[\033[1;33m\]\u\]\[\033[1;37m\]@\[\033[1;32m\]\h \[\e[1;36m\][\l] \[\033[1;31m\][\w] \n\[\033[1;31m\]>> \[\033[00m\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="di=01;34:tw=05;34:ln=35:so=01;33:pi=01;32:ex=31"
    # Show the colors in console
    #for i in {30..37}; do for j in {40..47}; do echo -e "\e[${i};${j}m fg=$i bg=$j \e[0m"; done; done 
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias rg='rg --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Set language utf-8 (this is default for Ubuntu but not for DevContainer debian)
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# GIT : Configure the color for diff
git config --global color.diff.frag "yellow bold"
git config --global color.diff.new "cyan bold"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
    complete -cf sudo # Enable completion for sudo
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
    complete -cf sudo # Enable completion for sudo
  fi

fi

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
# export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
# export BASH_IT_DEVELOPMENT_BRANCH='master'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# If your theme use command duration, uncomment this to
# enable display of last command duration.
#export BASH_IT_COMMAND_DURATION=true
# You can choose the minimum time in seconds before
# command duration is displayed.
#export COMMAND_DURATION_MIN_SECONDS=1

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
#source "$BASH_IT"/bash_it.sh

# PLAY WITH COWSAY - COWTHINK: generate random messages. Require cowsay, fortune. cowsay -l -> to see list of images
# dir='/usr/share/cows/'
# file=`/bin/ls -1 "$dir" | sort --random-sort | head -1`
# cow=$(echo "$file" | sed -e "s/\.cow//")
# fortune -a | cowsay -f $cow

# EXTRACT function to extract files.
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjfv $1     ;;
        *.tar.gz)    tar xzfv $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xfv $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Nvim add to PATH
export PATH="/opt/manuel/nvim-linux64-v0.10.2/bin/nvim:$PATH"
export EDITOR="nvim"
# Set vi mode in BASH Shell
# set -o vi

# RIPGREP
export PATH="/opt/ripgrep-14.1.0-x86_64-unknown-linux-musl/:$PATH"

# Terminal kitty
export PATH="$HOME/.local/kitty.app/bin/kitty:$PATH"

# Tmux : Configure specific tmux version
export PATH="/opt/manuel/tmux-v3.4/bin/tmux:$PATH"

# Tmuxifier for configure sessions in tmux
export PATH="/opt/manuel/tmuxifier/bin:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
if command -v tmuxifier >/dev/null 2>&1; then
  eval "$(tmuxifier init -)"
fi

# Note: When running from devContainer, the variable exist
if [ -z "${DATA_GIT_PROJECTS_DIR:-}" ]; then
  export DATA_GIT_PROJECTS_DIR="/media/manuel/Datos/mgallegoa"
fi

# Node Version Manager NVM
export NVM_DIR="/opt/manuel/nvm-v0.39.7"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Custon theme catppuccin from oh-my-posh
export PATH="$HOME/.local/bin:$PATH"
#export POSH_THEME="blueish"
export POSH_THEME="night-owl"
eval "$(oh-my-posh --init --shell bash --config $HOME/.cache/oh-my-posh/themes/$POSH_THEME.omp.json)"

# Data Bases DBeaver UI Client
export PATH="/opt/dbeaver:$PATH"

# Chafa
export PATH="/opt/manuel/chafa-1.14.5-1-x86_64-linux-gnu:$PATH"

# Turso
export PATH="$HOME/.turso:$PATH"

# DEPRECATED USE: isomorphic in combination with xclip to use the clipboard between host and docker
# export ISOCP_USE_FILE=1
# export PATH="~/isomorphic_copy/bin:$PATH"

# Oracle CLI
[[ -e "/home/manuel/oracle-cli/lib/python3.12/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/home/manuel/oracle-cli/lib/python3.12/site-packages/oci_cli/bin/oci_autocomplete.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export SDKMAN_DIR="/opt/manuel/sdkman"
 [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
