cd /home/anne/Standard
pwd
for file in {1..100} ; do
	if [[ -d $file ]] ; then
		cd ./$file
		pwd
		for f in *.txt ;do
			if [[ -f $f ]]; then
				pwd
				mv $f /home/anne/VMbenchmarkingCC/$file
			fi
		done
		cd /home/anne/Standard
	fi	
	
done

