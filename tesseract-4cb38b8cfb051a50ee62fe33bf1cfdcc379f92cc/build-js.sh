#!/bin/bash

NPROC=$(cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l)

build_leptonica() {
  cd leptonica
  sh build-js.sh
  cd ..
}

build_tesseract() {
  mkdir -p build
  cd build
  emmake cmake .. -DLeptonica_DIR=leptonica/build
  emmake make -j${NPROC}
  cd ..
}

main() {
  build_leptonica
  build_tesseract
}

main "$@"
