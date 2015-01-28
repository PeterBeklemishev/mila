#! /bin/bash

python3 firmwarrior/fw.py -P -p /dev/ttyUSB0 -e -f usercode.hex -V -r 
