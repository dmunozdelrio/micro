FROM haskell:9 AS build
WORKDIR /app
COPY haskell-compliance.cabal .
COPY Main.hs .
RUN cabal update && cabal install --installdir=/app/bin --install-method=copy

FROM debian:buster-slim
WORKDIR /app
COPY --from=build /app/bin/haskell-compliance ./haskell-compliance
EXPOSE 3012
CMD ["./haskell-compliance"]
