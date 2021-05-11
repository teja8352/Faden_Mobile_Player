#!/bin/sh

set -ex

cd source

export APP_HOME=$PWD

echo n | npm install
npm i -g ionic
npm i -g cordova

apt update
echo Y | apt install android-sdk

export ANDROID_HOME=/usr/lib/android-sdk/
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

cd $ANDROID_HOME
curl --output sdk-tools-linux.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
echo  Y | unzip sdk-tools-linux.zip
echo  Y | ./tools/bin/sdkmanager --install 'build-tools;29.0.2' 'platform-tools' 'platforms;android-29' 'tools'

cd $APP_HOME

ionic cordova platform add android
echo n | ionic cordova build android --prod --aot --release
keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore HelloWorld-release-unsigned.apk alias_name
zipalign -v 4 HelloWorld-release-unsigned.apk HelloWorld.apk