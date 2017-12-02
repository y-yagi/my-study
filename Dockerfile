FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm
RUN apt-get -y install cmake
RUN apt-get -y install google-chrome-stable
RUN npm cache clean && npm install n -g && n stable && ln -sf /usr/local/bin/node /usr/bin/node
RUN apt-get purge -y nodejs npm
RUN npm install -g yarn
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock
RUN yarn
ADD . /app
