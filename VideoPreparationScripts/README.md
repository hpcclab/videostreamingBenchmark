This folder contains some script that were used to prepare the dataset.


# FFMpeg
FFmpeg is a tool of choice in our video processing.
Download:
https://ffmpeg.org/download.html

Basic usage:
ffmpeg -i (inputfile) (OPTIONS) (outputfile)
where inputfile and outputfile are path to the input and output files.

OPTIONS are the specification to make change to the video

OPTIONS example:
-vf scale=1280:720      to change resolution to 1280x720
-r 24                   to change framerate to 24fps
-b:v 64k                to change bit rate to 64kbps
-vf hue=s=0             to apply video filter setting hue and saturation=0 (make it black and white)
-vcodec libx265         to changing codec of the video to h265

there can be multiple options together, example:
ffmpeg -i INPUT.mp4 -vf scale=854:480 -r 24 -vcodec libx265 -acodec copy -copyts output${f}.ts -y

# Video Splitting and Standardization
Refers to Split_and_Standardize folder, there are two main ways to split video in multiple segments.

# Video Splitting and Standardization based on Shell script loops. 
1.) ShellLoop/split.sh use for shell script to call FFmpeg multiple times. Each time it specify a specific starting point in the video, then generate a two second long segment from that time stamp. This is the script that generate dataset #2
example ffmpeg command where it output segment number 3 of video number 44 is: 
ffmpeg -i 44.mp4 -ss 6 -t 2 output3.ts

1.1) From dataset #2, shellLoop/standardize.sh convert such video into standardized format.
To standardize file 'output3.ts' as 'standardoutput3.ts', ffmpeg command is 
ffmpeg -y -i output3.ts -vf scale=1280:720 -vcodec libx264 -acodec copy -b:v 4.500M -r 30 standardoutput3.ts

# Video Splitting and Standardization based on FFmpeg automated video split. 
2.) Alternatively, automated video split function of ffmpeg can be used. This one call of ffmpeg command generate multiple .ts video files and also a manifest file (.m3u8). The manifest file is required by HLS players to pley the video.
ffmpeg -i 44.mp4 -profile:v baseline -level 3.0 -start_number 0 -hls_time 2 -hls_list_size 0 -f hls video.m3u8

However, there are two problems with the command above: (1) The segment aren't split at 2 seconds interval because there are no key frame available at that point of the original video. (2) It only work with some certain video format of the original video. Therefore, it is preferable to split video in two steps. First, the video are converted to suitable format (with key frame inserted regularly) as an intemediate file. Then we split the video from the intermediate file. 

Therefore an exaple to split the video are:
ffmpeg -y -i 44.mp4 tmp.mp4 -force_key_frames expr:'gte(t,n_forced*2)'
ffmpeg -i tmp.mp4 -profile:v baseline -level 3.0 -start_number 0 -hls_time 2 -hls_list_size 0 -force_key_frames expr:'gte(t,n_forced*2)' -f hls video.m3u8

This command is used in FFmpegAutomatedSplit/standardized_split.sh and FFmpegAutomatedSplit/originalformat_split.sh

After running file splits, it is a good idea to verify number of files created through miscScript/countfilesinfolder.sh or count only .ts file with counttsfile.sh
