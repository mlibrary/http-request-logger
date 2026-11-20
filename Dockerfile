FROM ruby:4.0.9-trixie@sha256:ac9b27edd4382328460376335b40bcc294c756be117ba93179cf0317f5e86bec

RUN useradd -d /tmp appuser \
  && gem install sinatra rackup puma
WORKDIR /usr/src/app
COPY ./app.rb .
USER appuser
ENV APP_ENV=production
CMD ["ruby", "app.rb"]
