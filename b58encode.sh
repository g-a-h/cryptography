#!/usr/local/env bash
# gh - 2022
# base58 encode
#######

base=($(echo {1..9} {A..Z} {a..z} | sed 's/[O|I|l]//g' | sed 's/  / /g'))
encode() {
  in=$(sed -e 's/\(\(00\)*\).*/\1/' -e 's/00/1/g' <<<$1) && echo -n $in
  bc <<<"ibase=16; n=$1; while(n>0) { n%3A ; n/=3A }" | tail -r \
  | while read n
      do echo -n ${base[n+1]}
    done
}

encode $1 
