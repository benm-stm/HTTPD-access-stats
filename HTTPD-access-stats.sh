#!/bin/bash
#field 1: compressed file name without date or extension
#field 2: start search date
#field 3: end search date
#field 4: compressed logs directory

#for help purpose
if [test $1 == "--help"]
  then echo -e "usage : $0 [File name without the date] [Start date yymmdd] [End date yymmdd] [logs directory]"
else
  endDate=$(date -d $3 +"%y%m%d")
  date=$(date -d $2 +"%y%m%d")
  while [ $endDate -ge $date ]; do
    echo "${red}******************$1-20$date :********************${NC}"
    zcat $4/$1-20$date |cut -d ' ' -f 1|sort |uniq -c
    echo "===========> Number of users :"
    zcat $4/$1-20$date |cut -d ' ' -f 1|sort |uniq -c| wc -l
    date=$(date +%Y-%m-%d -d "$date +1 day")
    date=$(date -d $date +"%y%m%d")
  done
fi
