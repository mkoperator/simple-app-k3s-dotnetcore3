FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /simple-app

# copy csproj and restore as distinct layers
COPY simple-app .
RUN dotnet restore

# copy and publish app and libraries
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 as simple-app
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "simple-app.dll"]
