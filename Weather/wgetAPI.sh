#!/bin/bash
/usr/bin/wget --no-check-certificate `/bin/cat API.txt` --output-document=/home/hilbert/rasp-newsfeed/Weather/weather.xml
/bin/sed -i "2i\<?xml-stylesheet href=\"weather.xsl\" type=\"text/xsl\"?>\n" /home/hilbert/rasp-newsfeed/Weather/weather.xml
