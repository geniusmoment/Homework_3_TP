#!/bin/bash

set -e

export MSYS_NO_PATHCONV=1

if [ "$1" == "build_generator" ]; then
  docker build -t generator .
elif [ "$1" == "run_generator" ]; then
  mkdir -p data
  docker run --rm -v "$(pwd)/data:/data" generator
elif [ "$1" == "create_local_data" ]; then
  mkdir -p local_data
  python generate.py local_data
else
  echo "Unknown command"
  exit 1
fi