#!/bin/bash

WD=/vagrant
LOCK=$WD/lab5lock
LOGACCESS=$WD/access.log
LOGERROR=$WD/error.log
LINELOG=$WD/lab5line
LOGTEMP=`mktemp` || exit 1

# Top Counts
XX=10
YY=10

# Function delete LOCK File
lockdel(){
if [ -f $LOCK ]; then
   rm -f $LOCK
fi
}

# Function Output Finish datetime message and delete temp files
stopping(){
  # delete temp file
  if [ -f $LOGTEMP ]; then
     rm -f $LOGTEMP
  fi
  echo "Job Finished -" $(date "+%F %T")
  echo "#######################################################"
}

echo "#######################################################"
echo "Job Started -" $(date "+%F %T")

if [ -f $LOCK ]; then
   echo "The previous Started Job is already running!"
   stopping 
   exit 6
fi

touch $LOCK

trap 'rm -f "$LOCK"; rm -f "$LOGTEMP"; exit $?' INT TERM EXIT

# current line in log
ACCLINECURR=0
ERRLINECURR=0
# last line in log
ACCLINEEND=`wc -l $LOGACCESS | awk '{print $1}'`
ERRLINEEND=`wc -l $LOGERROR | awk '{print $1}'`

if [ -f $LINELOG ]; then
   # check rotation log: find saved str in log file
   STRFIND=`grep ^Access $LINELOG | awk -F " " '{print $6}' | sed 's/\[//g'`
   if [ ${#STRFIND} -ne 0 ]; then
      grep "$STRFIND" $LOGACCESS > /dev/null
      if [ $? -eq 0 ]; then
         ACCLINECURR=`grep ^Access $LINELOG | awk -F " " '{print $2}'`
      fi
   fi
   STRFIND=`grep ^Error $LINELOG | awk -F " " '{print $3,$4}'`
   if [ ${#STRFIND} -ne 0 ]; then
      grep "$STRFIND" $LOGERROR > /dev/null
      if [ $? -eq 0 ]; then
         ERRLINECURR=`grep ^Error $LINELOG | awk -F " " '{print $2}'`
      fi
   fi
fi 

# check access log modify
if [ $ACCLINECURR -eq $ACCLINEEND ]; then
   echo
   echo "Access Log NOT Modified. Nothing to do"
   echo
else
   # copy log part in temp file, from current to last lines
   FILEPART=$(($ACCLINECURR+1))","$ACCLINEEND"p"
   sed -n $FILEPART $LOGACCESS > $LOGTEMP
   if [ $? -ne 0 ]; then
      echo
      echo "Error copy Access log part"
      echo
   else
      echo "Access Log Range Processed from: " `head -1 $LOGTEMP | awk '{print $4}' | cut -d'[' -f 2`
      echo "                             to: " `tail -1 $LOGTEMP | awk '{print $4}' | cut -d'[' -f 2`
      echo
      echo "--------- Top $XX IP's --------"
      awk -F " " '{a[$1]++ } END  { for (b in a) { print a[b], "\t", b } }' $LOGTEMP | sort -n -k 1,4 -r | head -$XX
      echo
      echo "--------- Top $YY URL's -------"
      awk -F " " '{a[$7]++ } END  { for (b in a) { print a[b], "\t", b } }' $LOGTEMP | sort -n -k 1,4 -r | head -$YY
      echo
      echo "--------- Return Codes --------"
      awk -F " " '{a[$9]++ } END  { for (b in a) { print a[b], "\t", b } }' $LOGTEMP | sort -n -k 1,4 -r
      echo
      # Save last processed line
      if [ -f $LINELOG ]; then
         sed -i '/^Access/d' $LINELOG
      fi
      echo "Access $ACCLINEEND " `tail -1 $LOGTEMP` >> $LINELOG
   fi
fi

# check error log modify
echo "========= Error Log ================================="
if [ $ERRLINECURR -eq $ERRLINEEND ]; then
   echo
   echo "Error Log NOT Modified. Nothing to do"
   echo
else
   # copy log part in temp file, from current to last lines
   FILEPART=$(($ERRLINECURR+1))","$ERRLINEEND"p"
   sed -n $FILEPART $LOGERROR > $LOGTEMP
   if [ $? -ne 0 ]; then
      echo
      echo "Error copy Error log part"
      echo
   else
      echo "Error Log Range Processed from: " `head -1 $LOGTEMP | awk '{print $1,$2}' | cut -d'[' -f 2`
      echo "                            to: " `tail -1 $LOGTEMP | awk '{print $1,$2}' | cut -d'[' -f 2`
      echo
      cat $LOGTEMP
      echo
      # Save last processed line
      if [ -f $LINELOG ]; then
         sed -i '/^Error/d' $LINELOG
      fi
      echo "Error $ERRLINEEND " `tail -1 $LOGTEMP` >> $LINELOG
   fi
fi

trap - INT TERM EXIT
lockdel
stopping
