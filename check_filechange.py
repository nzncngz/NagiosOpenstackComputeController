#!/usr/bin/python
import subprocess
import sys

#nagios return codes
UNKNOWN = -1
OK = 0
WARNING = 1
CRITICAL = 2

dir1 = "/etc"
dir2 = "/httpboot"
dir3 = "/tftpboot"

exception_list = ['/etc/pki/', '/etc/centrifydc', '/etc/hpov/', '/etc/insights-client/', '/etc/redhat-access-insights/', "/etc/krb5.keytab", "/etc/rhsm/facts/ceph_usage.facts", "/etc/krb5.ccache"]


command = subprocess.Popen(["sudo", "find", dir1, dir2, dir3,  "-mmin", "-60", "-type", "f", "-exec", "ls", "{}","+"], stdout=subprocess.PIPE)

changed = command.communicate()[0]
changed = changed.split('\n')





for i in changed[:]:
    for x in exception_list:
        if x in i:
            changed.remove(i)




changed = [x for x in changed if x]
if not changed:
  print "OK - No changed files"
else:
  print "WARNING - Files Changed" + str(changed)
  sys.exit(WARNING)

