FROM ruby:alpine

RUN apk add --update build-base postgresql-dev tzdata nodejs
RUN gem install rails -v '6.1.7'

WORKDIR /project
ADD Gemfile Gemfile.lock /project/
RUN gem install bundler
RUN bundle install

ADD . .
CMD ["puma"]