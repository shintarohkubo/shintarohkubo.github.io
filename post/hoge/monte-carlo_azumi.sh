#!/bin/bash

for a in $(seq 1 10000); do
    awk -f monte-carlo_azumi.awk messagetame_list.txt | 
    awk 'END{print $2}'
done | sort -n | uniq -c

cat class_list.txt
