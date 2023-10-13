#!/usr/bin/env bash

set -eux -o pipefail

echo "Enter the sudo password, please"
read -s password

echo $password | sudo -S echo "sudo password is correct"

###############################################################
# two-stage
###############################################################

export BENCHMARK_NAME=two-stage
export IMAGE_NAME=fishfuzz:ae-twostage

pushd $BENCHMARK_NAME

docker build -t $IMAGE_NAME .

python scripts/generate_script.py -b "$PWD/runtime/fuzz_script"

python scripts/generate_runtime.py -b "$PWD/runtime"

docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffafl_cflow --cpuset-cpus 0 fishfuzz:ae-twostage "/work/fuzz_script/ffafl/cflow.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffapp_cflow --cpuset-cpus 1 fishfuzz:ae-twostage "/work/fuzz_script/ffapp/cflow.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name afl_cflow --cpuset-cpus 2 fishfuzz:ae-twostage "/work/fuzz_script/afl/cflow.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name aflpp_cflow --cpuset-cpus 3 fishfuzz:ae-twostage "/work/fuzz_script/aflpp/cflow.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffafl_cxxfilt --cpuset-cpus 4 fishfuzz:ae-twostage "/work/fuzz_script/ffafl/cxxfilt.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffapp_cxxfilt --cpuset-cpus 5 fishfuzz:ae-twostage "/work/fuzz_script/ffapp/cxxfilt.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name afl_cxxfilt --cpuset-cpus 6 fishfuzz:ae-twostage "/work/fuzz_script/afl/cxxfilt.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name aflpp_cxxfilt --cpuset-cpus 7 fishfuzz:ae-twostage "/work/fuzz_script/aflpp/cxxfilt.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffafl_w3m --cpuset-cpus 8 fishfuzz:ae-twostage "/work/fuzz_script/ffafl/w3m.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffapp_w3m --cpuset-cpus 9 fishfuzz:ae-twostage "/work/fuzz_script/ffapp/w3m.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name afl_w3m --cpuset-cpus 10 fishfuzz:ae-twostage "/work/fuzz_script/afl/w3m.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name aflpp_w3m --cpuset-cpus 11 fishfuzz:ae-twostage "/work/fuzz_script/aflpp/w3m.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffafl_mujs --cpuset-cpus 12 fishfuzz:ae-twostage "/work/fuzz_script/ffafl/mujs.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffapp_mujs --cpuset-cpus 13 fishfuzz:ae-twostage "/work/fuzz_script/ffapp/mujs.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name afl_mujs --cpuset-cpus 14 fishfuzz:ae-twostage "/work/fuzz_script/afl/mujs.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name aflpp_mujs --cpuset-cpus 15 fishfuzz:ae-twostage "/work/fuzz_script/aflpp/mujs.sh"

sleep 24h && docker rm -f $(docker ps -a -q -f "ancestor=$IMAGE_NAME")

docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffafl_mutool --cpuset-cpus 0 fishfuzz:ae-twostage "/work/fuzz_script/ffafl/mutool.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffapp_mutool --cpuset-cpus 1 fishfuzz:ae-twostage "/work/fuzz_script/ffapp/mutool.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name afl_mutool --cpuset-cpus 2 fishfuzz:ae-twostage "/work/fuzz_script/afl/mutool.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name aflpp_mutool --cpuset-cpus 3 fishfuzz:ae-twostage "/work/fuzz_script/aflpp/mutool.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffafl_tic --cpuset-cpus 4 fishfuzz:ae-twostage "/work/fuzz_script/ffafl/tic.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffapp_tic --cpuset-cpus 5 fishfuzz:ae-twostage "/work/fuzz_script/ffapp/tic.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name afl_tic --cpuset-cpus 6 fishfuzz:ae-twostage "/work/fuzz_script/afl/tic.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name aflpp_tic --cpuset-cpus 7 fishfuzz:ae-twostage "/work/fuzz_script/aflpp/tic.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffafl_dwarfdump --cpuset-cpus 8 fishfuzz:ae-twostage "/work/fuzz_script/ffafl/dwarfdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name ffapp_dwarfdump --cpuset-cpus 9 fishfuzz:ae-twostage "/work/fuzz_script/ffapp/dwarfdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name afl_dwarfdump --cpuset-cpus 10 fishfuzz:ae-twostage "/work/fuzz_script/afl/dwarfdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/two-stage/runtime:/work --name aflpp_dwarfdump --cpuset-cpus 11 fishfuzz:ae-twostage "/work/fuzz_script/aflpp/dwarfdump.sh"

sleep 24h && docker rm -f $(docker ps -a -q -f "ancestor=$IMAGE_NAME")

set +x

echo $password | sudo -S chown -R $(id -u):$(id -g) runtime/out

set -x

mkdir results/

python3 scripts/copy_results.py -s "$PWD/runtime" -d "$PWD/results/" -r 0

cp -r scripts/ results/

docker run -it -v $PWD/results/:/results --name validate_twostage $IMAGE_NAME bash

python3 results/scripts/analysis.py -b /results -c results/scripts/asan.queue.json -r 0 -d /results/log/0/
python3 results/scripts/analysis.py -b /results -c results/scripts/asan.crash.json -r 0 -d /results/log/0/

python3 results/scripts/print_result.py -b /results/log/ -r 0 -t all

echo "two-stage done"

popd

###############################################################
# asan
###############################################################

export BENCHMARK_NAME=asan
export IMAGE_NAME=fishfuzz:ae-asan

pushd $BENCHMARK_NAME

docker build -t $IMAGE_NAME .

python scripts/generate_script.py -b "$PWD/runtime/fuzz_script"

python scripts/generate_runtime.py -b "$PWD/runtime"

docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffafl_catdoc --cpuset-cpus 0 fishfuzz:ae-asan "/work/fuzz_script/ffafl/catdoc.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffapp_catdoc --cpuset-cpus 1 fishfuzz:ae-asan "/work/fuzz_script/ffapp/catdoc.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name afl_catdoc --cpuset-cpus 2 fishfuzz:ae-asan "/work/fuzz_script/afl/catdoc.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name aflpp_catdoc --cpuset-cpus 3 fishfuzz:ae-asan "/work/fuzz_script/aflpp/catdoc.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffafl_exiv2 --cpuset-cpus 4 fishfuzz:ae-asan "/work/fuzz_script/ffafl/exiv2.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffapp_exiv2 --cpuset-cpus 5 fishfuzz:ae-asan "/work/fuzz_script/ffapp/exiv2.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name afl_exiv2 --cpuset-cpus 6 fishfuzz:ae-asan "/work/fuzz_script/afl/exiv2.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name aflpp_exiv2 --cpuset-cpus 7 fishfuzz:ae-asan "/work/fuzz_script/aflpp/exiv2.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffafl_flvmeta --cpuset-cpus 8 fishfuzz:ae-asan "/work/fuzz_script/ffafl/flvmeta.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffapp_flvmeta --cpuset-cpus 9 fishfuzz:ae-asan "/work/fuzz_script/ffapp/flvmeta.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name afl_flvmeta --cpuset-cpus 10 fishfuzz:ae-asan "/work/fuzz_script/afl/flvmeta.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name aflpp_flvmeta --cpuset-cpus 11 fishfuzz:ae-asan "/work/fuzz_script/aflpp/flvmeta.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffafl_lou_checktable --cpuset-cpus 12 fishfuzz:ae-asan "/work/fuzz_script/ffafl/lou_checktable.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffapp_lou_checktable --cpuset-cpus 13 fishfuzz:ae-asan "/work/fuzz_script/ffapp/lou_checktable.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name afl_lou_checktable --cpuset-cpus 14 fishfuzz:ae-asan "/work/fuzz_script/afl/lou_checktable.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name aflpp_lou_checktable --cpuset-cpus 15 fishfuzz:ae-asan "/work/fuzz_script/aflpp/lou_checktable.sh"

sleep 60h && docker rm -f $(docker ps -a -q -f "ancestor=$IMAGE_NAME")

docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffafl_MP4Box --cpuset-cpus 0 fishfuzz:ae-asan "/work/fuzz_script/ffafl/MP4Box.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffapp_MP4Box --cpuset-cpus 1 fishfuzz:ae-asan "/work/fuzz_script/ffapp/MP4Box.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name afl_MP4Box --cpuset-cpus 2 fishfuzz:ae-asan "/work/fuzz_script/afl/MP4Box.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name aflpp_MP4Box --cpuset-cpus 3 fishfuzz:ae-asan "/work/fuzz_script/aflpp/MP4Box.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffafl_nasm --cpuset-cpus 4 fishfuzz:ae-asan "/work/fuzz_script/ffafl/nasm.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffapp_nasm --cpuset-cpus 5 fishfuzz:ae-asan "/work/fuzz_script/ffapp/nasm.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name afl_nasm --cpuset-cpus 6 fishfuzz:ae-asan "/work/fuzz_script/afl/nasm.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name aflpp_nasm --cpuset-cpus 7 fishfuzz:ae-asan "/work/fuzz_script/aflpp/nasm.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffafl_nm-new --cpuset-cpus 8 fishfuzz:ae-asan "/work/fuzz_script/ffafl/nm-new.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffapp_nm-new --cpuset-cpus 9 fishfuzz:ae-asan "/work/fuzz_script/ffapp/nm-new.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name afl_nm-new --cpuset-cpus 10 fishfuzz:ae-asan "/work/fuzz_script/afl/nm-new.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name aflpp_nm-new --cpuset-cpus 11 fishfuzz:ae-asan "/work/fuzz_script/aflpp/nm-new.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffafl_tcpdump --cpuset-cpus 12 fishfuzz:ae-asan "/work/fuzz_script/ffafl/tcpdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffapp_tcpdump --cpuset-cpus 13 fishfuzz:ae-asan "/work/fuzz_script/ffapp/tcpdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name afl_tcpdump --cpuset-cpus 14 fishfuzz:ae-asan "/work/fuzz_script/afl/tcpdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name aflpp_tcpdump --cpuset-cpus 15 fishfuzz:ae-asan "/work/fuzz_script/aflpp/tcpdump.sh"

sleep 60h && docker rm -f $(docker ps -a -q -f "ancestor=$IMAGE_NAME")

docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffafl_tcpprep --cpuset-cpus 0 fishfuzz:ae-asan "/work/fuzz_script/ffafl/tcpprep.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffapp_tcpprep --cpuset-cpus 1 fishfuzz:ae-asan "/work/fuzz_script/ffapp/tcpprep.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name afl_tcpprep --cpuset-cpus 2 fishfuzz:ae-asan "/work/fuzz_script/afl/tcpprep.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name aflpp_tcpprep --cpuset-cpus 3 fishfuzz:ae-asan "/work/fuzz_script/aflpp/tcpprep.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffafl_tiff2pdf --cpuset-cpus 4 fishfuzz:ae-asan "/work/fuzz_script/ffafl/tiff2pdf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffapp_tiff2pdf --cpuset-cpus 5 fishfuzz:ae-asan "/work/fuzz_script/ffapp/tiff2pdf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name afl_tiff2pdf --cpuset-cpus 6 fishfuzz:ae-asan "/work/fuzz_script/afl/tiff2pdf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name aflpp_tiff2pdf --cpuset-cpus 7 fishfuzz:ae-asan "/work/fuzz_script/aflpp/tiff2pdf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffafl_gif2tga --cpuset-cpus 8 fishfuzz:ae-asan "/work/fuzz_script/ffafl/gif2tga.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name ffapp_gif2tga --cpuset-cpus 9 fishfuzz:ae-asan "/work/fuzz_script/ffapp/gif2tga.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name afl_gif2tga --cpuset-cpus 10 fishfuzz:ae-asan "/work/fuzz_script/afl/gif2tga.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/asan/runtime:/work --name aflpp_gif2tga --cpuset-cpus 11 fishfuzz:ae-asan "/work/fuzz_script/aflpp/gif2tga.sh"

sleep 60h && docker rm -f $(docker ps -a -q -f "ancestor=$IMAGE_NAME")

set +x

echo $password | sudo -S chown -R $(id -u):$(id -g) runtime/out

set -x

mkdir results/

python3 scripts/copy_results.py -s "$PWD/runtime" -d "$PWD/results/" -r 0

cp -r scripts/ results/

docker run -it -v $PWD/results/:/results --name validate_twostage $IMAGE_NAME bash

python3 results/scripts/analysis.py -b /results -c results/scripts/asan.queue.json -r 0 -d /results/log/0/
python3 results/scripts/analysis.py -b /results -c results/scripts/asan.crash.json -r 0 -d /results/log/0/

python3 results/scripts/print_result.py -b /results/log/ -r 0 -t all

echo "asan done"

popd

###############################################################
# ubsan
###############################################################

export BENCHMARK_NAME=ubsan
export IMAGE_NAME=fishfuzz:ae-ubsan

pushd $BENCHMARK_NAME

docker build -t $IMAGE_NAME .

python scripts/generate_script.py -b "$PWD/runtime/fuzz_script"

python scripts/generate_runtime.py -b "$PWD/runtime"

docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffafl_djpeg --cpuset-cpus 0 fishfuzz:ae-ubsan "/work/fuzz_script/ffafl/djpeg.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffapp_djpeg --cpuset-cpus 1 fishfuzz:ae-ubsan "/work/fuzz_script/ffapp/djpeg.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name afl_djpeg --cpuset-cpus 2 fishfuzz:ae-ubsan "/work/fuzz_script/afl/djpeg.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name aflpp_djpeg --cpuset-cpus 3 fishfuzz:ae-ubsan "/work/fuzz_script/aflpp/djpeg.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffafl_jasper --cpuset-cpus 4 fishfuzz:ae-ubsan "/work/fuzz_script/ffafl/jasper.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffapp_jasper --cpuset-cpus 5 fishfuzz:ae-ubsan "/work/fuzz_script/ffapp/jasper.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name afl_jasper --cpuset-cpus 6 fishfuzz:ae-ubsan "/work/fuzz_script/afl/jasper.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name aflpp_jasper --cpuset-cpus 7 fishfuzz:ae-ubsan "/work/fuzz_script/aflpp/jasper.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffafl_objdump --cpuset-cpus 8 fishfuzz:ae-ubsan "/work/fuzz_script/ffafl/objdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffapp_objdump --cpuset-cpus 9 fishfuzz:ae-ubsan "/work/fuzz_script/ffapp/objdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name afl_objdump --cpuset-cpus 10 fishfuzz:ae-ubsan "/work/fuzz_script/afl/objdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name aflpp_objdump --cpuset-cpus 11 fishfuzz:ae-ubsan "/work/fuzz_script/aflpp/objdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffafl_readelf --cpuset-cpus 12 fishfuzz:ae-ubsan "/work/fuzz_script/ffafl/readelf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffapp_readelf --cpuset-cpus 13 fishfuzz:ae-ubsan "/work/fuzz_script/ffapp/readelf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name afl_readelf --cpuset-cpus 14 fishfuzz:ae-ubsan "/work/fuzz_script/afl/readelf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name aflpp_readelf --cpuset-cpus 15 fishfuzz:ae-ubsan "/work/fuzz_script/aflpp/readelf.sh"

sleep 24h && docker rm -f $(docker ps -a -q -f "ancestor=$IMAGE_NAME")

docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffafl_tcpdump --cpuset-cpus 0 fishfuzz:ae-ubsan "/work/fuzz_script/ffafl/tcpdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffapp_tcpdump --cpuset-cpus 1 fishfuzz:ae-ubsan "/work/fuzz_script/ffapp/tcpdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name afl_tcpdump --cpuset-cpus 2 fishfuzz:ae-ubsan "/work/fuzz_script/afl/tcpdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name aflpp_tcpdump --cpuset-cpus 3 fishfuzz:ae-ubsan "/work/fuzz_script/aflpp/tcpdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffafl_tiff2pdf --cpuset-cpus 4 fishfuzz:ae-ubsan "/work/fuzz_script/ffafl/tiff2pdf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffapp_tiff2pdf --cpuset-cpus 5 fishfuzz:ae-ubsan "/work/fuzz_script/ffapp/tiff2pdf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name afl_tiff2pdf --cpuset-cpus 6 fishfuzz:ae-ubsan "/work/fuzz_script/afl/tiff2pdf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name aflpp_tiff2pdf --cpuset-cpus 7 fishfuzz:ae-ubsan "/work/fuzz_script/aflpp/tiff2pdf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffafl_tiff2ps --cpuset-cpus 8 fishfuzz:ae-ubsan "/work/fuzz_script/ffafl/tiff2ps.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffapp_tiff2ps --cpuset-cpus 9 fishfuzz:ae-ubsan "/work/fuzz_script/ffapp/tiff2ps.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name afl_tiff2ps --cpuset-cpus 10 fishfuzz:ae-ubsan "/work/fuzz_script/afl/tiff2ps.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name aflpp_tiff2ps --cpuset-cpus 11 fishfuzz:ae-ubsan "/work/fuzz_script/aflpp/tiff2ps.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffafl_xmllint --cpuset-cpus 12 fishfuzz:ae-ubsan "/work/fuzz_script/ffafl/xmllint.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name ffapp_xmllint --cpuset-cpus 13 fishfuzz:ae-ubsan "/work/fuzz_script/ffapp/xmllint.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name afl_xmllint --cpuset-cpus 14 fishfuzz:ae-ubsan "/work/fuzz_script/afl/xmllint.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/ubsan/runtime:/work --name aflpp_xmllint --cpuset-cpus 15 fishfuzz:ae-ubsan "/work/fuzz_script/aflpp/xmllint.sh"

sleep 24h && docker rm -f $(docker ps -a -q -f "ancestor=$IMAGE_NAME")

set +x

echo $password | sudo -S chown -R $(id -u):$(id -g) runtime/out

set -x

mkdir results/

python3 scripts/copy_results.py -s "$PWD/runtime" -d "$PWD/results/" -r 0

cp -r scripts/ results/

docker run -it -v $PWD/results/:/results --name validate_twostage $IMAGE_NAME bash

python3 results/scripts/analysis.py -b /results -c results/scripts/asan.queue.json -r 0 -d /results/log/0/
python3 results/scripts/analysis.py -b /results -c results/scripts/asan.crash.json -r 0 -d /results/log/0/

python3 results/scripts/print_result.py -b /results/log/ -r 0 -t all

echo "ubsan done"

popd

###############################################################
# qsym
###############################################################

export BENCHMARK_NAME=qsym
export IMAGE_NAME=fishfuzz:ae-qsym

pushd $BENCHMARK_NAME

docker build -t $IMAGE_NAME .

python scripts/generate_script.py -b "$PWD/runtime/fuzz_script"

python scripts/generate_runtime.py -b "$PWD/runtime"

docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name ffafl_djpeg --cpuset-cpus 0 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/ffafl/djpeg.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name afl_djpeg --cpuset-cpus 1 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/afl/djpeg.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name ffafl_jasper --cpuset-cpus 2 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/ffafl/jasper.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name afl_jasper --cpuset-cpus 3 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/afl/jasper.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name ffafl_objdump --cpuset-cpus 4 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/ffafl/objdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name afl_objdump --cpuset-cpus 5 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/afl/objdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name ffafl_readelf --cpuset-cpus 6 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/ffafl/readelf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name afl_readelf --cpuset-cpus 7 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/afl/readelf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name ffafl_tcpdump --cpuset-cpus 8 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/ffafl/tcpdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name afl_tcpdump --cpuset-cpus 9 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/afl/tcpdump.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name ffafl_tiff2pdf --cpuset-cpus 10 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/ffafl/tiff2pdf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name afl_tiff2pdf --cpuset-cpus 11 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/afl/tiff2pdf.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name ffafl_tiff2ps --cpuset-cpus 12 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/ffafl/tiff2ps.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name afl_tiff2ps --cpuset-cpus 13 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/afl/tiff2ps.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name ffafl_xmllint --cpuset-cpus 14 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/ffafl/xmllint.sh"
docker run -dt -v /home/fourdim/FishFuzz/paper/artifact/qsym/runtime:/work --name afl_xmllint --cpuset-cpus 15 --cap-add=SYS_PTRACE fishfuzz:ae-qsym "/work/fuzz_script/afl/xmllint.sh"

sleep 24h && docker rm -f $(docker ps -a -q -f "ancestor=$IMAGE_NAME")

set +x

echo $password | sudo -S chown -R $(id -u):$(id -g) runtime/out

set -x

mkdir results/

python3 scripts/copy_results.py -s "$PWD/runtime" -d "$PWD/results/" -r 0

cp -r scripts/ results/

docker run -it -v $PWD/results/:/results --name validate_twostage $IMAGE_NAME bash

python3 results/scripts/analysis.py -b /results -c results/scripts/ubsan.queue.json -r 0 -d /results/log/0/

python3 results/scripts/print_result.py -b /results/log/ -r 0 -t all

echo "qsym done"

popd
