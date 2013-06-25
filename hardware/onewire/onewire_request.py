#!/usr/bin/env python2

from socket import *
import sys

def connectEP(host, port):
    s = socket(AF_INET, SOCK_STREAM)
    s.settimeout(5)
    s.connect((host, port))
    return s

def getTemperature():
    s.send("1w list\n")
    sensors = []
    sensors_result = {}
    # list of all sensors
    while 1:
        response = s.recv(1024).rstrip("\n")
        if not response: break
        if response != "OK":
            sensors.append(response)
        else:
            break
    # convert sensor and get value
    s.send("1w convert\n")
    while 1:
        response = s.recv(1024).rstrip("\n")
        if response == "OK":
            break
    for sensor in sensors:
        # wert auslesen 
        s.send("1w get " + sensor + "\n")
        response = s.recv(1024).rstrip("\n").lstrip()
        sensors_result[sensor] = response
    return(sensors_result)

if (len(sys.argv) != 2 ):
    print "Usage: {} IP-ADDRESS".format(sys.argv[0])
    sys.exit(1)
s = connectEP(str(sys.argv[1]), 2701)
for sensor, value in getTemperature().iteritems():
    print sensor + " " + value
sys.exit(0)
