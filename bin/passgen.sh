#!/bin/sh

set -e

COUNT=10
LENGTHS="10 13 16"

for l in ${LENGTHS}; do
	echo "${l} character(s)"
	apg -M SNCL -n ${COUNT} -m ${l} -x ${l}
	echo
done
