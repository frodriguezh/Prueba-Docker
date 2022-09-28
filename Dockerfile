FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /Docker

# Copy everything
COPY . ./

# Restore as distinct layers
RUN dotnet restore

# Build and publish a release
#RUN dotnet publish -c Release -o out
RUN dotnet publish -c release -o /app --no-restore

# Build runtime image
#FROM mcr.microsoft.com/dotnet/aspnet:5.0
#WORKDIR /Docker
#COPY --from=build-env /Docker/out .
#ENTRYPOINT ["dotnet", "DotNet.Docker.dll"]
