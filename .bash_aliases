# Use \cp to ignore cp alias
# v: verbose, show the action
# i: interrogate, show to confirm the action
# r: recursive, copy/remove in recursive
# p: parent, create parent directories
# some more ls aliases
alias cp='cp -vir'
alias mv='mv -vi'
alias mkdir='mkdir -vp'
alias ll='ls -CF'
alias la='ls -A'
alias l='ls -alFh'
alias lx='axe -bghHliS' # This is a program to replace ls
alias ld='lsd -hA --group-dirs first' # Replace ls, more configurable
alias l-yacy="cd yacy && ./startYACY.sh" # Need to install Yacy Engine via terminal from Yacy website

# Git
alias g-name="git config --global user.name 'Manuel Arias'"
alias g-config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

# Neovim
alias nvim='/opt/manuel/nvim-linux64-v0.10.2/bin/nvim '
alias nv='nvim '

# Terminal kitty
alias k="$HOME/.local/kitty.app/bin/kitty"
alias ki="$HOME/.local/kitty.app/bin/kitten icat"
alias ks="$HOME/.local/kitty.app/bin/kitten ssh"
alias kd="$HOME/.local/kitty.app/bin/kitten diff"

# Tmux : Configure specific tmux version
alias tmux='/opt/manuel/tmux-v3.4/bin/tmux'

# Tmuxifier to configure tmux sessions
alias tfa="tmuxifier load-session tfa_portfolioManuel"
alias tfb="tmuxifier load-session tfb_conceptProbes"
alias tfc="tmuxifier load-session tfc_configurations"

# DOCKER COMMANDS
# Edit docker deamon
alias d-deamon="nvim /etc/docker/daemon.json" # {  "dns": ["8.8.8.8", "8.8.4.4"] }
alias d-restart="sudo systemctl restart docker"

# Internet: Check internet status and IP
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias extip="curl icanhazip.com"
alias ip="curl ipinfo.io"

# Hotspotshield : Free VPN
alias hs='hotspotshield status'
alias hil='hotspotshield connect il'
alias hd='hotspotshield disconnect'
alias hsg='hotspotshield connect sg'
alias hl='hotspotshield locations'
alias hus="hotspotshield connect us"
alias usphx="hotspotshield connect phx"

# sudo apt install youtube-dl
# youtube-dl : For download videos from Youtube and other
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# Fun stuffs
alias fun-touchm="touch file{1..5}" # create 5 files with name file1, file2 .. file5
alias fun-find-file='find / -name "*.conf*" | grep db' # to find a configuration file for db
alias fun-previous-commad="!!" # run the most recent command
alias fun-previous-history="!2" # history command show the number of the command
alias fun-history-add-time='HISTTIMEFORMAT="%Y-%m-%d %T "' # add the date/time to the history
alias fun-show-back-ground='fg' # to sent a program to background press Ctrl+z 
alias fun-matrix="cmatrix" # nice matrix effect in console
alias fun-tail-logs="tail -f /var/log/syslog" # show system logs
alias fun-delete-big-file="truncate -s 0 bigFile.txt" # Warning, delete the file content
alias fun-output-in-column="mount | column -t" # easy to read the output
