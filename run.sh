#!/bin/bash

set -e

export MSYS_NO_PATHCONV=1

if [ "$1" == "build_generator" ]; then
  docker build -f Dockerfile.generator -t generator .
elif [ "$1" == "run_generator" ]; then
  mkdir -p data
  docker run --rm -v "$(pwd)/data:/data" generator
elif [ "$1" == "create_local_data" ]; then
  mkdir -p local_data
  python generate.py local_data
elif [ "$1" == "build_reporter" ]; then
  docker build -f Dockerfile.reporter -t reporter .
elif [ "$1" == "run_reporter" ]; then
  mkdir -p data
  docker run --rm -v "$(pwd)/data:/data" reporter
else
  echo "Unknown command"
  exit 1
fi