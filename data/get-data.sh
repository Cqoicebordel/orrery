#!/bin/bash

start=`date +"%Y-%m-%d" -d "2016-11-01"`
end=`date +"%Y-%m-%d" -d "2036-01-01"`

# Earth
for i in {1..1}; do
mkdir -p "e$i"

now=$start

while [ "$now" != "$end" ] ; 
do 
    curl -L "http://ssd.jpl.nasa.gov/horizons_batch.cgi?batch=1&COMMAND='30$i'&CENTER='500@399'&MAKE_EPHEM='YES'&TABLE_TYPE='OBSERVER'&START_TIME='$now'&STOP_TIME='$(date +"%Y-%m-%d" -d "$now + 1 month")'&STEP_SIZE='1%20h'&CAL_FORMAT='CAL'&TIME_DIGITS='SECONDS'&ANG_FORMAT='DEG'&OUT_UNITS='KM-S'&RANGE_UNITS='AU'&APPARENT='AIRLESS'&SOLAR_ELONG='0,180'&SUPPRESS_RANGE_RATE='NO'&SKIP_DAYLT='NO'&EXTRA_PREC='NO'&R_T_S_ONLY='NO'&REF_SYSTEM='J2000'&CSV_FORMAT='YES'&OBJ_DATA='YES'&QUANTITIES='31'" -o "./e$i/"$(date +"%Y-%m" -d $now).txt
    now=`date +"%Y-%m-%d" -d "$now + 1 month"`; 
done;
done


# Mars
for i in {1..2}; do
mkdir -p "m$i"

now=$start

while [ "$now" != "$end" ] ; 
do 
    curl -L "http://ssd.jpl.nasa.gov/horizons_batch.cgi?batch=1&COMMAND='40$i'&CENTER='500@499'&MAKE_EPHEM='YES'&TABLE_TYPE='OBSERVER'&START_TIME='$now'&STOP_TIME='$(date +"%Y-%m-%d" -d "$now + 1 month")'&STEP_SIZE='1%20h'&CAL_FORMAT='CAL'&TIME_DIGITS='SECONDS'&ANG_FORMAT='DEG'&OUT_UNITS='KM-S'&RANGE_UNITS='AU'&APPARENT='AIRLESS'&SOLAR_ELONG='0,180'&SUPPRESS_RANGE_RATE='NO'&SKIP_DAYLT='NO'&EXTRA_PREC='NO'&R_T_S_ONLY='NO'&REF_SYSTEM='J2000'&CSV_FORMAT='YES'&OBJ_DATA='YES'&QUANTITIES='31'" -o "./m$i/"$(date +"%Y-%m" -d $now).txt
    now=`date +"%Y-%m-%d" -d "$now + 1 month"`; 
done;
done


# Jupiter
for i in {1..4}; do
mkdir -p "j$i"

now=$start

while [ "$now" != "$end" ] ; 
do 
    curl -L "http://ssd.jpl.nasa.gov/horizons_batch.cgi?batch=1&COMMAND='50$i'&CENTER='500@599'&MAKE_EPHEM='YES'&TABLE_TYPE='OBSERVER'&START_TIME='$now'&STOP_TIME='$(date +"%Y-%m-%d" -d "$now + 1 month")'&STEP_SIZE='1%20h'&CAL_FORMAT='CAL'&TIME_DIGITS='SECONDS'&ANG_FORMAT='DEG'&OUT_UNITS='KM-S'&RANGE_UNITS='AU'&APPARENT='AIRLESS'&SOLAR_ELONG='0,180'&SUPPRESS_RANGE_RATE='NO'&SKIP_DAYLT='NO'&EXTRA_PREC='NO'&R_T_S_ONLY='NO'&REF_SYSTEM='J2000'&CSV_FORMAT='YES'&OBJ_DATA='YES'&QUANTITIES='31'" -o "./j$i/"$(date +"%Y-%m" -d $now).txt
    now=`date +"%Y-%m-%d" -d "$now + 1 month"`; 
done;
done


# Saturn
for i in {1..8}; do
mkdir -p "s$i"

now=$start

while [ "$now" != "$end" ] ; 
do 
    curl -L "http://ssd.jpl.nasa.gov/horizons_batch.cgi?batch=1&COMMAND='60$i'&CENTER='500@699'&MAKE_EPHEM='YES'&TABLE_TYPE='OBSERVER'&START_TIME='$now'&STOP_TIME='$(date +"%Y-%m-%d" -d "$now + 1 month")'&STEP_SIZE='1%20h'&CAL_FORMAT='CAL'&TIME_DIGITS='SECONDS'&ANG_FORMAT='DEG'&OUT_UNITS='KM-S'&RANGE_UNITS='AU'&APPARENT='AIRLESS'&SOLAR_ELONG='0,180'&SUPPRESS_RANGE_RATE='NO'&SKIP_DAYLT='NO'&EXTRA_PREC='NO'&R_T_S_ONLY='NO'&REF_SYSTEM='J2000'&CSV_FORMAT='YES'&OBJ_DATA='YES'&QUANTITIES='31'" -o "./s$i/"$(date +"%Y-%m" -d $now).txt
    now=`date +"%Y-%m-%d" -d "$now + 1 month"`; 
done;
done


# Uranus
for i in {1..5}; do
mkdir -p "u$i"

now=$start

while [ "$now" != "$end" ] ; 
do 
    curl -L "http://ssd.jpl.nasa.gov/horizons_batch.cgi?batch=1&COMMAND='70$i'&CENTER='500@799'&MAKE_EPHEM='YES'&TABLE_TYPE='OBSERVER'&START_TIME='$now'&STOP_TIME='$(date +"%Y-%m-%d" -d "$now + 1 month")'&STEP_SIZE='1%20h'&CAL_FORMAT='CAL'&TIME_DIGITS='SECONDS'&ANG_FORMAT='DEG'&OUT_UNITS='KM-S'&RANGE_UNITS='AU'&APPARENT='AIRLESS'&SOLAR_ELONG='0,180'&SUPPRESS_RANGE_RATE='NO'&SKIP_DAYLT='NO'&EXTRA_PREC='NO'&R_T_S_ONLY='NO'&REF_SYSTEM='J2000'&CSV_FORMAT='YES'&OBJ_DATA='YES'&QUANTITIES='31'" -o "./u$i/"$(date +"%Y-%m" -d $now).txt
    now=`date +"%Y-%m-%d" -d "$now + 1 month"`; 
done;
done


# Neptune
for i in {1..1}; do
mkdir -p "n$i"

now=$start

while [ "$now" != "$end" ] ; 
do 
    curl -L "http://ssd.jpl.nasa.gov/horizons_batch.cgi?batch=1&COMMAND='80$i'&CENTER='500@899'&MAKE_EPHEM='YES'&TABLE_TYPE='OBSERVER'&START_TIME='$now'&STOP_TIME='$(date +"%Y-%m-%d" -d "$now + 1 month")'&STEP_SIZE='1%20h'&CAL_FORMAT='CAL'&TIME_DIGITS='SECONDS'&ANG_FORMAT='DEG'&OUT_UNITS='KM-S'&RANGE_UNITS='AU'&APPARENT='AIRLESS'&SOLAR_ELONG='0,180'&SUPPRESS_RANGE_RATE='NO'&SKIP_DAYLT='NO'&EXTRA_PREC='NO'&R_T_S_ONLY='NO'&REF_SYSTEM='J2000'&CSV_FORMAT='YES'&OBJ_DATA='YES'&QUANTITIES='31'" -o "./n$i/"$(date +"%Y-%m" -d $now).txt
    now=`date +"%Y-%m-%d" -d "$now + 1 month"`; 
done;
done


# Pluto
for i in {1..5}; do
mkdir -p "p$i"

now=$start

while [ "$now" != "$end" ] ; 
do 
    curl -L "http://ssd.jpl.nasa.gov/horizons_batch.cgi?batch=1&COMMAND='90$i'&CENTER='500@999'&MAKE_EPHEM='YES'&TABLE_TYPE='OBSERVER'&START_TIME='$now'&STOP_TIME='$(date +"%Y-%m-%d" -d "$now + 1 month")'&STEP_SIZE='1%20h'&CAL_FORMAT='CAL'&TIME_DIGITS='SECONDS'&ANG_FORMAT='DEG'&OUT_UNITS='KM-S'&RANGE_UNITS='AU'&APPARENT='AIRLESS'&SOLAR_ELONG='0,180'&SUPPRESS_RANGE_RATE='NO'&SKIP_DAYLT='NO'&EXTRA_PREC='NO'&R_T_S_ONLY='NO'&REF_SYSTEM='J2000'&CSV_FORMAT='YES'&OBJ_DATA='YES'&QUANTITIES='31'" -o "./p$i/"$(date +"%Y-%m" -d $now).txt
    now=`date +"%Y-%m-%d" -d "$now + 1 month"`; 
done;
done


for f in $(find . -name '*.txt'); do
sed '1,/$$SOE/d' $f | sed '/$$EOE/,$d' | sed 's/, , ,/,/' | sed 's/,$//' | sed 's/^ *//;s/ *$//' > $(echo $f | rev | cut -c 5- | rev).csv;
rm $f;
done
