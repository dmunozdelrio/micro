# syntax=docker/dockerfile:1

###############################################################################
#                          Build Stage (Elixir)                               #
###############################################################################
ARG ELIXIR_VERSION=1.14.5-otp-25
FROM elixir:${ELIXIR_VERSION} AS build

# Set working directory
WORKDIR /app

# Install build tools
RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date="false" update \
 && apt-get install -y --no-install-recommends \
      build-essential git \
 && rm -rf /var/lib/apt/lists/*

# Copy and compile dependencies
COPY mix.exs mix.lock ./
COPY config ./config
RUN mix local.hex --force \
 && mix local.rebar --force \
 && MIX_ENV=prod mix deps.get --only prod \
 && MIX_ENV=prod mix deps.compile

# Copy source and build release
COPY lib ./lib
RUN MIX_ENV=prod mix release --overwrite

###############################################################################
#                         Release Stage (Debian)                              #
###############################################################################
FROM debian:bullseye-slim AS app

# Install runtime libs
RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date="false" update \
 && apt-get install -y --no-install-recommends \
      openssl libncurses5 \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the built release from the build stage
COPY --from=build /app/_build/prod/rel/messaging ./

# Runtime environment
ENV MIX_ENV=prod \
    PHX_SERVER=true \
    REPLACE_OS_VARS=true

# Expose your Phoenix port (adjust if different)
EXPOSE 3009

# Start the release
CMD ["bin/messaging", "start"]
