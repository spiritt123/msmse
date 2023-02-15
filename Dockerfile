FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y locales

ENV APP_PATH=/app
ENV TZ='Europe/Moscow'
WORKDIR ${APP_PATH}

COPY Gemfile* $APP_PATH/
RUN bundle install

COPY . .

EXPOSE 3000

CMD rails s -b 0.0.0.0
