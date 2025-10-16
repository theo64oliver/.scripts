#! /bin/bash

ctrl_c_trap() {
    tput setaf 1
    rm -rf /home/theo/.venv

    exit 0
}

trap 'ctrl_c_trap' SIGINT

if [ "$1" = "install" ]; then
  source /home/theo/.venv/bin/activate
  pip install "${@:2}"
else
  python3 -m venv /home/theo/.venv
  source /home/theo/.venv/bin/activate

  pip install notebook "$@"

  jupyter notebook
fi

