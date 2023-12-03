#!/usr/bin/env bash

export BENCHMARK_NAME=asan
export IMAGE_NAME=fishfuzz:ae-asan

pushd $BENCHMARK_NAME

docker run -it -v $PWD/results/:/results --name validate_$BENCHMARK_NAME $IMAGE_NAME bash
