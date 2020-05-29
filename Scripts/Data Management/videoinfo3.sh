cd /mnt/d/Standard
touch size.txt
 for f in {1..100};do
	         if [[ -d $f ]];then
			     cd ./$f
			     touch sizeGOPS.txt
			     for file in *.ts;do
				 echo            >> sizeGOPS.txt
			         echo size of $file >> sizeGOPS.txt
				 du -k "$file" | awk '{print $1}'  >> sizeGOPS.txt
				 echo                >> sizeGOPS.txt
	                     done
			     cd ..
		 fi
done
