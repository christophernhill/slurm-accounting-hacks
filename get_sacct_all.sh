#!/bin/bash -f
headers=`sacct -e | awk '{for(n=0;n<NF;++n){printf("%s,",$(n+1))}}END{printf("\n")}' | sed s'/,$//'`
sacct -o $headers -j 8781354 
