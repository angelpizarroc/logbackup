#!/bin/sh

#WORKSPACE=$(pwd)/LOGS
WORKSPACE=/var/lib/GTS
#WORKSPACE=/root/GTS
#BKPFOLDER=$(pwd)/LOGS/LOGS
BKPFOLDER=/var/lib/GTS/LOGS
#BKPFOLDER=/root/GTS/LOGS
CFGNAME=confs.ini
PREFIX=LOG
#CDAY=$(date)
#CMONTH=$(date)
#CYEAR=$(date)

CFG_YEAR=$(head -n 1 $WORKSPACE/$CFGNAME | awk '{print $2}' | awk -F: '{print $2}')
CFG_MONTH=$(head -n 2 $WORKSPACE/$CFGNAME | tail -n 1 | awk '{print $2}' | awk -F: '{print $2}')
CFG_DAY=$(tail -n -2 $WORKSPACE/$CFGNAME | head -n 1 | awk '{print $2}' | awk -F: '{print $2}')

echo $CFG_YEAR
echo $CFG_MONTH
echo $CFG_DAY
#CURRENT_LOG_length=$(wc -l $cile)

mkdir -p $BKPFOLDER

#echo "LOG190910.csv" | awk -F LOG '{ print $2}' | awk -F. '{print $1}'


#todate=$(date -d 2013-07-18 +"%Y%m%d")  # = 20130718
#cond=$(date -d 2013-07-15 +"%Y%m%d")    # = 20130715

if [ $todate -ge $cond ]; #put the loop where you need it
then
 echo 'yes';
fi

#exit

#############echo "LOG190910.csv" | awk -F LOG '{ print $2}' | awk -F. '{print $1}' | cut -c5-6

CURRENT_YEAR=NULL
cond=$(date -d $CFG_YEAR-$CFG_MONTH-$CFG_DAY +"%Y%m%d")  # = 20130718

for file in $WORKSPACE/$PREFIX*; do
    #echo "$(basename "$file")"
#  mv $WORKSPACE/$(basename "$file") $BKPFOLDER
if test -f $WORKSPACE/$(basename "$file")
then
  #echo "$(basename "$file")"
  CURRENT_YEAR=$(basename "$file" | awk -F LOG '{ print $2}' | awk -F. '{print $1}' | cut -c1-2)
  CURRENT_MONTH=$(basename "$file" | awk -F LOG '{ print $2}' | awk -F. '{print $1}' | cut -c3-4)
  CURRENT_DAY=$(basename "$file" | awk -F LOG '{ print $2}' | awk -F. '{print $1}' | cut -c5-6)
    #echo $(basename "$file" | awk -F LOG '{ print $2}' | awk -F. '{print $1}')


    todate=$(date -d $CURRENT_YEAR-$CURRENT_MONTH-$CURRENT_DAY +"%Y%m%d")    # = 20130715
    if [ $todate -ge $cond ]; #put the loop where you need it
    then
     echo 'yes';
   else
     #echo 'no'
     mv $WORKSPACE/$(basename "$file") $BKPFOLDER
    fi

    #echo $CURRENT_YEAR-$CURRENT_MONTH-$CURRENT_DAY
    #echo "File exists"
    #mv $WORKSPACE/$(basename "$file") $BKPFOLDER
fi
done
