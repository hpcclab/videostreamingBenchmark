cd /home/hpcclab/VMbenchmark/Standard1

for i in {1..100};do
	if [[ -d $i ]];then
		cd $i
		for file in *.txt; do 
			mv $file /home/hpcclab/VMbenchmark/results/$i
		done
	cd ..
fi
done
