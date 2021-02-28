FROM ruby:3.0.0-buster

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

ARG NVIDIA_PUB_KEY="https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub"
ARG NVIDIA_REPO="deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64 /"
ARG NVIDIA_VERSION="460.32.03-0ubuntu1"

WORKDIR /app
COPY . /app

RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends build-essential wget \
    && wget -qO - ${NVIDIA_PUB_KEY} | apt-key add - \
    && echo ${NVIDIA_REPO} > /etc/apt/sources.list.d/cuda.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends libnvidia-compute-460=${NVIDIA_VERSION} nvidia-utils-460=${NVIDIA_VERSION} \
    && rm -rf /var/lib/apt/lists/* \
    && bundle install --deployment --without test

CMD ["bundle", "exec", "ruby", "app/application.rb", "1>&2"]
