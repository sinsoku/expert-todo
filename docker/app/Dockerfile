FROM ruby:2.5.1

WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    nodejs \
    yarn \
    chromedriver

COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN bundle install && yarnpkg

COPY . ./

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
