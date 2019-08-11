FROM andrius/alpine-ruby

LABEL "com.github.actions.name"="Variables in Markdown"
LABEL "com.github.actions.description"="Allows variable templating in Markdown."
LABEL "com.github.actions.icon"="filter"
LABEL "com.github.actions.color"="red"

ENV RUBY_PACKAGES bash curl-dev ruby-dev build-base git ruby ruby-io-console ruby-bundler ruby-json ruby-rdoc

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
COPY action.rb /action.rb
COPY Gemfile /Gemfile

RUN chmod +x /entrypoint.sh
Run bundle install

ENTRYPOINT ["/entrypoint.sh"]
