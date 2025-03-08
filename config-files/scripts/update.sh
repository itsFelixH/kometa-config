#!/bin/bash

basePath="$HOME/Kometa"
pythonVenvPath="$basePath/kometa-venv/bin/python"

movieLibrary="Filme"
seriesLibrary="Serien"

####### KOMETA #######

get_updates() {
  sudo apt-get update -y
  sudo apt-get upgrade -y
  sudo apt-get autoremove -y
  sudo apt-get autoclean -y
}

update_plextraktsync() {
  plextraktsync self-update
}

all() {
  get_updates
  update_plextraktsync
}


######## MENU ########

show_main_menu() {
  echo "Main Menu:"
  echo
  echo "1: all (2+3)"
  echo "2: get updates (apt-get update, apt-get upgrade)"
  echo "3: update plextraktsync (plextraktsync self-update)"
  echo
  echo "Q: Exit"

  read -p "Enter Value: " selection

  case "$selection" in
    1) all ;;
    2) get_updates ;;
    3) update_plextraktsync ;;
    q) exit ;;
    Q) exit ;;
    *) echo "Invalid selection. Please try again." ;;
  esac
}


######## MAIN ########

show_main_menu

read -p "Press any key to exit..."