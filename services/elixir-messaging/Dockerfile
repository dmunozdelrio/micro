# ---- Build Stage ----
FROM hexpm/elixir:1.16.2-erlang-26.2.1-alpine-3.18 AS build
WORKDIR /app

RUN apk add --no-cache build-base git

COPY mix.exs mix.lock ./
COPY config ./config
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get --only prod && \
    MIX_ENV=prod mix deps.compile

COPY lib ./lib

RUN MIX_ENV=prod mix release

# ---- Release Stage ----
FROM alpine:3.18 AS app
RUN apk add --no-cache openssl ncurses-libs
WORKDIR /app

COPY --from=build /app/_build/prod/rel/messaging ./

ENV MIX_ENV=prod \
    PHX_SERVER=true

EXPOSE 3009
CMD ["bin/messaging", "start"]
