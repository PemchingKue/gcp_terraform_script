FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    software-properties-common \
    lsb-release

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg \
    | gpg --dearmor \
    | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    | tee /etc/apt/sources.list.d/hashicorp.list

RUN apt-get update && apt-get install -y terraform
