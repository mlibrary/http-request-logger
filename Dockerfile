FROM ruby:4.0.9-trixie@sha256:07042b74555ff2eef7365abd72d39cba6e499ab63e2d2942fd34d4778338495b

RUN useradd -d /tmp appuser \
  && gem install sinatra rackup puma
WORKDIR /usr/src/app
COPY ./app.rb .
USER appuser
ENV APP_ENV=production
CMD ["ruby", "app.rb"]
