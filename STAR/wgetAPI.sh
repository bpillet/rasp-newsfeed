#!/bin/bash
/usr/bin/wget --no-check-certificate `/bin/cat /home/hilbert/rasp-newsfeed/STAR/API_STAR.txt` --output-document=/home/hilbert/rasp-newsfeed/STAR/star.xml
/bin/sed -i "2i\<?xml-stylesheet href=\"star.xsl\" type=\"text/xsl\"?>\n" /home/hilbert/rasp-newsfeed/STAR/star.xml
