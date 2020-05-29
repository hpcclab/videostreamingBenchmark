cd /mnt/c/Users/ytann/Desktop/work
#forBITRATEexperiment

for file in {1..100};do
	if [[ -d $file ]]; then
		cd ./$file
		pwd
		touch bitrateDuration.txt
		echo CONVERSION OF BITRATE TO 2400BIT and 3400BIT for standard format >> bitrateDuration.txt
		for i in {1..20}; do
			for f in output{1..300}.ts;do
				if [[ -f $f ]]; then
					echo         >> bitrateDuration.txt
					( time ffmpeg -i $f -b:v 3.4M 3400bit$f) |& grep -e real -e user -e sys >>bitrateDuration.txt
					echo GOP $f 3400bitrate >> bitrateDuration.txt
					echo         >> bitrateDuration.txt
					( time ffmpeg -i $f -b:v 2.4M 2400bit$f) |& grep -e real -e user -e sys >>bitrateDuration.txt
					echo GOP $f 2400bitrate >> bitrateDuration.txt
					echo         >> bitrateDuration.txt
				fi
			done
			echo --------------------------------------------- >> bitrateDuration.txt
		done
		cd ..
	fi
done 

