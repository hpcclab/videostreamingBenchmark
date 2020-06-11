cd /mnt/c/Users/ytann/Desktop

for i in {1..100};do
if [[ -d $i ]]; then
		cd ./$i
		for f in *.mp4 ; do
			if [[ -f $f ]];then
				for j in {0..200}; do
				 start=$[2 * $j]
	       	 		 num=$[$j +1 ]
				 ffmpeg -i $f -ss $start -t 2 output$num.ts
		  	 done
		 fi
	  	 done		
		cd ..	   
	fi
			
done 

 
