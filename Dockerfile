FROM ruby:2.6

RUN gem install bundler -v 2.1.4
ENV BUNDLER_VERSION 2.1.4

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . /app

CMD bundle exec rake
