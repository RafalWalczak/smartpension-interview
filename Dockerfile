FROM ruby:3.0.2

RUN apt-get update && \
    apt-get -y install zsh && \
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

RUN mkdir /app

WORKDIR /app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

ENV EDITOR='emacs'

RUN bundle install
RUN echo 'export PATH=/app/bin:$PATH' >> ~/.zshrc