FROM ruby:2.7.5-slim-bullseye

RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"
RUN bundle install

ENV RAILS_ENV development

COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-e", "development", "-b", "0.0.0.0"]
