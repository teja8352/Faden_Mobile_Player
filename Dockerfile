FROM timbru31/java-node:8-jdk-14

WORKDIR /root/code

RUN npm i -g ionic
RUN npm i -g cordova

RUN apt update
RUN echo Y | apt install android-sdk

ENV ANDROID_HOME=/usr/lib/android-sdk/
ENV PATH=$PATH:$ANDROID_HOME/tools/bin
ENV PATH=$PATH:$ANDROID_HOME/platform-tools

RUN curl --output sdk-tools-linux.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN echo  y | unzip sdk-tools-linux.zip
RUN echo  y | ./tools/bin/sdkmanager --install 'build-tools;29.0.2' 'platform-tools' 'platforms;android-29' 'tools'
RUN echo yes | ./tools/bin/sdkmanager --licenses

RUN echo 'image created'
