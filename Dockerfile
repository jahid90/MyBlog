FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /usr/src/blog

COPY Gemfile* ./

RUN bundle install

COPY . ./

RUN bundle install
