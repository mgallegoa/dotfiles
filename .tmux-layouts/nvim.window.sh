# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/nvim"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "nvim"

# Split window into panes.
#split_v 20
split_h 40

# Run commands.
run_cmd "cd $HOME/.config/nvim/" 0 # runs in active pane 0
run_cmd "nvim init.lua" 0

run_cmd "cd $HOME/.local/share/nvim/undo" 1 # runs in active pane 1
run_cmd "ll -h" 1 

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
select_pane 0
