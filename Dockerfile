FROM ruby:2.6.5-slim-buster

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      build-essential \
      ca-certificates \
      curl \
      htop \
      git \
      net-tools \
      default-libmysqlclient-dev \
      openssl \
      ruby-dev \
      telnet \
      wget \
    && \
      wget 'https://github.com/fullstorydev/grpcurl/releases/download/v1.4.0/grpcurl_1.4.0_linux_x86_64.tar.gz' && \
      tar zxf grpcurl_1.4.0_linux_x86_64.tar.gz && \
      mv grpcurl /usr/local/bin/ \
    && \
      echo 'alias ll="ls -alt"' >> ~/.bashrc && \
      echo 'alias ..="cd ../"' >> ~/.bashrc && \
      echo 'alias ...="cd ../../"' >> ~/.bashrc \
    && \
      update-ca-certificates \
    && \
      apt-get upgrade -y \
    && \
      apt-get autoremove && \
      apt-get clean && \
      rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

