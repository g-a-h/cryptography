#!/usr/bin/env bash

num_procs=20

seq 1 $num_procs | while read i ; do
    nohup ./scrape $i.tmp &
done
