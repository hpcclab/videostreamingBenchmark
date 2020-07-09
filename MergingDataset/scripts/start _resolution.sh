#!/bin/bash

function ffmpeg_2s(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        #adr=$1"/"$file
        time ffmpeg -i ${1}"/"${file} -s 352*288 output1.ts -s 680*320 output2.ts -y
    done
}

function ffmpeg_3s(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        #adr=$1"/"$file
        time ffmpeg -i ${1}"/"${file} -s 352*288 output1.ts -s 680*320 output2.ts -s 720*480 output3.ts -y
    done
}

function ffmpeg_4s(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        #adr=$1"/"$file
        time ffmpeg -i ${1}"/"${file} -s 352*288 output1.ts -s 680*320 output2.ts -s 720*480 output3.ts -s 1280*800 output4.ts -y
    done
}

function ffmpeg_5s(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        #adr=$1"/"$file
        time ffmpeg -i ${1}"/"${file} -s 352*288 output1.ts -s 680*320 output2.ts -s 720*480 output3.ts -s 1280*800 output4.ts -s 1920*1080 output5.ts -y
    done
}

function ffmpeg_base_s(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
	echo operator: -s 352*288
        time ffmpeg -i ${1}"/"${file} -s 352*288 output1.ts -y 

	echo input: ${1}"/"${file}
	echo operator: -s 680*320
	time ffmpeg -i ${1}"/"${file} -s 680*320 output2.ts -y

	echo input: ${1}"/"${file}
	echo operator: -s 720*480
	time ffmpeg -i ${1}"/"${file} -s 720*480 output3.ts -y

	echo input: ${1}"/"${file}
	echo operator: -s 1280*800
	time ffmpeg -i ${1}"/"${file} -s 1280*800 output4.ts -y

	echo input: ${1}"/"${file}
	echo operator: -s 1920*1080
	time ffmpeg -i ${1}"/"${file} -s 1920*1080 output5.ts -y
    done
}





dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_2s $dir) >& ${i}_2s #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_3s $dir) >& ${i}_3s #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_4s $dir) >& ${i}_4s #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_5s $dir) >& ${i}_5s #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_base_s $dir) >& ${i}_base_s #ONLY CHANGE THIS PART OF CODE
    fi
done

