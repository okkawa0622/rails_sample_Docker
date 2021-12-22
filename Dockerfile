FROM ruby:3.0.3
RUN apt-get update -qq && apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn
WORKDIR /rails_test
COPY Gemfile /rails_test/Gemfile
RUN bundle install
CMD ["rails", "server", "-b", "0.0.0.0"]
