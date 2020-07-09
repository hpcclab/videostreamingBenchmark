cd /mnt/d/Experiments/results

for i in {1..100}; do
	if [[ -d $i ]]; then
		cd $i
		touch datarealCod.txt
		grep 'real' codecDuration.txt >>datarealCod.txt
	fi
	cd ..
done

