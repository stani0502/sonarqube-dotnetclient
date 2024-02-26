FROM mcr.microsoft.com/dotnet/sdk:6.0-bookworm-slim

#install java
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64/
RUN export JAVA_HOME

#Begin Sonar
RUN dotnet tool install --global dotnet-sonarscanner

ENV PATH="${PATH}:/root/.dotnet/tools"