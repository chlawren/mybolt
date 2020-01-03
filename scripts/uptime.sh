#!/usr/bin/env bash

mkdir ~/tempdir
touch ~/tempdir/myfile.out
echo "system 5m load average is: $(uptime|awk '{print $NF}')" |tee ~/tempdir/myfile.out

  if [ $? -eq 0 ] ; then
    rm -rf ~/tempdir
    exit 0
  else
   echo "Failed to remove ~/tempdir: RC=$?" ; exit $RC
  fi
