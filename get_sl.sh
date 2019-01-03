#!/bin/bash
# To figure out indexes (which change with Slurm versions)
# head -1 2018/sacct2018-12-31.csv  | awk -F '|' '{for(n=0;n<NF;++n){print n,$n}}'
ppat="-e sched_mit_sloan -e sched_mit_thesmar"
fl='2018/sacct*.csv'
AllocCPUS='$3'
Elapsed='$20'
End='$26'
Partition='$58'
Start='$75'
for f in ${fl} ; do
 # cat ${f} | awk -F'|' '{print '"${AllocCPUS}"','"${Elapsed}"','"${Partition}"','"${Start}"','"${End}"'}' | grep -v 'Elapsed' | grep -v ' 00:00:00'  | grep ${ppat}
 ch=`cat ${f} | awk -F'|' '{print '"${AllocCPUS}"','"${Elapsed}"','"${Partition}"','"${Start}"','"${End}"'}' | grep -v 'Elapsed' | grep -v ' 00:00:00'  | grep ${ppat} | awk 'BEGIN{tth=0}{nc=$1;ts=$2;split(ts,tim,":");ndh=split(tim[1],timdh,"-");if(ndh==2){timd=timdh[1];timh=timdh[2]}else{timd=0;timh=timdh[1]};timm=tim[2];tims=tim[3];tts=timd*86400+timh*3600+timm*60+tims;tth=tth+tts/3600;nch=tts/3600}END{print "Core hours "tth}'`
 echo ${f}  ${ch}
done
