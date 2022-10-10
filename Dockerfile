# Ubuntu 22.04 base with openjdk & maven already installed
FROM maven:3.8.6-eclipse-temurin-11

RUN groupadd --gid 1000 build \
  && useradd --uid 1000 --gid build --shell /bin/bash --create-home build

RUN set -ex \
    && apt-get update && apt-get install -y ca-certificates curl apt-transport-https lsb-release wget gnupg --no-install-recommends \
    && (curl -sL https://deb.nodesource.com/setup_16.x | bash -) \
    && apt-get install -y nodejs gcc g++ make xvfb libgtk-3-0 libgbm1 libnss3 libasound2 \
    && rm -rf /var/lib/apt/lists/* 


ENV USER_HOME_DIR="/home/build"
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

USER build
WORKDIR /home/build

CMD ["bash"]