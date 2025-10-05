#!/bin/sh
printf '\033c\033]0;%s\a' Ball Game
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Ball Game.x86_64" "$@"
