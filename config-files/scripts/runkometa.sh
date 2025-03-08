#!/bin/bash

basePath="$HOME/Kometa"
pythonVenvPath="$basePath/kometa-venv/bin/python"

movieLibrary="Filme"
seriesLibrary="Serien"

# Config Location      -c/--config      KOMETA_CONFIG¶
# Run Immediately      -r/--run      KOMETA_RUN

# Collections Only      -co/--collections-only      KOMETA_COLLECTIONS_ONLY
# Metadata Only      -mo/--metadata-only      KOMETA_METADATA_ONLY
# Playlists Only      -po/--playlists-only      KOMETA_PLAYLISTS_ONLY
# Operations Only      -op/--operations-only      KOMETA_OPERATIONS_ONLY
# Overlays Only      -ov/--overlays-only      KOMETA_OVERLAYS_ONLY

# Run Collections      -rc/--run-collections      KOMETA_RUN_COLLECTIONS
# Run Libraries      -rl/--run-libraries      KOMETA_RUN_LIBRARIES
# Run Files      -rf/--run-files      KOMETA_RUN_FILES

# Ignore Schedules      -is/--ignore-schedules      KOMETA_IGNORE_SCHEDULES

# Delete Collections      -dc/--delete-collections      KOMETA_DELETE_COLLECTIONS
# Delete Labels      -dl/--delete-labels      KOMETA_DELETE_LABELS


####### KOMETA #######

install_req() {
  $pythonVenvPath -m pip install -r $basePath/requirements.txt
}

run_kometa() {
  $pythonVenvPath $basePath/kometa.py -r
}

run_all() {
  $pythonVenvPath $basePath/kometa.py -r -is
}

delete_collections() {
  $pythonVenvPath $basePath/kometa.py -r -dc -co -is
}

# TV Shows
run_series_complete() {
  $pythonVenvPath $basePath/kometa.py -r -rl $seriesLibrary -is
}

run_series_metadata() {
  $pythonVenvPath $basePath/kometa.py -r -mo -rl $seriesLibrary -is
}

run_series_collections() {
  $pythonVenvPath $basePath/kometa.py -r -co -rl $seriesLibrary -is
}

run_series_overlays() {
  $pythonVenvPath $basePath/kometa.py -r -ov -rl $seriesLibrary -is
}

# Movies
run_movies_complete() {
  $pythonVenvPath $basePath/kometa.py -r -rl $movieLibrary -is
}

run_movies_metadata() {
  $pythonVenvPath $basePath/kometa.py -r -mo -rl $movieLibrary -is
}

run_movies_collections() {
  $pythonVenvPath $basePath/kometa.py -r -co -rl $movieLibrary -is
}

run_movies_overlays() {
  $pythonVenvPath $basePath/kometa.py -r -ov -rl $movieLibrary -is
}


######## MENU ########

show_main_menu() {
  echo "Main Menu:"
  echo
  echo "1: Run Kometa (kometa -r)"
  echo "2: Run Kometa - ignore schedules (kometa -r -is)"
  echo
  echo "3: Movies"
  echo "4: TV Shows"
  echo
  echo "5: Install requirements for Kometa"
  echo "6: Plex Image Cleanup"
  echo
  echo "7: Delete ALL Collections"
  echo
  echo "Q: Exit"

  read -p "Enter Value: " selection

  case "$selection" in
    1) run_kometa ;;
    2) run_all ;;
    # libraries
    3) show_movie_menu ;;
    4) show_series_menu ;;
    # config
    5) run_cleanup ;;
    6) install_req ;;
    # other
    7) delete_collections ;;
    q) exit ;;
    Q) exit ;;
    *) echo "Invalid selection. Please try again." ;;
  esac
}

show_series_menu() {
  clear
  echo "Library TV Shows:"
  echo "1: Shows Full Update (kometa -r -rl)"
  echo "2: Shows Metadata Update (kometa -r -mo -rl)"
  echo "3: Shows Collection Update (kometa -r -co -rl)"
  echo "4: Shows Overlay Update (kometa -r -ov -rl)"
  echo "Q: Exit"

  read -p "Enter Value: " selection

  case "$selection" in
    1) run_series_complete ;;
    2) run_series_metadata ;;
    3) run_series_collections ;;
    4) run_series_overlays ;;
    q) exit ;;
    Q) exit ;;
    *) echo "Invalid selection. Please try again." ;;
  esac
}

show_movie_menu() {
  clear
  echo "Library Movies:"
  echo "1: Movies Full Update (kometa -r -rl)"
  echo "2: Movies Metadata Update (kometa -r -mo -rl)"
  echo "3: Movies Collection Update (kometa -r -co -rl)"
  echo "4: Movies Overlay Update (kometa -r -ov -rl)"
  echo "Q: Exit"

  read -p "Enter Value: " selection

  case "$selection" in
    1) run_movies_complete ;;
    2) run_movies_metadata ;;
    3) run_movies_collections ;;
    4) run_movies_overlays ;;
    q) exit ;;
    Q) exit ;;
    *) echo "Invalid selection. Please try again." ;;
  esac
}


######## MAIN ########

show_main_menu

read -p "Press any key to exit..."