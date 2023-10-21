# Use the official Ruby image as the base image
FROM ruby:3.1.2

# Set environment variables for Rails
ENV APP_HOME /app

# Create and set the working directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install essential dependencies
RUN apt-get update -qq && apt-get install -y postgresql-client

# Install bundler
RUN gem install bundler

# Copy the Gemfile and Gemfile.lock into the image and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5

# Copy over our application code
ADD . $APP_HOME

# Set our environment variables
# ENV RAILS_ENV staging
# ENV RAILS_LOG_TO_STDOUT true

RUN curl -sL https://deb.nodesource.com/setup_16.x |   bash -

RUN apt-get install -y nodejs

CMD tail -f /dev/null

# EXPOSE 3000

# # Start the rails server
# CMD ["rails", "server", "-b", "0.0.0.0"]

# Start the puma server
# CMD bundle exec puma -p 3000

# # Configure endpoint.
# COPY /entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000
