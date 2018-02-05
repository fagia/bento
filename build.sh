#!/bin/bash

set -e

BASE_DIR="$(cd $(dirname $0); pwd)"
PACKER_DIR="$BASE_DIR/ubuntu/"
BOX_PATH="$BASE_DIR/builds/ubuntu-16.04.virtualbox.box"
BOX_JSON="ubuntu-16.04-amd64.json"
BOX_NAME="fagia/ubuntu-elementary-de-16.04"

rm $BOX_PATH || true
cd $PACKER_DIR
packer build -only=virtualbox-iso $BOX_JSON
vagrant box remove $BOX_NAME || true
vagrant box add $BOX_NAME $BOX_PATH
