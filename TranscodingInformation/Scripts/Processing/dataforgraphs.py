# get all real execution times and get their averages and get the standard deviation of all averages

import os
import statistics

directory_in_str = "D:/Experiments/resultsConBit"
directory = os.fsencode(directory_in_str)
averagesArrayUp = []
averagesArrayDown = []


def splitting(data):
    newdata = data.split() #split string by white space
    word = (newdata[1]).split('m') #split string by the character m
    minutes = eval(word[0]) * 60 # convert minutes to seconds
    seconds = word[1] #get seconds
    seconds1 = eval(seconds[:-1]) # gets rid of the character "s"
    time = minutes + seconds1 # adds minutes with seconds
    time = time*1000 #get time in milliseconds
    return time
    
    
def main():

    for file in os.listdir(directory): #for directories inside the given directory
         filename = os.fsdecode(file)  
         newdirectory = os.path.join(directory, file) #change to new directory

         for videos in os.listdir(newdirectory): #for the number of textfiles in the directory 
             videos_str = os.fsdecode(videos) #decode into string
             bituparray = []    
             conBitupArray = []
             conBitdownArray = []
             bitdownarray = []
             
             if videos_str=="datarealBit.txt": #chnage text file to get data
                 newdirectory2 = os.path.join(newdirectory,videos) #get the path to the textfile
                 with open(newdirectory2, 'r') as f:
                     count = 0
                     for line in f:
                        bituparray.append(line)
                        bitdownarray.append(f.readline())
                        count += 1                        

                     for i in range (0,len(bituparray)): #convert strings and store them in the list
                         conBitupArray.append(splitting(bituparray[i]))
                         conBitdownArray.append(splitting(bitdownarray[i]))

                     sum1 = 0
                     sum2 = 0
                     for g in range (0,len(bituparray)):
                         sum1 = sum1 + conBitupArray[g] #total of up bitrate
                         sum2 = sum2 + conBitdownArray[g] #total of down bitrate

                     averageup = sum1/count
                     averagedown = sum2/count
                     averagesArrayUp.append(averageup)
                     averagesArrayDown.append(averagedown)

        

    for j in range (0, len(averagesArrayUp)):
        print(averagesArrayUp[j])


    print (" ----------------------------------" )
    print (" " )
    print(" " )
    for h in range (0, len(averagesArrayDown)):
        print(averagesArrayDown[h])


    print (" ----------------------------------" )
    print (" " )
    print(" " )
    print(" Averages Up then Down" )
    print(statistics.mean(averagesArrayUp))
    print(statistics.mean(averagesArrayDown))
    print("Standard Deviation of UP and Down" )
    print(statistics.stdev(averagesArrayUp))
    print(statistics.stdev(averagesArrayDown))
    print("Median of UP and Down" )
    print(statistics.median(averagesArrayUp))
    print(statistics.median(averagesArrayDown))
         
                     
                        
             
main()           
         
