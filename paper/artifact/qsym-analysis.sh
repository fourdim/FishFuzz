#!/usr/bin/env bash

export BENCHMARK_NAME=qsym
export IMAGE_NAME=fishfuzz:ae-qsym

pushd $BENCHMARK_NAME

docker run -it -v $PWD/results/:/results --name validate_$BENCHMARK_NAME $IMAGE_NAME bash
