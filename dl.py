# Generate commands to query sacct day by day
#
from datetime import date, timedelta as td

d1 = date(2017, 1,  1)
d2 = date(2018,12, 31)

delta = d2 - d1

for i in range(delta.days + 1):
    print "time sacct -T ","-S",d1 + td(days=i),  "-E",d1 + td(days=i)+td(1),"--format=${headers} -p > ",( "%s/sacct%s.csv" % ((d1+ td(days=i)).year,str(d1 + td(days=i))) )

# Set headers environment variable using
# $ headers=`sacct -e | awk '{for(n=0;n<NF;++n){printf("%s,",$(n+1))}}END{printf("\n")}' | sed s'/,$//'`
