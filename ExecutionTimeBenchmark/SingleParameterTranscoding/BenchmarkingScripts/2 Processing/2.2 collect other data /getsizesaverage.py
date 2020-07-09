# get all real execution times and get their averages and get the standard deviation of all averages

import os
import statistics

directory_in_str = "D:/Experiments/Standards"
directory = os.fsencode(directory_in_str)
averagesArray = []

    
    
def main():

    for file in os.listdir(directory): #for directories inside the given directory
         filename = os.fsdecode(file)  
         newdirectory = os.path.join(directory, file) #change to new directory

         for videos in os.listdir(newdirectory): #for the number of textfiles in the directory 
             videos_str = os.fsdecode(videos) #decode into string
             sizearray = []    
             
             
             if videos_str=="sizeGOPS.txt": #chnage text file to get data
                 newdirectory2 = os.path.join(newdirectory,videos) #get the path to the textfile
                 with open(newdirectory2, 'r') as f:
                     count = 0
                     for line in f:
                        sizearray.append(eval(line))
                        count += 1                        


                     sum1 = 0
                     for g in range (0,len(sizearray)):
                         sum1 = sum1 + sizearray[g] #total of up bitrate
                         
                     averageup = sum1/count
                     averagesArray.append(averageup)
                     

        

    for j in range (0, len(averagesArray)):
        print(averagesArray[j])

         
                     
                        
             
main()           
         
