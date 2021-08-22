#! /bin/sh

# Last updated by @hohno_at_kuimc at Sun Aug 22 07:51:26 JST 2021

PNAME=$(basename $0) 
CMD="$HOME/workspace/processing-3.5.3/processing-java"
SKETCH="$HOME/GitHub/cZone--Processing3--tamaClock/tamaClock/"
OUTPUT="$HOME/tmp/output"
LOGFILE="$HOME/tmp/tamaClock.log"

if [ "x$1" = "xstart" ]; then
  (echo "----"; LC_ALL=C; /bin/date) >> ${LOGFILE} 2>&1
  ${CMD} --sketch=${SKETCH} --output=${OUTPUT} --force --present  >> ${LOGFILE} 2>&1

elif [ "x$1" = "xstop" ]; then
  # x=$(ps axw | grep "${PNAME} start" | grep -v grep | awk '{print $1}')
  # if [ "x$x" != "x" ] ; then
  #   for y in $x; do
  #     echo pkill -9 -g $y
  #     ps alxw -q $y
  #     (sleep 1; pkill -9 -g $y) &
  #   done
  # fi
  pkill -P $(pgrep -P $(pgrep -P $(pgrep -f "/bin/sh.*${PNAME} start")))
  # tamaClock.sh -> processing-java -> java -> java

else
  echo "usage: $0 [start|stop]"
fi

# (export LC_ALL=C; /bin/date)

exit $?
