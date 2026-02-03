FROM ubuntu:24.04

LABEL org.opencontainers.image.source https://github.com/txstockdata/ubuntu-action-base

RUN apt-get update && apt-get install -y ca-certificates curl unzip
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc

RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && apt-get install -y docker-ce docker-ce-cli docker-buildx-plugin podman

RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && apt-get install -y nodejs

RUN corepack enable pnpm

RUN curl -fsSL https://deno.land/install.sh | sh -s -- --yes

RUN curl -fsSL https://bun.sh/install | bash
