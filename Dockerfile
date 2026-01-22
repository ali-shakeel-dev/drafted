# syntax = docker/dockerfile:1

ARG RUBY_VERSION=3.3.5
FROM ruby:${RUBY_VERSION}-slim AS base

# Rails app lives here
WORKDIR /rails

# Install runtime packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    curl \
    libjemalloc2 \
    libvips \
    postgresql-client \
    xfonts-75dpi \
    xfonts-base \
    libjpeg62-turbo \
    libx11-6 \
    libxcb1 \
    libxext6 \
    libxrender1 \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install wkhtmltopdf
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb \
    && dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb || apt-get install -f -y \
    && rm wkhtmltox_0.12.6-1.bionic_amd64.deb

# Production env
ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT="development test"

# --------------------
# Build stage
# --------------------
FROM base AS build

# Build deps
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    git \
    libpq-dev \
    libyaml-dev \
    pkg-config \
    libgmp-dev \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle \
           "${BUNDLE_PATH}"/ruby/*/cache \
           "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# Copy app
COPY . .

# Precompile bootsnap (safe)
RUN bundle exec bootsnap precompile app/ lib/

# ⛔ REMOVE asset precompile unless you 100% need it
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

# --------------------
# Final stage
# --------------------
FROM base

# Copy gems + app
COPY --from=build ${BUNDLE_PATH} ${BUNDLE_PATH}
COPY --from=build /rails /rails

# Create non-root user and set permissions
RUN groupadd --system rails && \
    useradd rails --system --create-home --shell /bin/bash -g rails && \
    chown -R rails:rails /rails && \
    chmod +x /rails/bin/docker-entrypoint

# Set PATH for wkhtmltopdf if needed
ENV PATH="/usr/local/bin:$PATH"

USER rails

# Entrypoint
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]