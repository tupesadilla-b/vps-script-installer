#!/bin/bash

get_public_ip() {
  curl -s ifconfig.me
}

get_private_ip() {
  hostname -I | awk '{print $1}'
}

check_port() {
  local port=$1
  if nc -zv 127.0.0.1 "$port" &>/dev/null; then
    echo "Ocupado"
  else
    echo "Disponible"
  fi
}
