#!/usr/bin/python

from datetime import timedelta

with open('/proc/uptime', 'r') as f:
    uptime_seconds = float(f.readline().split()[0])
uptime_min=(uptime_seconds/60)
uptime_string = str(timedelta(seconds = uptime_seconds))

if uptime_min < 60:
   print "CRITICAL - SYSTEM REBOOT, UPTIME is " + str(uptime_min) + " min"
else:
   print "OK - System is up for " + uptime_string
