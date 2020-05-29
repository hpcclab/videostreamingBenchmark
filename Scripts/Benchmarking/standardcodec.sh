cd /mnt/c/Users/ytann/Desktop/work
#forCodecExperiment

for file in {1..100};do
	if [[ -d $file ]]; then
		cd ./$file
		pwd
		touch codecDuration.txt
		echo CONVERSION OF CODEC TO H.264 and VP9 for standard format >> codecDuration.txt
		for i in {1..20}; do
			for f in output{1..300}.ts;do
				if [[ -f $f ]];then
					echo       >>codecDuration.txt
					(time ffmpeg -i $f -vcodec libx264 -acodec copy h264$f) |& grep -e real -e user -e sys >>codecDuration.txt
					echo GOP $f h.264>> codecDuration.txt 
					echo        >> codecDuration.txt
					(time ffmpeg -i $f -vcodec libvpx-vp9 -acodec copy vp9$f) |& grep -e real -e user -e sys >>codecDuration.txt
					echo GOP $f vp9 >> codecDuration.txt 
					echo        >> codecDuration.txt
				fi
			done
			echo ------------------------------------------------- >> codecDuration.txt
		done
		cd ..
	fi
done
