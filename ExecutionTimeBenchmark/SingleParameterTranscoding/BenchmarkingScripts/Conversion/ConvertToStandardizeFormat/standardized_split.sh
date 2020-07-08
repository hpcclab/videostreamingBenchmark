#need manual handling of 79, 72
#79 need to add -pix_fmt yuv420p as an option on first step
#72 is originally ts file
for file in {1..100};do
	if [[ -d $file ]]; then
		cd ./$file
       #convert mov to tmp
			if [[ -f $file.mov ]];then
                echo $file.mov
				ffmpeg -y -i $file.mov -vf scale=1280:720 -vcodec libx264 -b:v 4.500M -r 30 tmp.mp4 -force_key_frames expr:'gte(t,n_forced*2)'
            fi
       #convert mp4 to tmp
			if [[ -f $file.mp4 ]];then
                echo $file.mp4
				ffmpeg -y -i $file.mp4 -vf scale=1280:720 -vcodec libx264 -b:v 4.500M -r 30 tmp.mp4 -force_key_frames expr:'gte(t,n_forced*2)'
            fi
       #convert avi to tmp
			if [[ -f $file.avi ]];then
                echo $file.avi
				ffmpeg -y -i $file.avi -vf scale=1280:720 -vcodec libx264 -b:v 4.500M -r 30 tmp.mp4 -force_key_frames expr:'gte(t,n_forced*2)'
            fi
       #convert 3gp to tmp
			if [[ -f $file.3gp ]];then
                echo $file.3gp
				ffmpeg -y -i $file.3gp -vf scale=1280:720 -vcodec libx264 -b:v 4.500M -r 30 tmp.mp4 -force_key_frames expr:'gte(t,n_forced*2)'
            fi
       #convert mkv to tmp
			if [[ -f $file.mkv ]];then
                echo $file.mkv
				ffmpeg -y -i $file.mkv -vf scale=1280:720 -vcodec libx264 -b:v 4.500M -r 30 tmp.mp4 -force_key_frames expr:'gte(t,n_forced*2)'
            fi
        #split tmp
                ffmpeg -i tmp.mp4 -profile:v baseline -level 3.0 -start_number 0 -hls_time 2 -hls_list_size 0 -force_key_frames expr:'gte(t,n_forced*2)' -f hls video.m3u8
                rm $file.mov $file.mp4 $file.avi $file.mkv $file.3gp tmp.mp4 
		cd ..
    fi
done
