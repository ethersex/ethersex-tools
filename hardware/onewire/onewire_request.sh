#! /bin/bash
# This script reads the 1-wire temperature sensors and appends
# a timestamp and the values to a logfile
# Using fixed sensor IDs
SENSOR[0]=1000bcdd010800d4
SENSOR[1]=102db6dd01080095
LOGFILE=/var/log/temp.log
ESEXIP=10.10.0.161

date >> $LOGFILE

#IPv4
echo "1w convert ${SENSOR[0]}" | netcat -w 4 $ESEXIP 2701 2>/dev/null | grep -qe OK || exit 1
echo "1w convert ${SENSOR[1]}" | netcat -w 4 $ESEXIP 2701 2>/dev/null | grep -qe OK || exit 1
TEMP[0]=`echo "1w get ${SENSOR[0]}" | netcat -w 5 $ESEXIP 2701`
TEMP[1]=`echo "1w get ${SENSOR[1]}" | netcat -w 5 $ESEXIP 2701`
echo "Temperature 1 = ${TEMP[0]}°C, Tempreature 2 = ${TEMP[1]}°C" >> $LOGFILE
