#!/usr/bin/env python
# encoding: utf-8

import Orgnode, datetime, os, time

today = datetime.date.today()
tomorrow = datetime.timedelta(days=1)

filename = "/home/amaral/.agenda.org"
nodelist = Orgnode.makelist(filename)


warn_list = []

for n in nodelist:
    if n.Deadline() == today or n.Deadline() == tomorrow:
        head = n.Heading()
        warn_list.append(head)

title = "Deadlines"
warn_string = ""

for v in warn_list:
    warn_string += v + "\n"

if len(warn_string) > 0:
    warn_string = warn_string[:-1]

cmd = "notify-send " + title + " " + "\'" + warn_string + "\'"
print cmd
time.sleep(5)
os.system(cmd)
