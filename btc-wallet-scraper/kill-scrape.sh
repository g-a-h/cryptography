#!/usr/bin/env bash

ps -ef | grep scrape  | awk '{ print $2 }'  | xargs kill -9
