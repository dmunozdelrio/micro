# ---- Build Stage ----
FROM hexpm/elixir:1.14.5-erlang-24.2.2-debian-bullseye-20250610-slim AS build
WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential git \
    && rm -rf /var/lib/apt/lists/*

COPY mix.exs mix.lock ./
COPY config ./config
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get --only prod && \
    MIX_ENV=prod mix deps.compile

COPY lib ./lib

RUN MIX_ENV=prod mix release

# ---- Release Stage ----
FROM debian:bullseye-slim AS app
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       openssl libncurses5 \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app

COPY --from=build /app/_build/prod/rel/messaging ./

ENV MIX_ENV=prod \
    PHX_SERVER=true

EXPOSE 3009
CMD ["bin/messaging", "start"]
