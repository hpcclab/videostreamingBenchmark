In this folder contains three sub folder: "scripts, "Codec class" and "VIC class" according to the paper "Evaluating and Predicting the Impact of Merging Video Processing Micro-Services on CloudResource Usage".

Codec class: contains 3 subfolders which each of them have two xls files that save the execution time of merged and non merged transcoding. Task merging in this case are performed with the same operation only. There is also "merge across operations.xls" which save the data from where tasks from multiple operations within VIC class are merged together.

VIC class: contains 3 subfolders which each of them represent transcoding time of each of the codec (HEVC, mpeg, VP9).
Both as a single task and merged task.

The structure of this dataset is based on the work: "Evaluating and Predicting the Impact of MergingVideo Processing Micro-Services on CloudResource Usage"

NOTE: data collected in this benchmark are performed on our own local cloud (a DELL PowerEdge R830 with 4×Intel Xeon E5-4628Lv4 processors with 112 homogeneous cores, 384 GB memory (24×16 GB DRAM), and RAID1 (2×900 GB HDD) storage.) 

This dataset is prepared to find merge saving percentage (relative percentage between merge and non merge counter part), therefore the absolute execution time on any particular machine are less of the importance.
