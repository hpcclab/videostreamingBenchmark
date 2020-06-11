#!/bin/bash

function ffmpeg_mpeg4(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        #adr=$1"/"$file
        time ffmpeg -i ${1}"/"${file} -c:v mpeg4 output1.ts -y
    done
}

function ffmpeg_vp9(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        #adr=$1"/"$file
        time ffmpeg -i ${1}"/"${file} -c:v libvpx-vp9 output2.ts  -y
    done
}


function ffmpeg_hevc(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        #adr=$1"/"$file
        time ffmpeg -i ${1}"/"${file} -c:v libx265 output3.ts -y
    done
}



dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_mpeg4 $dir) >& ${i}_base_mpeg4 #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_vp9 $dir) >& ${i}_base_vp9 #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_hevc $dir) >& ${i}_base_hevc #ONLY CHANGE THIS PART OF CODE
    fi
done

