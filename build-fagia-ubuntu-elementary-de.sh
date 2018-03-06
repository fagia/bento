#!/bin/bash

set -e

UBUNTU_VERSION="16.04"
BASE_DIR="$(cd $(dirname $0); pwd)"
PACKER_DIR="$BASE_DIR/ubuntu/"
BOX_PATH="$BASE_DIR/builds/ubuntu-$UBUNTU_VERSION.virtualbox.box"
BOX_JSON="ubuntu-$UBUNTU_VERSION-amd64.json"
BOX_NAME="fagia/ubuntu-elementary-de-$UBUNTU_VERSION"

rm $BOX_PATH || true
cd $PACKER_DIR
packer build -only=virtualbox-iso $BOX_JSON
vagrant box remove $BOX_NAME || true
vagrant box add $BOX_NAME $BOX_PATH

