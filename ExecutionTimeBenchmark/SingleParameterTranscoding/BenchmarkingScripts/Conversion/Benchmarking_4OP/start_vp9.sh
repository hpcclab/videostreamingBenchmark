#!/bin/bash

function ffmpeg_2vp(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        echo combination: -s720*480+-c:v libvpx-vp9
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -c:v libvpx-vp9 output2.ts -y
	echo 

	echo input: ${1}"/"${file}
	echo combination:-c:v libvpx-vp9 +-b768
	time ffmpeg -i ${1}"/"${file} -c:v libvpx-vp9 output1.ts -b 768K -maxrate 1M output2.ts -y
	echo 

	echo input: ${1}"/"${file}
	echo combination: -r20+-c:v libvpx-vp9
	time ffmpeg -i ${1}"/"${file} -r 20 output1.ts -c:v libvpx-vp9 output2.ts -y
	echo
    done
}

function ffmpeg_3vp(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        echo combination: -s720*480+-c:v libvpx-vp9+b768K
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -c:v libvpx-vp9 output2.ts -b 768K -maxrate 1M output3.ts -y
	echo 

	echo input: ${1}"/"${file}
        echo combination: -s720*480+-c:v libvpx-vp9+r20
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -c:v libvpx-vp9 output2.ts -r 20 output3.ts -y
	echo

	echo input: ${1}"/"${file}
        echo combination: -r20+-c:v libvpx-vp9+b768K
        time ffmpeg -i ${1}"/"${file} -r 20 output1.ts -c:v libvpx-vp9 output2.ts -b 768K -maxrate 1M output3.ts -y
	echo
    done
}

function ffmpeg_4vp(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        echo combination: -s720*480+-r20+b768K+-c:v libvpx-vp9
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -r 20 output2.ts -b 768K -maxrate 1M output3.ts -c:v libvpx-vp9 output4.ts  -y
	echo 
    done
}


function ffmpeg_5vp(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        echo combination: -s720*480+-r20+b768K+-s1280*800+-c:v libvpx-vp9
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -r 20 output2.ts -b 768K -maxrate 1M output3.ts -s 1280*800 output4.ts -c:v libvpx-vp9 output5.ts -y
	echo 

	echo input: ${1}"/"${file}
        echo combination: -s720*480+-r20+b768K+-r30+-c:v libvpx-vp9
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -r 20 output2.ts -b 768K -maxrate 1M output3.ts -r 30 output4.ts -c:v libvpx-vp9 output5.ts -y
	echo 

	echo input: ${1}"/"${file}
        echo combination: -s720*480+-r20+b768K+-b1024k+-c:v libvpx-vp9
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -r 20 output2.ts -b 768K -maxrate 1M output3.ts -b 1024K -maxrate 1400K output4.ts -c:v libvpx-vp9 output5.ts -y
	echo

	echo input: ${1}"/"${file}
        echo combination: -s720*480+-r20+b768K+-s1280*800+-c:v libvpx-vp9
        time ffmpeg -i ${1}"/"${file} -s 720*480 output1.ts -r 20 output2.ts -b 768K -maxrate 1M output3.ts -s 1280*800 output4.ts -c:v libvpx-vp9 output5.ts -y
	echo 
    done
}


dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_2vp $dir) >& ${i}_2vp #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_3vp $dir) >& ${i}_3vp #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_4vp $dir) >& ${i}_4vp #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_5vp $dir) >& ${i}_5vp #ONLY CHANGE THIS PART OF CODE
    fi
done


