#!/bin/bash

# Funkcja wyświetlająca dzisiejszą datę
show_date() {
  date "+%Y-%m-%d"
}

# Funkcja tworząca pliki error
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