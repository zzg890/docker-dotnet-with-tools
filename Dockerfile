FROM mcr.microsoft.com/dotnet/sdk:6.0 AS base
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt update
RUN apt install -y nodejs
RUN npm install -g cross-env
RUN apt update
RUN apt install -y vim
RUN apt install -y net-tools
RUN apt install -y curl
RUN apt-get install -y iputils-ping
RUN apt-get install -y lsb-release
RUN apt-get install -y wget
RUN apt-get install -y procps
RUN apt-get install -y openssh-client
RUN dotnet tool install --global dotnet-counters
RUN dotnet tool install --global dotnet-dump
RUN dotnet tool install --global dotnet-trace
ENV PATH="$PATH:/root/.dotnet/tools"
ENV ASPNETCORE_URLS="http://+:80"
ENV DOTNET_RUNNING_IN_CONTAINER="true"
