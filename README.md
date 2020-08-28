# Video Streaming Benchmark Dataset
This repository includes 100 videos that are gathered in a variety of content diversity (i.e. fast/slow pace, action, scenery, animation etc.) All 100 videos are represented in [1] their original form, [2] 2-second splitted video segments and finally, [3] 2-second splitted video segments that converted into the standardized format. [4] 2-second splitted video segments that converted into the standardized format which is also compatible with HLS video player. We also include their transcoding information and their task merging efficiency data. This dataset is collected for the project named "Evaluating and Predicting the Impact of Merging Video Processing Micro-Services on CloudResource Usage". For better illustrate the diversity of our benchmark, the Figure.1 shows the scene/object categories. The main content is focused on nature eviroments and human behaviors, which are the most common scene in our daily recorded.

![image](https://github.com/hpcclab/videostreamingBenchmark/blob/master/benchmark.png)
                Figure.1 Statistic of proposed dataset


In addition, this repository also include scripts and the result of video transcoding benchmark on Chameleon Cloud small VM. Each video are transcoded in 4 operations (bit-rate changing, frame-rate changing, resolution changing and codec changing), with two parameters per operation. Each experiment is run 30-times. Both individual transcoding time and the parsed data (to mean and SD) are included.

Author: Shangrui Wu, Chavit Denninnart, Mohsen Amini Salehi

contact: wushangruide@gmail.com


# Standardized Format
The standardized video format have the following specification: 
  ✦codec: H.264/AVC
  ✦resolution: 720P
  ✦frame rate: 30
  ✦bite rate: average 4500kbps
  
The dataset contains:

[1] Original version of the video as collected (3.20GB) | Google Drive
https://drive.google.com/drive/folders/1uereCYUqTqb602W9BFi-cjj-Gag-IFt9?usp=sharing

[2] Video dataset in their original format splitted into multiple 2-second segments (3.40GB) | Google Drive
https://drive.google.com/drive/folders/1MaEAN8TjuOhv9mH33j5L7nibxppriadQ?usp=sharing

[3] Video dataset uniformly formatted and split into multiple 2-second segments (2.6GB) | Google Drive
https://drive.google.com/drive/folders/1KhsxZtC22L-EHoeXmsdmWpkuNZpmS-pL?usp=sharing

[4] Video dataset uniformly formatted and split into multiple 2-second segments to be HLS player-compatible (2.0GB) | Google Drive https://drive.google.com/drive/folders/1MKeNOcfzrWl9kUNp26F-5eFm4qwhpjsE?usp=sharing



If you are using this dataset, please refer to the following paper: 

.... (link to the benchmark paper).

List of works using this dataset: 

.... (list all papers using this dataset)
