
cd /mnt/d/anne/Baremetalexperiment

for file in {1..100};do
	if [[ -d $file ]]; then
		cd ./$file
		rm codecDuration.txt
	fi
	cd ..
done
