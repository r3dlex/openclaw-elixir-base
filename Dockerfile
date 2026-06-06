# Stage 1: builder
FROM elixir:1.18-alpine@sha256:b85cfdf95ae690ba1c194a8286ee280c0ebaddba824e827dfc1721e1ab318744 AS builder

# Install build dependencies
RUN apk add --no-cache \
    build-base \
    git \
    ca-certificates \
    sqlite-dev \
    libdeflate-dev

# Create app directory
RUN mkdir -p /app

WORKDIR /app

# Default to mixing in the builder image
CMD ["sh"]
