#!/usr/bin/env bash

export BENCHMARK_NAME=ubsan
export IMAGE_NAME=fishfuzz:ae-ubsan

pushd $BENCHMARK_NAME

docker run -it -v $PWD/results/:/results --name validate_$BENCHMARK_NAME $IMAGE_NAME bash
