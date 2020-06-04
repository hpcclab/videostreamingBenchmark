
cd /mnt/d/original
touch otherinfo.txt
 for f in {1..100};do
	         if [[ -d $f ]];then
			     cd ./$f
			     shopt -s nullglob
			     for file in *;do
			         echo $f >> /mnt/d/original/otherinfo.txt
				 echo resolution: >> /mnt/d/original/otherinfo.txt
				 ffprobe -v error -select_streams v:0 -show_entries stream=height,width -of csv=s=x:p=0 $file >> /mnt/d/original/otherinfo.txt
				 echo framerate: >> /mnt/d/original/otherinfo.txt
				 ffmpeg -i $file 2>&1 | sed -n "s/.*, \(.*\) tbr.*/\1/p" >> /mnt/d/original/otherinfo.txt
				 echo codec: >> /mnt/d/original/otherinfo.txt
				 ffprobe -v error -select_streams v:0 -show_entries stream=codec_name \-of default=noprint_wrappers=1:nokey=1 $file >> /mnt/d/original/otherinfo.txt
				 echo                >> /mnt/d/original/otherinfo.txt
	                     done
			     cd /mnt/d/original
		 fi
done
