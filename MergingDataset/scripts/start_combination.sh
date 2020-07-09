#!/bin/bash

resolution=("-s 352*288" "-s 680*320" "-s 720*480")
bitrate=("-r 10" "-r 15" "-r 20")
codec=("-c:v libx265" "-c:v mpeg4" "-c:v libvpx-vp9")
#str=("-s 352*288" "-s 680*320" "-s 720*480" "-r 10" "-r 15" "-r 20" "-c:v libx265" "-c:v mpeg4" "-c:v libvpx-vp9")
str=("-c:v mpeg4")

function ffmpeg_test_1(){
i=0
j=0
while(($i<=1))
do
		for file in `ls $1`
		do
			echo input: $1"/"${file} 
			echo operation: ${str[${i}]} 
			time ffmpeg -i ${1}"/"${file} ${str[${i}]} output1.ts -y
			echo 
			echo
		done
	let "i++"
done
}

function ffmpeg_test_2(){
i=0
j=0
k=0		
while(($i<=8))
do
        j=`expr $i + 1`
        while(($j<=8))
        do
		k=`expr $j + 1`
		while(($k<=8))
		do
                	for file in `ls $1`
                	do
                        	echo input: $1"/"${file}
	                        echo operation1: ${str[${i}]}
        	                echo operation2: ${str[${j}]}
				echo operation3: ${str[${k}]}
				echo 
                	        time ffmpeg -i ${1}"/"${file} ${str[${i}]} output1.ts ${str[${j}]} output2.ts ${str[${k}]} output3.ts -y
                        	echo
                        	echo
                	done
			let "k++"
		done
		let "j++"
        done
        let "i++"
done
}


dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
        dir=`pwd`"/"$i
        #echo $dir
        #ffmpeg_r $dir
        (ffmpeg_test_1 $dir) >& ${i}_para1 #ONLY CHANGE THIS PART OF CODE
	#(ffmpeg_test_2 $dir) >& ${i}_para3
	#ffmpeg_test ${dir}
    fi
done

