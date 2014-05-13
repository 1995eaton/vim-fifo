#!/bin/sh

FIFO="/tmp/vim-run_fifo"

cleanup() {
  rm -f $FIFO
  return $?
}

main() { 
  if [[ -e $FIFO ]]; then
    rm -r $FIFO
  fi
  mkfifo $FIFO
  trap cleanup SIGINT
  tail -f $FIFO
}

main
