cd /mnt/c/Users/ytann/Desktop/work
#forFRAMERATEexperiment

for file in {1..100}; do
	if [[ -d $file ]]; then
		cd ./$file
		pwd
		touch framerateDuration.txt
		echo CONVERSION OF FRAMERATE TO 60FRAMERATE and 24FRAMERATE standard format>> framerateDuration.txt
		for i in {1..20}; do
			for f in output{1..300}.ts;do
				if [[ -f $f ]];then
					echo             >>framerateDuration.txt
					(time ffmpeg -y -i $f -r 60 60frame$f) |& grep -e real -e user -e sys >> framerateDuration.txt
					echo GOP $f 60frame >> framerateDuration.txt
					echo             >>framerateDuration.txt
					(time ffmpeg -y -i $f -r 24 24frame$f) |& grep -e real -e user -e sys >> framerateDuration.txt
					echo GOP $f 24frame >> framerateDuration.txt
					echo             >>framerateDuration.txt
				fi
			done
			echo ------------------------------------------------ >> framerateDuration.txt 
		done

		cd ..
	fi
done
