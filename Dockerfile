FROM ruby:2.5-alpine
MAINTAINER a0s@github.com
ENV LANG C.UTF-8

WORKDIR /app
COPY Gemfile Gemfile.lock application.rb environment.rb exporter.rb nvidia_smi.rb ./
RUN \
    apk add --update \
    build-base \
    && rm -rf /var/cache/apk/* \
    && bundle install --deployment --without test
CMD ["bundle", "exec", "ruby", "application.rb", "1>&2"]
