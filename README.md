# Video Streaming Benchmark
This project includes 100 video streams in a standardized format and their transcoding information and merging efficiency info.

Author: Shangrui Wu, Mohsen Amini Salehi, Chavit Denninnart, Xiangbo Li, Yang Wang

contact: wushangruide@gmail.com

# Abstract
Serverless cloud computing or Function as a Service (Faas) cloud has an ability to schedule multiple users' tasks on a share common scheduling resource queue. This enables the providers to reduce resource usage by combining similar task requests that share part of their computation. However, such an approach requires the merged tasks to be scheduled for execution together as a group. Such task re-ordering can potentially cause the deadline violation of either merged tasks or other tasks waiting behind in the task execution queue, thus violating Quality of Service (QoS) of the end-user. Therefore, resource management should perform task merging with informed decisions not to cause unintended deadline violations. The percentage of time saved from task aggregation is crucial information to achieve efficient use of resources. In this paper, we study execution time saving as the result of task merging in the video processing context. Then, we perform a variety of video processing, both as individual requests and with task merging in place to get the overall observations of execution time saving through task merging. We found that executing multiple tasks together can save up to 44\% of the makespan, which leads to lower energy consumption. Finally, we leverage the data to create a Gradient Boosting Decision Tree (GBDT)-based execution time saving predictor function. %To maintain consistency and applicability to different devices with different performances, the service forecasts the amount of saving as a percentage rather than an absolute time unit. The experimental result shows that the prediction function has the Root Mean Square Error (RMSE) of 0.05.

![title](https://github.com/hpcclab/videostreamingBenchmark/edit/master/images/multiuser_mapper_batch.png)

# Benchmark
Considering the widespread use of video format and convenience of video transcoding, we define the video standard format as follows: 
  ✦codec: H.264/AVC
  ✦resolution: 720P
  ✦frame rate: 30
  ✦bite rate: average 4500kbps
  
The benchmark contains:

  [1] Original video (3.35GB) | [Google Drive](https://drive.google.com/drive/folders/1uereCYUqTqb602W9BFi-cjj-Gag-IFt9?usp=sharing)
  
  [2] Original video splitted into two seconds segments (2.40GB) | [Google Drive](https://drive.google.com/drive/folders/1MaEAN8TjuOhv9mH33j5L7nibxppriadQ?usp=sharing)
  
  [3] Video dataset uniformly formatted and split into two seconds segments (3.10GB) | [Google Drive](https://drive.google.com/drive/folders/1KhsxZtC22L-EHoeXmsdmWpkuNZpmS-pL?usp=sharing)


If you are using this dataset, please refer to the following paper:
.... (link to a paper).
