#!/usr/bin/env bash
# gh - 2022
#######

echo -e "killing scrape processes...\n" 
ps -ef | grep scrape  | awk '{ print $2 }'  | xargs kill -9
mv nohup.out $(date +%Y%m%d)-scraper.log
