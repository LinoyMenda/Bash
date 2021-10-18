#! /bin/bash
# Linoy Menda 313302317
#input test
if [ $# -lt 4 ]; 
   then 
   printf "Not enough parameters" $# 
   exit 0 
   else
   #Find all folders and subfolders
   all_folders=$(find $1/ -type d -print | sort)
   #Run script ex21.sh for all the folders
   for d in $all_folders
   do
      texts=$(./ex21.sh $d $2 $3)
      for group in "$texts"
      do
        #Print if there is more/equal word then input4
        # if input4 is 0 so print more then because we won't want empty lines
        if [ "$4" -eq "0" ]; then
        echo "$group" | awk -v COUNT=$4 'NF>COUNT'
        else
        echo "$group" | awk -v COUNT=$4 'NF>=COUNT'
        fi
      done
   done
fi