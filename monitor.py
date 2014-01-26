#! /usr/bin/env python
import datetime
import commands
import time
import os
import sys

#name of process to look for
procname = 'splash.server'
restartcmd = './reset.sh'

#See if 'procname' is listed in ps -aux
output = commands.getoutput('ps -aux')
if procname in output:
    print '%s: Splash is running' % datetime.datetime.now()

else:
    #The process was NOT found
    print '%s: Splash is not running, restarting it...' % datetime.datetime.now()
    os.system(restartcmd)

