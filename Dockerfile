FROM ruby:3.1-bullseye

# Install common build tools and Jekyll
# before running bundle install
RUN apt-get update \
  && apt-get install -y curl build-essential ca-certificates \
  && gem install bundler jekyll --no-document \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/jekyll

# Copy project files (mounted at runtime by docker-compose for dev)

COPY . /srv/jekyll
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Install Ruby gems (if Gemfile exists)
RUN if [ -f Gemfile ]; then bundle install --jobs 4 || true; fi

EXPOSE 4000

# Default command: run the start script which starts Jekyll
CMD ["/usr/local/bin/start.sh"]
