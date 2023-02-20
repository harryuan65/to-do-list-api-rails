FROM ruby:3.0.3
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

ENV RAILS_ENV=production
ENV RAILS_SERVIE_STATIC_FILES=true

EXPOSE 3000

CMD ["bundle","exec","rails", "server", "-p", "3000"]


