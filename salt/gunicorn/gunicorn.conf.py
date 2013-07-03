#!/usr/bin/python

#################################################
# Gunicorn config for app.basketchaser.com
#
# This is loaded via Supervisor into Gunicorn
# 
#################################################

import os

bind = "127.0.0.1:8000"
daemon = False
debug = False
pidfile = "/tmp/gunicorn.pid"
workers = (os.sysconf("SC_NPROCESSORS_ONLN") * 4) + 1
loglevel = "info"
logfile = "/var/log/gunicorn.log"
timeout = 120
limit_request_line = 65536
