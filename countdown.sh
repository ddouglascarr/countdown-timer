#!/bin/bash
# USAGE
# ./countdown <num of unit> <unit> <msg>
# eg:
# ./countdown 25 minutes Have a Break!
seconds=0
unit=$1
value=$2

case $unit in 

  "s" | "seconds" | "seconds" )   seconds=$value
                                  ;;
  "m" | "minute" | "minutes" )    seconds=$(($value * 60))
                                  ;;
  "h" | "hour" | "hours" )        seconds=$(($value * 60 * 60))
                                  ;;
  * )                             echo "unknown unit: $unit"
                                  exit 1;
                                  ;;
esac

finished_date=$((`date +%s` + $seconds))

while [ "$finished_date" -ne `date +%s` ]; do
  echo -ne "$(date --date @$(($seconds - `date +%s` - 19800 )) +%H:%M:%S)\r";
done

notify-send 'Timer finished' "$*"
