#!/bin/sh

set -ex

cd source

node -v

java -version


npm install -y


ionic cordova platform add android
ionic cordova build android --prod --aot --release
keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore HelloWorld-release-unsigned.apk alias_name
zipalign -v 4 HelloWorld-release-unsigned.apk HelloWorld.apk