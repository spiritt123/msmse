FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y locales

ENV APP_PATH=/app
ENV TZ='Europe/Moscow'
WORKDIR ${APP_PATH}

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn
RUN yarn install

RUN apt install npm -y
RUN npm install -g n -y
RUN n 14.19.0

COPY Gemfile* $APP_PATH/
RUN bundle install

COPY . .
EXPOSE 3000


CMD rails s -b 0.0.0.0
