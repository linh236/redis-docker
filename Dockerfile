FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /web_game
WORKDIR /web_game
COPY Gemfile /web_game/Gemfile
COPY Gemfile.lock /web_game/Gemfile.lock
RUN bundle install
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
ADD . .
RUN chmod 777 ./entrypoint.sh
RUN ./entrypoint.sh
RUN chown -R $USER:$USER .
CMD ["rails", "server", "-b", "0.0.0.0"]
