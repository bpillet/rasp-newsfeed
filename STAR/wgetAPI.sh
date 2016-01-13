#!/bin/bash
wget --no-check-certificate `cat API\ STAR.txt` --output-document=32.xml
sed -i "2i\<?xml-stylesheet href=\"32.xsl\" type=\"text/xsl\"?>\n" 32.xml
