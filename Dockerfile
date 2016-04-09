FROM ruby:latest
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /opt/livreiro
WORKDIR /opt/livreiro
ADD Gemfile /opt/livreiro/Gemfile
ADD Gemfile.lock /opt/livreiro/Gemfile.lock
RUN bundle install
ADD . /opt/livreiro
RUN RAILS_ENV=production bundle exec rake assets:precompile
