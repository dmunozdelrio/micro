# build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY dotnet-identity.csproj ./
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /app/out

# runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/out ./
EXPOSE 3006
ENTRYPOINT ["dotnet", "dotnet-identity.dll"]

