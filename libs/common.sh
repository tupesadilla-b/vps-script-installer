#!/bin/bash

msg_bar() {
  echo "========================================"
}

msg_info() {
  echo -e "\e[32m[INFO]\e[0m $1"
}

msg_error() {
  echo -e "\e[31m[ERROR]\e[0m $1"
}

check_root() {
  if [[ $EUID -ne 0 ]]; then
    msg_error "Este script debe ejecutarse como root."
    exit 1
  fi
}
