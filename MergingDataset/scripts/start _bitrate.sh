#!/bin/bash

function ffmpeg_2b(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        #adr=$1"/"$file
        time ffmpeg -i ${1}"/"${file} -b 384K -maxrate 600K output1.ts -b 512K -maxrate 800K output2.ts -y
    done
}

function ffmpeg_3b(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        #adr=$1"/"$file
        time ffmpeg -i ${1}"/"${file} -b 384K -maxrate  600K output1.ts -b 512K -maxrate 800K output2.ts -b 768K -maxrate 1M output3.ts -y
    done
}

function ffmpeg_4b(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        #adr=$1"/"$file
        time ffmpeg -i ${1}"/"${file}  -b 384K -maxrate  500K output1.ts -b 512K -maxrate 700K output2.ts -b 768K -maxrate 1M output3.ts -b 1024K -maxrate 1400K output4.ts -y
    done
}

function ffmpeg_5b(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
        #adr=$1"/"$file
        time ffmpeg -i ${1}"/"${file} -b 384K -maxrate 500K output1.ts -b 512K -maxrate 700K output2.ts -b 768K -maxrate 1M output3.ts -b 1024K -maxrate 1400K output4.ts -b 1536K -maxrate 1800K output5.ts -y
    done
}

function ffmpeg_base_b(){
    for file in `ls $1`
    do
	echo input: ${1}"/"${file}
	echo operator: -b 384
        time ffmpeg -i ${1}"/"${file} -b 384K -maxrate 500K output1.ts -y 

	echo input: ${1}"/"${file}
	echo operator: -b 512
	time ffmpeg -i ${1}"/"${file}  -b 512K -maxrate 700K output2.ts -y

	echo input: ${1}"/"${file}
	echo operator: -b 768
	time ffmpeg -i ${1}"/"${file} -b 768K -maxrate 1M output3.ts -y

	echo input: ${1}"/"${file}
	echo operator: -b 1024
	time ffmpeg -i ${1}"/"${file} -b 1024K -maxrate 1400K output4.ts -y

	echo input: ${1}"/"${file}
	echo operator: -b 1536
	time ffmpeg -i ${1}"/"${file} -b 1536K -maxrate 1800K output5.ts -y
    done
}





dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_2b $dir) >& ${i}_2b #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_3b $dir) >& ${i}_3b #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_4b $dir) >& ${i}_4b #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_5b $dir) >& ${i}_5b #ONLY CHANGE THIS PART OF CODE
    fi
done

dir=.
for i in `ls ${dir}`
do
    if [ -d ${i} ]
    then
	dir=`pwd`"/"$i
	(ffmpeg_base_b $dir) >& ${i}_base_b #ONLY CHANGE THIS PART OF CODE
    fi
done

