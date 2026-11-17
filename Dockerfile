FROM ruby:4.0.9-trixie@sha256:d1b33477de075536be34e1f50a15501c35151c380baba5e55a8c2b0b84ec9c7c

RUN useradd -d /tmp appuser \
  && gem install sinatra rackup puma
WORKDIR /usr/src/app
COPY ./app.rb .
USER appuser
ENV APP_ENV=production
CMD ["ruby", "app.rb"]
