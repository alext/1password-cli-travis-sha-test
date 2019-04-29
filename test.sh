#!/bin/bash

set -eux

wget --no-cache -O op_cli.zip https://cache.agilebits.com/dist/1P/op/pkg/v0.5.5/op_darwin_amd64_v0.5.5.zip

ls -l op_cli.zip
shasum -a 256 -t op_cli.zip
shasum -a 256 -b op_cli.zip
shasum -a 256 -0 op_cli.zip

expected=e4ea329debcf991434d90728fa3cba531bce5449a08883d3530dfeb796fc3a3b
actual=$(shasum -a 256 "./op_cli.zip" | awk '{print $1}')

if [ "${actual}" = "${expected}" ]; then
  echo "shasum matches"
  echo "Downloaded file has checksum: ${actual}"
else
  echo -e "shasum mismatch.\nwant: ${expected}\ngot:  ${actual}"
  exit 1
fi
