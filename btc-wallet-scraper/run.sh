#!/usr/bin/env bash
# gh - 2022 
# run 
#######
num_procs=$1

seq 1 $num_procs | while read i ; do
    echo -e "starting scrape process $i of $num_procs..."
    nohup ./scrape $i.tmp &
done
