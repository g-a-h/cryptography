#!/usr/bin/env bash 
# gh - 2022
# entropy 

declare -a ntrop=() ;
while : ; do
  [[ ${#ntrop[@]} -ge $1 ]] && break || {
  rnd=$(expr $(od -An -td -N1 /dev/urandom | hexdump | sum | sum | sum | awk '{ print $1 }') \
  "/" \
  $(od -An -td -N1 /dev/urandom | sed 's/ 0 / 1 /g' ))
  [[ $rnd -ge 2047 ]] && : || {
      [[ ! " ${ntrop[*]} " =~ " ${rnd} " ]] && ntrop+=("${rnd}")
    }
  }
done
echo ${ntrop[@]}
