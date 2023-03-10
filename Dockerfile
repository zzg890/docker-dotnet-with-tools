FROM mcr.microsoft.com/dotnet/sdk:3.1 AS base
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt update
RUN apt install -y nodejs

RUN apt update
RUN apt install -y vim
RUN apt install -y net-tools
RUN apt install -y curl
RUN apt-get install -y iputils-ping
RUN apt-get install -y lsb-release
RUN apt-get install -y wget
RUN apt-get install -y procps
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get -y install postgresql-14
RUN dotnet tool install --global dotnet-counters
RUN dotnet tool install --global dotnet-dump
RUN dotnet tool install --global dotnet-trace
ENV PATH="$PATH:/root/.dotnet/tools"
ENV ASPNETCORE_URLS="http://+:80"
ENV DOTNET_RUNNING_IN_CONTAINER="true"
