#!/bin/sh

# It is a shell implementation of squid rewriter explained here:
#  http://wiki.squid-cache.org/Features/Redirectors

SED=''

# Read SED data from config
. /opt/squid/rewriter.conf

while IFS= read -r line; do
    line_out=`echo "$line" | cut -f 1 -d " " | sed "${SED}"`
    if [ "$line" != "$line_out" ]; then
        echo "$line_out"
    else
        echo ""
    fi
done
