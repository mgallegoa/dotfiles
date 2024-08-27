# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/VanillaJavaScript"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "VanillaJavaScript"

# Split window into panes.
split_h 65
split_h 50
split_v 40

# Run commands.
run_cmd "cd /media/manuel/Datos/mgallegoa/conceptsProbes/VanillaJavaScript" 0
run_cmd "cd /media/manuel/Datos/mgallegoa/conceptsProbes/VanillaJavaScript" 1 
run_cmd "cd /media/manuel/Datos/mgallegoa/conceptsProbes/VanillaJavaScript" 2
run_cmd "cd /media/manuel/Datos/mgallegoa/conceptsProbes/VanillaJavaScript" 3
run_cmd "nvim indexAppNotes.html" 0
run_cmd "nvim indexAppSimpleRxJS.html" 1
run_cmd "nvim indexAppServices.html" 2
run_cmd "nvim Service.js" 3
# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
select_pane 0
