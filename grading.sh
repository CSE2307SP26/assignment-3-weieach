#!/bin/bash

EXP_OUTPUT=$1
STU_OUTPUT=$2
SCORE=0

while read LINE
do
	git clone https://github.com/CSE2307SP26/$LINE.git 
	cd $LINE
	git checkout cipher
	git checkout 'master@{2026-02-12 10:00:00}'
	javac Cipher.java
	java Cipher
	if [[ -f $STU_OUTPUT ]]
	then
	if [[ $(cat $STU_OUTPUT)==$(cat $EXP_OUTPUT) ]]	
	then
	SCORE=1
	else
	SCORE=0	
	fi
	else
	SCORE=0
	fi
	echo $LINE ": " $SCORE 
	cd .. 
done
