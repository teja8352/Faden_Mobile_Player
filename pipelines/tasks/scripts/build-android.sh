#!/bin/sh

set -ex

cd source

java -version

cordova build --android

echo "Welcome to the world of Operations."
