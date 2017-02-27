#!/bin/sh

# It is a shell implementation of squid rewriter explained here:
#  http://wiki.squid-cache.org/Features/Redirectors

SED=''
. /opt/squid/rewriter.conf

while IFS= read -r line; do
    line=`echo "$line" | cut -f 1 -d " "`
    line_out=`echo "$line" | sed "${SED}"`
    if [ "$line" != "$line_out" ]; then
        echo "$line_out"
        echo "Redirecting $line --> $line_out" >&2
    else
        echo ""
    fi
done
