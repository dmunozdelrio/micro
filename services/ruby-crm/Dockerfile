# syntax=docker/dockerfile:1

###############################################################################
#                         Build Stage (Ruby)                                  #
###############################################################################
ARG RUBY_VERSION=3.3.8
FROM ruby:${RUBY_VERSION}-alpine AS build

WORKDIR /usr/src/app

# Install build dependencies for native gems
RUN apk add --no-cache build-base libffi-dev

# Copy Gemfiles and install gems into vendor/bundle
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local path 'vendor/bundle' \
 && bundle install --without development test --jobs 4 --retry 3

###############################################################################
#                       Release Stage (Runtime)                               #
###############################################################################
FROM ruby:${RUBY_VERSION}-alpine AS app

WORKDIR /usr/src/app

# Only runtime libs needed by your gems
RUN apk add --no-cache libffi

# Copy installed gems from build
COPY --from=build /usr/src/app/vendor/bundle ./vendor/bundle

# Copy your app code
COPY . .

# Ensure Ruby uses the vendored gems
ENV GEM_HOME=/usr/src/app/vendor/bundle \
    BUNDLE_PATH=/usr/src/app/vendor/bundle \
    BUNDLE_WITHOUT=development:test

EXPOSE 3008

CMD ["bundle", "exec", "ruby", "app.rb"]
