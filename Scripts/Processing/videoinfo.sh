#!/bin/bash
cd /mnt/d/original

touch durations.txt
for f in {1..100};do
	if [[ -d $f ]];then
		cd ./$f
		shopt -s nullglob
		for file in *;do	
           		echo $f >> /mnt/d/original/durations.txt
			ffmpeg -i $file 2>&1 | grep "Duration" >> /mnt/d/original/durations.txt  
		done
		cd /mnt/d/original
	fi
done
