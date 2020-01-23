#!/bin/sh

clean_dir() {
  cd $1
  git clean -dxf
  cd -
}

main() {
  clean_dir leptonica/zlib
  clean_dir leptonica/libjpeg
  clean_dir leptonica/libpng
  clean_dir leptonica/libtiff
  clean_dir leptonica
}

main "$@"
