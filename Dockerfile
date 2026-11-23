FROM ruby:4.0.10-trixie@sha256:84e854507d7f2ffc9061e32d47c16d7413bcb1fa55ec29c1927f9e4d62fa6cf3

RUN useradd -d /tmp appuser \
  && gem install sinatra rackup puma
WORKDIR /usr/src/app
COPY ./app.rb .
USER appuser
ENV APP_ENV=production
CMD ["ruby", "app.rb"]
