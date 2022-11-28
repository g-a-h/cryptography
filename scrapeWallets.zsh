#!/usr/bin/env zsh 
# gh - 2022 


while true ; do
   bal=$( ./genkeysbtc | grep addr | tee temp | awk -F':' '{ print $2 }' | xargs -I % curl "https://blockchain.info/rawaddr/%" 2>/&1 | sed 's/,/\n/g' | grep final | awk -F':' '{ print $2 }')
  [[ $bal -eq 0 ]] && : || {
    echo -e "non-zero balance wallet found!\n$(cat temp | tee wallet-$(ls . | grep wallet | wc -l))"
  }
done
