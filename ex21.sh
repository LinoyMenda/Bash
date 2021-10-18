#! /bin/bash
# Linoy Menda 313302317
#input test
if [ $# -lt 3 ]; 
   then 
   printf "Not enough parameters" $# 
   exit 0 
   else
  #Move to the given folder
  cd $1/
  #Search for specific file types, remove the suffix and sort
  #If nothing is found do not print an error message
  files=$(ls *.$2 2> /dev/null | cut -f 1 -d '.' | sort)
  dot="."
  for f in $files
  do
    #Look for the exact word in the file
    grep -i -w $3 $f$dot$2
  done
fi