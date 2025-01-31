#!/bin/bash

show_menu() {
  local options=("$@")
  for i in "${!options[@]}"; do
    echo "$((i + 1))) ${options[i]}"
  done
}

get_user_choice() {
  read -p "Seleccione una opción: " choice
  if [[ ! $choice =~ ^[0-9]+$ ]]; then
    echo "Por favor, ingrese un número válido."
    return 1
  fi
  return $choice
}
