#!/usr/bin/env bash
# gh - 2022 
# run 
#######
num_procs=$1

seq 1 $num_procs | while read i ; do
    nohup ./scrape $i.tmp &
done
