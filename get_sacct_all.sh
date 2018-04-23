#!/bin/bash -f
headers=`sacct -e | awk '{for(n=0;n<NF;++n){printf("%s,",$(n+1))}}END{printf("\n")}' | sed s'/,$//'`
sacct -S 2017-04-23T00:00:00 -E 2017-04-23T23:59:59 -P -o $headers
