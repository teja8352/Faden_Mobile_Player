#!/bin/sh

set -ex
cd source
apt install zip

echo n | npm install

ionic cordova platform add android
echo n | ionic cordova build android --prod --aot --release
#keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
#jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore HelloWorld-release-unsigned.apk alias_name
#zipalign -v 4 HelloWorld-release-unsigned.apk HelloWorld.apk
tar -czvf ../output/apk.tar.gz platforms/android/app/build/outputs/apk/release