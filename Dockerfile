FROM ruby:2.5-stretch
MAINTAINER a0s@github.com
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

ENV NVIDIA_PUB_KEY "http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub"
ENV NVIDIA_REPO "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64 /"

WORKDIR /app

COPY \
    Gemfile \
    Gemfile.lock \
    application.rb \
    exporter.rb \
    nvidia_smi.rb \
    ./

RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends build-essential wget \
    && wget -qO - ${NVIDIA_PUB_KEY} | apt-key add - \
    && echo ${NVIDIA_REPO} > /etc/apt/sources.list.d/cuda.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends nvidia-410-dev \
    && rm -rf /var/lib/apt/lists/* \
    && bundle install --deployment --without test

CMD ["bundle", "exec", "ruby", "application.rb", "1>&2"]
