FROM ruby:2.5.1-alpine

WORKDIR /app

RUN apk add --no-cache \
      nodejs \
      yarn \
      postgresql-dev \
      tzdata \
      ruby-dev \
      build-base \
      chromium \
      chromium-chromedriver \
      udev \
      ttf-freefont

COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN bundle install && yarnpkg

COPY . ./

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
