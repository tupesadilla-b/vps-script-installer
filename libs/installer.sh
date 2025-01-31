#!/bin/bash

install_package() {
  local package=$1
  if dpkg -l | grep -q "$package"; then
    echo "$package ya está instalado."
  else
    apt-get update && apt-get install -y "$package"
  fi
}
