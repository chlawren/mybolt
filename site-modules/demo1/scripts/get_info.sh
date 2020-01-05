#!/usr/bin/env bash

export HOSTNAME=$(hostname)
export IPADDR=$(hostname -i)
export UPTIME=$(uptime|awk '{print $NF}')
export OUTFILE=~/tempdir/myfile.out

mkdir ~/tempdir
touch ~/tempdir/myfile.out
echo "HOSTNAME = ${HOSTNAME}" > ${OUTFILE}
echo "IPADDR = ${IPADDR}" >> ${OUTFILE}
echo "system 5m load average is: ${UPTIME}" >> ${OUTFILE}

cat ${OUTFILE}

  if [ $? -eq 0 ] ; then
    rm -rf ~/tempdir
    exit 0
  else
   echo "Failed to remove ~/tempdir: RC=$?" ; exit $RC
  fi
