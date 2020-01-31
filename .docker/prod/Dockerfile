FROM ruby:2.6

RUN gem install bundler -v 2.1.4

WORKDIR /app

COPY . .

RUN bundle install

EXPOSE 3000

ENTRYPOINT [ "" ]
CMD [ "bundle", "exec", "puma" ]
