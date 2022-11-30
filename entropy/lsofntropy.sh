#!/usr/bin/env bash
# gh - 2022
# entropy from lsof 

iter=0 ;
declare -a ntrop=() ;
while true ; do
  (( iter++ ))
  [[ $iter -ge 24 ]] && break || {
  while true ; do
    top=$(lsof  |  awk '{ print $6 }' | grep 0x  | hexdump | sum | awk '{ print $1 }')
    [[ $top -ge 2047 ]] && : || break
  done
  while true ; do
    btm=$(od -A n -t d -N 1 /dev/urandom)
    [[ $btm -eq 0 ]] && : || break
  done
  rnd=$(expr $top "/" $btm)
  ntrop+=("${rnd}")
  }
done
echo ${ntrop[@]}
