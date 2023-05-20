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

while [ $# -gt 0 ]
do
  case "$1" in
    -d|--date)
      show_date
      ;;
    -l|--logs)
      if [ -n "$2" ] && [ "$2" -eq "$2" ] 2>/dev/null; then
        create_logs $2
        shift
      else
        create_logs 100
      fi
      ;;
    -h|--help)
      show_help
      ;;
    -e|--error)
      if [ -n "$2" ] && [ "$2" -eq "$2" ] 2>/dev/null; then
        create_errors $2
        shift
      else
        create_errors 100
      fi
      ;;
    --init)
      git clone <adres_repozytorium> && export PATH=$PATH:$(pwd)
      ;;
    *)
      echo "Nieznana opcja: $1"
      show_help
      exit 1
      ;;
  esac
  shift
done