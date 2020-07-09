cd /mnt/d/Splits


for file in {1..100};do
	if [[ -d $file ]]; then
		cd ./$file
        echo "=="$file"=="
        ls -1 | wc -l
		cd ..
    fi
done
