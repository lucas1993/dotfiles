#!/usr/bin/env python
# encoding: utf-8

import Orgnode, datetime, os, time

delta = datetime.date.today() + datetime.timedelta(days=5)

filename = "/home/amaral/.agenda.org"
nodelist = Orgnode.makelist(filename)

#print nodelist


warn_list = []

for n in nodelist:
    if n.Deadline().__str__() != '' and n.Deadline() <= delta:
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
if len(warn_string) > 0 :
    time.sleep(5)
    os.system(cmd)
