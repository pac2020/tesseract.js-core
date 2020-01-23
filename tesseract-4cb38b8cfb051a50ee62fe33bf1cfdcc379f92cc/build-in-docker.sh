#!/bin/bash
#
# This script is specific for building tesseract.js
# 
# Before running this script, you need to install docker first.
#

EMSCRIPTEN_VERSION=1.38.45
TARGET=${1:-build}

check_command() {
  CMD=$1
  command -v $CMD >/dev/null 2>&1 || { echo >&2 "$CMD is not installed  Aborting."; exit 1; }
}

build() {
  docker run -it \
    -v ${PWD}:/src \
    trzeci/emscripten:${EMSCRIPTEN_VERSION} \
    sh -c "sh ./${TARGET}-js.sh"
}

main() {
  check_command docker
  build
}

main "$@"
