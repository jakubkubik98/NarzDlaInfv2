#!/bin/bash

show_date() {
  date "+%Y-%m-%d"
}
create_errors() {
  local count=$1
  local i=1
  while [ $i -le $count ]
  do
    mkdir -p error$i
    echo "Error $i" > error$i/error$i.txt
    echo "Created by: $0" >> error$i/error$i.txt
    echo "Date: $(show_date)" >> error$i/error$i.txt
    i=$((i+1))
  done
}
if [ $# -eq 0 ]; then
  show_help
  exit 0
fi