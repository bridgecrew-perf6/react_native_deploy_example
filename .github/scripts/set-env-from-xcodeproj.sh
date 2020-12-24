#!/bin/bash

set -euo pipefail

SCHEME="$(cd ./ios; xcodebuild -list -json | jq -r '.project.schemes[0]')"
PRODUCT_NAME="$(cd ./ios; xcodebuild -scheme "$SCHEME" -showBuildSettings | grep " PRODUCT_NAME " | sed "s/[ ]*PRODUCT_NAME = //")"
echo "PRODUCT_NAME=$PRODUCT_NAME" >> $GITHUB_ENV
