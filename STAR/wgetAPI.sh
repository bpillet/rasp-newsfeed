#!/bin/bash
wget --no-check-certificate `cat API_STAR.txt` --output-document=star.xml
sed -i "2i\<?xml-stylesheet href=\"star.xsl\" type=\"text/xsl\"?>\n" star.xml
