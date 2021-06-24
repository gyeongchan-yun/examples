#!/bin/bash

file_name=$1
dest=$2

if [ -z $dest ]
then
  echo "[USAGE]: scpall.sh [file or dir] [dest path]"
  exit
fi


for i in 1 2 3 4 ; do
#for i in 1 2 3 ; do
  scp -r $file_name tino1${i}0:$dest &
  sleep 0.001
  echo $file_name "tino1"${i}"0 done"
done



echo "successfully copyed!"
