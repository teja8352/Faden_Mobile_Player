#!/bin/sh

set -ex

cd source

ls -ltr

echo "Welcome to the world of Operations."

npm install
cordova build --android