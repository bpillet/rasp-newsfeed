#!/bin/bash
/usr/bin/wget --no-check-certificate `/bin/cat API.txt` --output-document=/home/hilbert/rasp-newsfeed/Weather/weather.xml
