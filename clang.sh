#!/usr/bin/env bash

BLUE="\e[34m"
ENDCOLOR="\e[0m"
RED="\e[31m"

apply_clang() 
{
	local directory=$1
	local prefix=$2

	c=".c"
	h=".h"
  cc=".cc"
  hh=".hh"
  hxx=".hxx"

	local children=($(ls $directory))

	for i in "${!children[@]}"; do 
		local child="${children[$i]}"
		local file="$directory/$child" 

		if [ -d "$file" ]; then
			apply_clang "$file" "${prefix}$child_prefix"
		elif [[ "$file" == *"$c" ]] || [[ "$file" == *"$h" ]] || [[ "$file" == *"$cc" ]] || [[ "$file" == *"$hh" ]] || [[ "$file" == *"$hxx" ]]; then
			clang-format -style=file -i "$file""${prefix}$child_prefix"
			echo -e "${BLUE}"Clang Applied to ""$file""${prefix}$child_prefix"${ENDCOLOR}"
		fi
	done
}

apply_clang "." ""
