#!/bin/bash
/usr/bin/wget --no-check-certificate `/bin/cat API.txt` --output-document=weather.xml
/bin/sed -i "2i\<?xml-stylesheet href=\"weather.xsl\" type=\"text/xsl\"?>\n" weather.xml
