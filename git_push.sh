#! /bin/sh

if [ "$#" -ne 1 ]; then 
	echo "gp : Use as : gp <message>"
else
	git add *
	git commit -m "$1"
	git push
fi
