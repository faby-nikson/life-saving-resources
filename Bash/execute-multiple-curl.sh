#!/usr/bin/env bash

# ----------
# @author: f-dumas
# Description: Execute multiple curl requests
# Command: ./execute-multiple-curl.sh my-url-to-cal.com
# ----------

# Example1: Execute one given route 150 times
url=$1;
for ((i=1;i<=150;i++)); do curl -X GET \
  "$url" \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
;done;

# Example2: Execute X routes randomly
url=$1;
numberOfIteration=100;
for ((i=1;i<=numberOfIteration;i++)); 
	do randomNumber=$(( $RANDOM % 4 )); 
	case $randomNumber in
	0)
		curl -X GET \
		  "$url/status" \
		  -H 'Cache-Control: no-cache' \
		;;
	1)
		curl -X GET \
		  "$url/404" \
		  -H 'Cache-Control: no-cache' \
		;;
	esac;	
done;