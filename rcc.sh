#!/bin/bash
count=$#
a=0
b=1
c=2
d="s"
if [ $count -eq $a ]
then
	echo "**** Welcome to Rocky2 Compiler!!! ****"
	./rocky2
elif [ $count -eq $b ]
then
	echo "**** Compile and save as $1.pd ****"
	cat $1 | ./rocky2 > $1.pd
elif [ $count -eq $c ]
then
	echo "**** Compile and save as $2.pd ****"
	cat $1 | ./rocky2 > $2.pd
else
	echo "Wrong number of arguments!!!\n"
fi
