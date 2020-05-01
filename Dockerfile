
FROM ruby:2.7.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn
RUN mkdir /myapp
RUN gem install bundler:2.0.1
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY ./package.json /myapp/package.json
COPY ./yarn.lock /myapp/yarn.lock
RUN yarn install --check-files
RUN bundle install
COPY . /myapp

COPY entry.sh /usr/bin/
RUN chmod +x /usr/bin/entry.sh
ENTRYPOINT ["entry.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]