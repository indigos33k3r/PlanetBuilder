#! /bin/python

import sys
import re

pwd = sys.argv[1]
tpline = re.compile("template_files")
output = re.compile("output_dir")
cache = re.compile("cache_directory")

for line in sys.stdin.readlines() :
	if tpline.match(line) :
		parts = line.split(" ")
		tpls = [pwd+"/"+(xs.split("/"))[-1] for xs in parts[2:]]
		print ("template_files = " + " ".join(tpls)).strip()
	else :
		if output.match(line) :
			print "output_dir = " + pwd
		elif cache.match(line) :
			print "cache_directory = %s/cache" % pwd
		else :
			print line.strip()


