#!/bin/bash

enable_firewall() {
  ufw enable
}

open_port() {
  local port=$1
  ufw allow "$port"
}

close_port() {
  local port=$1
  ufw deny "$port"
}
