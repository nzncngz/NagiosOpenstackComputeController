#!/usr/bin/python
import sys,commands

#################
#Set variables
critical = 95.0
warning = 85.0
Number_of_Cores = commands.getstatusoutput("cat /proc/cpuinfo | grep -i processor | wc -l")
#################
Number_of_Cores_int = int(Number_of_Cores[1])

CPU = []

for value in range(0, Number_of_Cores_int):
    CPU.append(commands.getstatusoutput("sar -P '%i' | tail -2 |head -1" %value))

CPU = [x[1] for x in CPU]

CPU_value = []
for line in CPU:
    CPU_value.append(line.split()[2])

CPU_value = [float(x) for x in CPU_value]


if any(t > critical for t in CPU_value):
      print "CRITICAL",
      print "CPU Number " + str(CPU_value.index(max(CPU_value))) + " ,%User is " + str(max(CPU_value)),
      print "|",
      for x in range(len(CPU_value)):
           print "CPU_" + str(x) + "=" + str(CPU_value[x]),
      sys.exit(2)

elif  max(CPU_value)> warning: 
      print "WARNING",
      print "CPU Number " + str(CPU_value.index(max(CPU_value))) + " ,%User is " + str(max(CPU_value)),
      print "|",
      for x in range(len(CPU_value)):
           print "CPU_" + str(x) + "=" + str(CPU_value[x]),
      sys.exit(1)


else:
     print "OK - Max %User is " + str(max(CPU_value)),
     print "|",
     for x in range(len(CPU_value)):
          print "CPU_" + str(x) + "=" + str(CPU_value[x]), 
     sys.exit(0)
