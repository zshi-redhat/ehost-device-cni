#!/usr/bin/env bash
set -e
cd $(dirname "$0")

if [ "$(uname)" == "Darwin" ]; then
	export GOOS="${GOOS:-linux}"
fi

ORG_PATH="github.com/containernetworking"
export REPO_PATH="${ORG_PATH}/ehost-device"

if [ ! -h gopath/src/${REPO_PATH} ]; then
	mkdir -p gopath/src/${ORG_PATH}
	ln -s ../../../.. gopath/src/${REPO_PATH} || exit 255
fi

export GOPATH=${PWD}/gopath
export GO="${GO:-go}"

mkdir -p "${PWD}/bin"
export GOBIN=${PWD}/bin

echo "Building ehost-device plugin"
$GO install "$@" ${REPO_PATH}/cmd/ehost-device

echo "Done!"
