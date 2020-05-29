cd /mnt/d/Splits 

#Conversion to standardized format FR: 30, BR: 4500, RESO : 1280x720 CODEC: H.265

for file in {33..100};do
	if [[ -d $file ]]; then
		cd ./$file
		for f in output{1..400}.ts;do 
			if [[ -f $f ]];then
				ffmpeg -y -i $f -vf scale=1280:720 -vcodec libx265 -acodec copy -b:v 4.500M -r 30 standard$f
			fi 
		done
		cd ..
	fi
done
