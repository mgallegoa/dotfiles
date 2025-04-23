# some more ls aliases
alias ll='ls -CF'
alias la='ls -A'
alias l='ls -alFh'

# some custom user alias
# alias for neovim
alias nvim='/opt/manuel/nvim-linux64-v0.10.2/bin/nvim '
alias nv='nvim '

# Terminal kitty
alias k="$HOME/.local/kitty.app/bin/kitty"
alias ke="$HOME/.local/kitty.app/bin/kitten"
alias kec="$HOME/.local/kitty.app/bin/kitten icat"
alias ks="$HOME/.local/kitty.app/bin/kitten ssh"

# Tmux : Configure specific tmux version
alias tmux='/opt/manuel/tmux-v3.4/bin/tmux'

# Tmuxifier to configure tmux sessions
alias tfa="tmuxifier load-session tfa_portfolioManuel"
alias tfb="tmuxifier load-session tfb_conceptProbes"
alias tfc="tmuxifier load-session tfc_configurations"

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

# DOCKER COMMANDS
# Edit docker deamon
alias d-deamon="nvim /etc/docker/daemon.json" # {  "dns": ["8.8.8.8", "8.8.4.4"] }
alias d-restart="sudo systemctl restart docker"
