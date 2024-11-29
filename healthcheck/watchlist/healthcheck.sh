#!/bin/bash

TARGET=192.168.0.69
URLS=(
"https://www.google.com"
"https://www.pinging.net"
)
# Pick a random url from the list
URL=${URLS[ $RANDOM % ${#URLS[@]} ]}

internal_status_code=$(curl --connect-timeout 10 -o /dev/null -s -w "%{http_code}" "http://${TARGET}:32400/identity")
external_status_code=$(curl --connect-timeout 10 -o /dev/null -s -w "%{http_code}" "$URL")

echo "External URL: $URL | external status code: $external_status_code | internal status code: $internal_status_code"

if [ "$external_status_code" -eq 200 ] && [ "$internal_status_code" -eq 200 ]; then
    exit 0
else
    exit 1
fi

