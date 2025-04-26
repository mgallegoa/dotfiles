# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "tfb_conceptProbes"; then

  # Create a new window inline within session layout definition.
  #new_window "VanillaJavaScript"

  # 1 Load a defined window for vanilla js layout project.
  load_window "vanillaJavaScript"

 # 2 Create a new window for the Sass and Bootstrap project
  new_window "Sass Bootstrap"
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/conceptsProbes/UsingSassBootstrap" 
  run_cmd "nvim index.html"

 # 3 Create a new window for the rest api with node project
  new_window "Rest API Node"
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/conceptsProbes/rest-api-node" 
  run_cmd "nvim src/app.js"

 # DEPRECATED PROJECT
 # 4 Create a new window for the React New Features project
  # new_window "React New Features"
  # run_cmd "cd $DATA_GIT_PROJECTS_DIR/conceptsProbes/reactnewfeatures"
  # run_cmd "nvim src/App.js"

 # 4 Create a new window for my development container
  new_window "dev-container"
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/dev-container/"
  run_cmd "nvim README.md"

 # 5 Create a new window for the csv load and search with Node and React project
  new_window "CSV file load"
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/csv-node-react/"
  run_cmd "nvim README.md"

 # 6 Create a new window for the java project, path exercise
  new_window "Java Path Exercise"
  run_cmd "cd $DATA_GIT_PROJECTS_DIR/conceptsProbes/java/PathExercise"
  run_cmd "nvim src/main/java/Exercise.java"


  # Select the default active window on session creation.
  select_window 5

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
