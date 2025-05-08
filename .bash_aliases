# Use \cp to ignore cp alias
# v: verbose, show the action
# i: interrogate, show to confirm the action
# r: recursive, copy/remove in recursive
# p: parent, create parent directories
# some more ls aliases
alias cp='cp -vir' # copy files/dir in verbose and ask to confirm
# To check the type of session use: echo $XDG_SESSION_TYPE (x11 or wayland)
alias xc="xclip -selection clipboard" # Copy to the clipboard using xclip (paste add -o). for x11. isomorphic_copy
alias wc="wl-copy" # Copy to the clipboard using wl-clipboard. for Wayland. echo $XDG_SESSION_TYPE (wayland)
alias wp="wl-paste" # Copy to the clipboard using wl-clipboard. for Wayland.
alias tc="echo 'Use Ctrl+b and ], to copy from tmux paste-buffer. Use Shift + Insert to copy from local clipboard.'"
alias te="tmux show-buffer > $DATA_GIT_PROJECTS_DIR/clipboard" # external Send the paste-buffer to a file in the shared volume
alias ti="scp -P 22 ip172-18-0-6-d08jgsiim2rg00a73v00@direct.labs.play-with-docker.com:/root/mgallegoa/clipboard $DATA_GIT_PROJECTS_DIR/clipboard" # internal Paste clipboard file from remote host, for example PWD Play With Docker
alias mv='mv -vi' # move in verbose and ask to confirm
alias mkdir='mkdir -vp' # mkdir verbose and create parent
alias df='df -h' # disk free for humans
alias ll='ls -CF --group-directories-first' # -C: columns, F: add / for directories. Show first the directories
alias la='ls -a --group-directories-first' # -a: list all (included hidden). Show first the directories
alias l='ls -alFh --group-directories-first' # Detailed list for all directories and h: human size. Show first the directories
alias l.='ls -alFhd .[^.]* --group-directories-first' # Show only hidden files/folders (ls | grep "^\.")
alias l.d='ls -alFh .[^.]* --group-directories-first' # Show only hidden files/folders and content inside of directories
alias ..="cd .. && l"
alias ...="cd ../../ && l"
alias 3.="cd ../../../ && l"
alias lx='axe -bghHliS' # This is a program to replace ls
alias ld='lsd -hA --group-dirs first' # Replace ls, more configurable
alias l-yacy="cd yacy && ./startYACY.sh" # Need to install Yacy Engine via terminal from Yacy website

# Git
alias g-config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME" # Set the git configuration
alias g-name="git config --global user.name 'Manuel Arias'" # Git configuration for the user.name
alias g-restart-agent='eval "$(ssh-agent -s)"' # Restart the ssh agent
alias g-add-agent='ssh-add ' # To add the private key to the agent
alias g-show-remote='git remote -v ' # Show the URLs used for push and pull
alias g-set-remote='git remote set-url origin ' # Set the remote URL for the repo
alias gt="git status"
alias gl="git log --graph --decorate --oneline" # Show only the logs id and commit messages

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
alias tfa="tmuxifier load-session tfa_portfolioManuel" # Personal project portfolio Manuel
alias tfb="tmuxifier load-session tfb_conceptProbes" # Personal project concept probes
alias tfc="tmuxifier load-session tfc_configurations" # Open the configurations (nvim, tmux, bash, kitty, telescope media files)

# DOCKER COMMANDS
# Edit docker deamon
alias d-deamon="nvim /etc/docker/daemon.json" # {  "dns": ["8.8.8.8", "8.8.4.4"] }
alias d-restart="sudo systemctl restart docker"
alias d-additional="${HOME}/setup-tools/setup-tools-manuel-additional.sh"

# Internet: Check internet status and IP
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias extip="curl icanhazip.com"
alias ip="curl ipinfo.io"
alias fun-ip="/sbin/ip --brief addr show" # Show the ip. /sbin/ip route show (route -n : to see the routes table)
alias fun-check-net="nslookup google.com" # Show info about the IPv4 and IPv6. Other tool: dig google.com (/etc/networks)
alias fun-traceroute="traceroute google.com" # Network tools: ethtool, netstat, nmap, tcpdump, iptraf, mtr, dig

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

# Java
alias ij="sdk install java 21.0.6-tem"

# Node
alias ts-eslint="pnpm add --save-dev eslint @eslint/js typescript typescript-eslint" # install typescript+eslint https://typescript-eslint.io/getting-started/
alias ts-node-prettier="pnpm add --save-dev eslint @eslint/js typescript typescript-eslint prettier eslint-config-prettier globals" # Install dev dependencies for a backend node project
alias eslint-config="pnpm create @eslint/config" # Run the config https://eslint.org/docs/latest/use/getting-started (npm init @eslint/config)
alias ts-node="npx tsc --init --rootDir src --outDir dist --strict --target ES2022 --module NodeNext --moduleResolution NodeNext --esModuleInterop --resolveJsonModule --allowUnreachableCode false" # For Node typescript project. https://json.schemastore.org/tsconfig

# Fun stuffs
alias c="clear"
alias fun-touchm="touch file{1..5}" # create 5 files with name file1, file2 .. file5
alias fun-backup='rsync --progress -try-run' # Efficient than cp, chunk file, copy into network rsync someone@host. Recursive -r
alias fun-file-types='file *' # Show the type of each file in the directory
alias fun-find-file='find / -name "*.conf*" | grep db' # to find a configuration file for db
alias fun-find-file-time="find / -ctime 3" # to find files with change of 3 days. -cmin, -amin and -mmin for minutes
alias fun-find-file-size="find / -size +10M" # to find files with size more than 10 Megabit's
alias fun-find-file-type="sudo find . -type d -maxdepth 1" # to find files with size more than 10 Megabit's
alias fun-less-numLine="less -N " # Show one screen of the file, with space the next screen. N number line. less -30
alias fun-tail="tail -f " # Show the file and load the append text
alias fun-sed="echo 'Demostrate Power Of Sed' | sed 's/\(\b[A-Z]\)/\(\1\)/3g'" # Stream EDitor: sed -f scriptFile <file> scripts commands over file
alias fun-awk="awk -F: '{print \"name: \" \$1 \"          shell: \" \$7}' /etc/passwd | head -10" # Utility and powerful interpreted language. -F: option to separate by column. awk -f scriptfile file
alias fun-file-manipulation="sort -k 3 /etc/passwd" # sort, uniq, paste, join, split. Sort starting from line 3, use -r to reverse
alias fun-transform="echo 'This is for Testing tr' | tr [:space:] '\n'" # cat city | tr a-z A-Z From file city, transform the lower case to uppercase in the city file
alias fun-previous-commad="!!" # run the most recent command
alias fun-previous-history="!2" # history command show the number of the command
alias fun-history-add-time='HISTTIMEFORMAT="%Y-%m-%d %T "' # add the date/time to the history
alias fun-matrix="cmatrix" # nice matrix effect in console
alias fun-tail-logs="tail -f /var/log/syslog" # show system logs
alias fun-delete-big-file="truncate -s 0 bigFile.txt" # Warning, delete the file content
alias fun-output-in-column="mount | column -t" # easy to read the output
alias fun-purge="dpkg -l | grep '^rc' | awk '{print $2}' | xargs sudo apt-get purge -y" # Purge the unused packages in linux
alias fun-variables="printenv" # Show a list of environment variables.
alias fun-clipboard-ui="ps aux | grep -E 'copyq|clipman|parcellite|gpaste|glipper|klipper|clipit'" # BSD Style. Check if exist clipboard ui.
alias fun-ps="ps auxf" # all processes, display user-oriented format, show processes that aren't attached to ttys, use full-format listing"
alias fun-ps-sr="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -10" # list top 10 cpu-intensive processes
alias fun-psmem="ps auxf | sort -nr -k 4" # get top process eating memory
alias fun-psmem10="ps auxf | sort -nr -k 4 | head -10" # get top 10 process eating memory
alias fun-pscpu="ps auxf | sort -nr -k 3" # get top process eating CPU
alias fun-pscpu10="ps auxf | sort -nr -k 3 | head -10" # get top 10 process eating CPU
alias fun-show-foreground='fg' # to sent a program to background press Ctrl+z. Use bg to back ground process Ctrl+c to stop
alias fun-load-average="w" # Load Average. Other ways: uptime and top. Last 3 numbers are: first is the percentage of use in the last minute, second is for last five minutes utilization and third is for last fifteen minutes utilization; if more than one CPU divide the value for the number of CPUs.
alias fun-jobs="jobs -l" # Show PIDs of jobs
alias fun-pstree="pstree" # Show the parents and child process
alias fun-tar="tar -cvzf" # c: create new archive, v: verbose, z: filger gzip, f: use file
alias fun-bash-options="shopt" # Show_options: display bash options settings
alias fun-top="top" # h: List of keys. f: Enter top configuration screen. t: Display/hide summary rows 2 and 3. m: Display/hide memory rows 4 and 5. A: Sort by resources consumers. r: renice or change the priority of process. k: Kill process. o: Interactively new sort order. 1: to see the processors
alias fun-shcedule="at" # Schedule at now + 2 days. To remove use atrm 103 (using atq to see number of schedule)
alias fun-shcedule-time="cron" # Schedule table utility program use a cron configuration in /etc/crontab file. Each line contain 6 fields: MIN: Minutes (0 to 59), HOUR: (0 to 23), DOM: Day of Month (1-31), MON: Month (1-12), DOW: Day Of Week (0-6, 0:Sunday), CMD: Any command to executed
alias fun-sleep="sleep" # Delay or suspended by time, sleep NUMBER[SUFFIX]. Default (s)econds, (m)inutes, (h)ours, (d)ays
alias fun-user-add="sudo useradd -m -c 'User Name' user_name" # Create user with default files in /etc/skel folder. less /etc/default/useradd to defaults
alias fun-user-change-pass="sudo passwd user_name" # Change the password or create a new one for the user_name user
alias fun-groups="tail -15 /etc/group" # Delay the first 15 user group (tail -15 /etc/passwd) (sudo useradd user_name /etc/skel)
alias fun-groups-modify="sudo /usr/sbin/usermod -a -G anewgroup manuel" # Add user manuel to the anewgroup (groups manuel)
alias fun-groups-removeUsr="sudo /usr/sbin/usermod -G manuel manuel" # Remove user manuel from the group. (sudo -h)
alias fun-history-commands="set | grep HIST" # Show the current config values for history
