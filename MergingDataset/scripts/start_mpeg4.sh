#!/bin/bash

function ffmpeg_2mpeg4(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        echo combination: -s720*480+-c:v mpeg4
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -c:v mpeg4 output2.ts -y
	echo 

	echo input: ${1}"/"${file}
	echo combination:-c:v mpeg4 +-b768
	time ffmpeg -i ${1}"/"${file} -c:v mpeg4 output1.ts -b 768K -maxrate 1M output2.ts -y
	echo 

	echo input: ${1}"/"${file}
	echo combination: -r20+-c:v mpeg4
	time ffmpeg -i ${1}"/"${file} -r 20 output1.ts -c:v mpeg4 output2.ts -y
	echo
    done
}

function ffmpeg_3mpeg4(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        echo combination: -s720*480+-c:v mpeg4+b768K
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -c:v mpeg4 output2.ts -b 768K -maxrate 1M output3.ts -y
	echo 

	echo input: ${1}"/"${file}
        echo combination: -s720*480+-c:v mpeg4+r20
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -c:v mpeg4 output2.ts -r 20 output3.ts -y
	echo

	echo input: ${1}"/"${file}
        echo combination: -r20+-c:v mpeg4+b768K
        time ffmpeg -i ${1}"/"${file} -r 20 output1.ts -c:v mpeg4 output2.ts -b 768K -maxrate 1M output3.ts -y
	echo
    done
}

function ffmpeg_4mpeg4(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        echo combination: -s720*480+-r20+b768K+-c:v mpeg4
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -r 20 output2.ts -b 768K -maxrate 1M output3.ts -c:v mpeg4 output4.ts  -y
	echo 
    done
}


function ffmpeg_5mpeg4(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        echo combination: -s720*480+-r20+b768K+-s1280*800+-c:v mpeg4
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -r 20 output2.ts -b 768K -maxrate 1M output3.ts -s 1280*800 output4.ts -c:v mpeg4 output5.ts -y
	echo 

	echo input: ${1}"/"${file}
        echo combination: -s720*480+-r20+b768K+-r30+-c:v mpeg4
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -r 20 output2.ts -b 768K -maxrate 1M output3.ts -r 30 output4.ts -c:v mpeg4 output5.ts -y
	echo 

	echo input: ${1}"/"${file}
        echo combination: -s720*480+-r20+b768K+-b1024k+-c:v mpeg4
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -r 20 output2.ts -b 768K -maxrate 1M output3.ts -b 1024K -maxrate 1400K output4.ts -c:v mpeg4 output5.ts -y
	echo

	echo input: ${1}"/"${file}
        echo combination: -s720*480+-r20+b768K+-s1280*800+-c:v mpeg4
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -r 20 output2.ts -b 768K -maxrate 1M output3.ts -s 1280*800 output4.ts -c:v mpeg4 output5.ts -y
	echo 
    done
}


dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_2mpeg4 $dir) >& ${i}_2mpeg4 #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_3mpeg4 $dir) >& ${i}_3mpeg4 #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_4mpeg4 $dir) >& ${i}_4mpeg4 #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_5mpeg4 $dir) >& ${i}_5mpeg4 #ONLY CHANGE THIS PART OF CODE
    fi
done


