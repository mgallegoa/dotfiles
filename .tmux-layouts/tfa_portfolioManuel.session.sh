# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/portfolio_Manuel"

# Constant for the data git directorie with all the projects
if [ ! -e "$DATA_GIT_PROJECTS_DIR" ]; then
  readonly DATA_GIT_PROJECTS_DIR="/media/manuel/Datos/mgallegoa/"
fi

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "tfa_portfolioManuel"; then

  # Load a defined window layout.
  #load_window "example"
  # Create a new window inline within session layout definition.
  new_window "Portfolio Manuel"

  run_cmd "cd $DATA_GIT_PROJECTS_DIR/mgallegoa.github.io"
  run_cmd "nvim index.html"


  new_window "Sunnyside Agency"
  
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/mgallegoa.github.io/fem/sunnyside-agency-landing-page-main"
  run_cmd "nvim index.html"


  new_window "Order Summary"
 
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/mgallegoa.github.io/fem/order-summary-component-main"
  run_cmd "nvim index.html"


  new_window "Blog Card"
 
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/mgallegoa.github.io/fem/blog-preview-card-main"
  run_cmd "nvim index.html"

  new_window "5 SignUp"
 
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/mgallegoa.github.io/fem/5_N_intro-component-with-signup-form-master"
  run_cmd "nvim index.html"

  new_window "6 FyloPage"
 
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/mgallegoa.github.io/fem/6_J_fylo-dark-theme-landing-page-master"
  run_cmd "nvim index.html"


  new_window "Movie Express MVC"
 
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/mgallegoa.github.io/vanillaJS/basic_express_movies_mvc"
  run_cmd "nvim src/index.mjs"

  new_window "Chat Express Sockets"
 
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/mgallegoa.github.io/vanillaJS/basic_chat_sockets"
  run_cmd "nvim README.md"



  # Select the default active window on session creation.
  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
