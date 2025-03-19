#! /bin/sh

BLUE="\e[34m"
ENDCOLOR="\e[0m"
RED="\e[31m"

msg="$1"

if [ "$msg" = "help" ]; then
	echo "You need help, let me help you"
	# Help status, send the help page of gp
	cat ~/.scripts/help_gp.txt
	exit 0
elif [ "$#" -lt 2 ]; then 
	echo "gp: Use: gp <message> [<files_to_add>]"
else
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
		echo -e "${GREEN}Files already committed.${ENDCOLOR}"
	fi
	git push
fi
