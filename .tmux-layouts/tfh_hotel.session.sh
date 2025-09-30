if initialize_session "tfh_hotel"; then

  new_window "Backend Hotel"
  run_cmd "cd ~/mgallegoa/hotel-spring/"
  run_cmd "nvim README.md"
  split_h 50
  run_cmd "cd ~/mgallegoa/hotel-spring/"
  run_cmd "mvn clean install spring-boot:run"

  new_window "Test Backend Hotel"
  run_cmd "cd ~/mgallegoa/hotel-spring/src/test"
  run_cmd "nvim ./java/com/co/manuel/hotel_spring/controllers/hotelRequest.http"

  new_window "Frontend Hotel"
  run_cmd "cd ~/mgallegoa/hotel-frontend-react/"
  run_cmd "nvim README.md"
  split_h 50
  run_cmd "cd ~/mgallegoa/hotel-frontend-react/"
  run_cmd "pnpm install && pnpm run dev"

new_window "Test Frontend Hotel"
  run_cmd "cd ~/mgallegoa/hotel-frontend-react/src/test"
  run_cmd "nvim "


  select_window 1


fi

finalize_and_go_to_session
