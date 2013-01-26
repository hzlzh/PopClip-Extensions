#!/bin/bash
# Get main domain URL(remove http(s):// and '/' path)
domain="$(echo $POPCLIP_TEXT | sed -e 's/.*:\/\/\([^ !\/]*\)\(.*\)/\1/' | sed -e 's/\([^ ]\)\/.*/\1/')"
# Get hosted IP address
ip=$(host $domain | awk '/has / {print $4;exit}')
[ "$ip+1" -eq "1" ] && echo "Not Valid Domain" || echo "$ip"