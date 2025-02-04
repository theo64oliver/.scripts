#!/usr/bin/env bash

if [[ "$1" == cd* ]]; then
  dir_name=$(basename "$PWD" | tr . _)

  if tmux has-session -t "$dir_name" 2>/dev/null; then
    echo Attaching the tmux session "$dir_name"
    tmux attach -t "$dir_name"
  fi
fi
