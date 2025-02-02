#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/Desktop/ING2/ ~/Desktop/ING3/ -mindepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    echo bye
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(ps -aux | grep tmux)

if [[ -z $tmux_running ]]; then
  echo bye
  exit 1
fi

if tmux has-session -t=$selected_name 2> /dev/null; then
    tmux attach-session -t$selected_name
else
  tmux new-session -s $selected_name -c $selected
fi

tmux switch-client -t $selected_name
