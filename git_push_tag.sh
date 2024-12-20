#! /bin/sh

BLUE="\e[34m"
ENDCOLOR="\e[0m"
RED="\e[31m"

msg="$1"
tag="$2"

if [ "$msg" = "help" ]; then
	echo "You need help, let me help you"
	# Help status, send the help page of gpt
	cat ~/.scripts/help_gpt.txt
	exit 0
elif [ "$#" -lt 2 ]; then 
	echo "gpt: Use: gpt <message> <tag> [<files_to_add>]"
else
	~/.scripts/clang.sh

	if [ "$#" -eq 2 ]; then
		git add *
	else
		shift 2
		for i in "$@"; do 
			git add "$i"
		done
	fi

	git commit -m "$msg"
	if [ $? -eq 1 ]; then
		echo -e "${GREEN}Files already committed, sending Tag.${ENDCOLOR}"
	fi
	git tag -a "$tag" -m "$msg"
	git push --follow-tags
fi


# IDEAS TO ADD :
#	- Check if the commit has already been done and tag if yes
