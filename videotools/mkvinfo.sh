#!/bin/sh
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
mkv="$(basename $1)"
map="$(dirname $1)"
docker run \
   --rm \
   --name "mkvinfo" \
   -v "$(pwd)/$map:/input:ro" \
   --entrypoint "mkvinfo" \
   ivonet/videotools:latest \
   "/input/$mkv"
IFS=$SAVEIFS

