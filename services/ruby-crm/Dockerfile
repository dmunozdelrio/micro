FROM ruby:3.3-alpine
WORKDIR /usr/src/app
COPY Gemfile ./
RUN bundle install --quiet
COPY . .
EXPOSE 3008
CMD ["ruby", "app.rb"]
