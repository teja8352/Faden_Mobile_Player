#!/bin/sh

set -ex

apt-get update && \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
add-apt-repository -y ppa:webupd8team/java && \
apt-get update && \
apt-get install -y oracle-java8-installer && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/cache/oracle-jdk8-installer

JAVA_HOME=/usr/lib/jvm/java-8-oracle

curl http://dl.google.com/android/android-sdk_r24.2-linux.tgz | tar xz -C /usr/local/

ANDROID_HOME=/usr/local/android-sdk-linux

PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /usr/local/android-sdk-linux/tools/android update sdk --no-ui -a --filter platform-tool,build-tools-23.0.3,android-23

apt-get update && \
apt-get install -y software-properties-common curl python git && \
curl https://nodejs.org/dist/v4.4.5/node-v4.4.5-linux-x64.tar.gz | tar xz -C /usr/local/ --strip=1 && \
npm install -g cordova@4.3.0

cd source

ls -ltr

echo "Welcome to the world of Operations."
