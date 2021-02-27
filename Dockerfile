FROM ruby:3.0.0-buster

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

ENV NVIDIA_PUB_KEY "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub"
ENV NVIDIA_REPO "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64 /"

WORKDIR /app

COPY \
    Gemfile \
    Gemfile.lock \
    application.rb \
    exporter.rb \
    n_vidia_smi.rb \
    ./

RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends build-essential wget \
    && wget -qO - ${NVIDIA_PUB_KEY} | apt-key add - \
    && echo ${NVIDIA_REPO} > /etc/apt/sources.list.d/cuda.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends nvidia-utils-460 \
    && rm -rf /var/lib/apt/lists/* \
    && bundle install --deployment --without test

CMD ["bundle", "exec", "ruby", "application.rb", "1>&2"]
