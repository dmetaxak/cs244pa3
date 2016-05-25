#!/usr/bin/python
import os
import sys
import subprocess
import time

if len(sys.argv) != 3:
  print 'Usage: python run_sprout.py DOWN_LINKFILE UP_LINKFILE'

down_linkfile = sys.argv[1]
up_linkfile = sys.argv[2]

# write stderr to a file
errfile = open('/tmp/receivererr.txt', 'w')

# start the receiver
sproutbt2 = os.environ['SPROUT_BT2']
receiver = subprocess.Popen([sproutbt2], stderr=errfile)
time.sleep(2)


# read from stderr file
print 'reading file'
port = None
for line in open('/tmp/receivererr.txt', 'r'):
  if line.startswith('Port bound'):
    bits = line.strip().split(' ')
    port = bits[len(bits) - 1]

print 'Port is: ' + port
#mahimahi_base = '100.64.0.1'
mahimahi_base = '$MAHIMAHI_BASE'

# start the sender things
#mm-delay20mm-link/usr/bin/../share/mahimahi/traces/Verizon-LTE-short.down/usr/bin/../share/mahimahi/traces/Verizon-LTE-short.up--once--uplink-log=/tmp/contest_uplink_log--sh-c$SPROUT_BT2 $MAHIMAHI_BASE 60001
# mahimahi
mahimahi1 = 'mm-delay 20 mm-link /usr/bin/../share/mahimahi/traces/%s /usr/bin/../share/mahimahi/traces/%s' % (down_linkfile, up_linkfile)
mahimahi_link = '/usr/bin/mm-link /usr/bin/../share/mahimahi/traces/%s /usr/bin/../share/mahimahi/traces/%s --once --uplink-log/tmp/contest_uplink_log' % (down_linkfile, up_linkfile)
mahimahi3 = '%s %s %s' % (sproutbt2, mahimahi_base, port)
cmd = '/usr/bin/mm-delay 20; ' + mahimahi_link + ' ; ' + mahimahi3
print 'delay'
print cmd
os.system(cmd)
#mm_shell = subprocess.Popen([cmd], shell=True)
#out = mm_shell.communicate()
#print 'out'
#print out

# fork a process
#pid = os.fork()
#if pid == 0:
#  print 'child'
#  os.execv('/usr/bin/mm-delay', ['mm-delay', '20'])
#  os.execv('/usr/bin/mm-link', ['mm-link', down_linkfile, up_linkfile, '--once', '--uplink-log=/tmp/contest_uplink_log'])
#  os.execv(sproutbt2, mahimahi_base, port)
#else:
#  print 'parent'
#  (child_pid, child_status) = os.wait()
#  print 'Child exited with status %s' % child_status

# terminate the receiver
receiver.terminate()


# analyze performance locally
analyze = 'mm-throughput-graph 500 /tmp/contest_uplink_log > /dev/null'
#  and die q{mm-throughput-graph exited with error. NOT uploading};
print 'analyzing...'
os.system(analyze)
