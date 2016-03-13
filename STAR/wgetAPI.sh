#!/bin/bash
/usr/bin/wget --no-check-certificate `/bin/cat /home/hilbert/rasp-newsfeed/STAR/API_STAR.txt` --output-document=/home/hilbert/rasp-newsfeed/STAR/star.xml
