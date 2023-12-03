#!/usr/bin/env bash

export BENCHMARK_NAME=two-stage
export IMAGE_NAME=fishfuzz:ae-twostage

pushd $BENCHMARK_NAME

docker run -it -v $PWD/results/:/results --name validate_$BENCHMARK_NAME $IMAGE_NAME bash

