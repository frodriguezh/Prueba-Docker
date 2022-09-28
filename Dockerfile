FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env

#Instalacion java jdk, openssh, zip, unzip, jfrog cli, aws cli
RUN apt update && \
	apt -y install default-jdk && \
	apt -y install openssh-client && \
	apt -y install zip && \
	apt -y install unzip && \
	curl -fL https://install-cli.jfrog.io | sh && \
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	unzip awscliv2.zip && \
	./aws/install

#Instalacion sonar-scanner

RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip && \
	unzip -q sonar-scanner-cli-4.7.0.2747-linux.zip && \
	mv sonar-scanner-4.7.0.2747-linux /usr/bin/sonar-scanner

WORKDIR /source
