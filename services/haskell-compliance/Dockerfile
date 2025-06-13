FROM haskell:9 AS build
WORKDIR /app
COPY haskell-compliance.cabal .
COPY Main.hs .
RUN cabal update && cabal build --only-dependencies && cabal build

FROM debian:buster-slim
WORKDIR /app
COPY --from=build /root/.cabal/bin/haskell-compliance ./haskell-compliance
EXPOSE 3012
CMD ["./haskell-compliance"]
