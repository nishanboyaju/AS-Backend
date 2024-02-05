FROM ruby:3.1.2

# RUN apk update && apk add build-base postgresql-dev postgresql-client tzdata gcompat

WORKDIR /opt/as_backend

RUN gem install bundler 

COPY Gemfile* ./

RUN bundle install

COPY . . 

ARG DEFAULT_PORT 3000

EXPOSE ${DEFAULT_PORT}

CMD /bin/bash start.sh