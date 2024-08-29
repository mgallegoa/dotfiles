# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/portfolio_Manuel"

# Constant for the data git directorie with all the projects
if [ ! -e "$DATA_GIT_PROJECTS_DIR" ]; then
  readonly DATA_GIT_PROJECTS_DIR="/media/manuel/Datos/mgallegoa/"
fi

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "portfolio_Manuel"; then

  # Load a defined window layout.
  #load_window "example"
  # Create a new window inline within session layout definition.
  new_window "Portfolio Manuel"

  run_cmd "cd $DATA_GIT_PROJECTS_DIR/mgallegoa.github.io"
  run_cmd "nvim index.html"


  new_window "Sunnyside Agency"
  
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/mgallegoa.github.io/sunnyside-agency-landing-page-main"
  run_cmd "nvim index.html"


  new_window "Order Summary"
 
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/mgallegoa.github.io/order-summary-component-main"
  run_cmd "nvim index.html"

  # Select the default active window on session creation.
  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
