# syntax=docker/dockerfile:1.4

# Sentinel gRPC Inspector Agent Container Image
#
# Targets:
#   - prebuilt: For CI with pre-built binaries

################################################################################
# Pre-built binary stage (for CI builds)
################################################################################
FROM gcr.io/distroless/cc-debian12:nonroot AS prebuilt

COPY sentinel-agent-grpc-inspector /sentinel-agent-grpc-inspector

LABEL org.opencontainers.image.title="Sentinel gRPC Inspector Agent" \
      org.opencontainers.image.description="Sentinel gRPC Inspector Agent for Sentinel reverse proxy" \
      org.opencontainers.image.vendor="Raskell" \
      org.opencontainers.image.source="https://github.com/raskell-io/sentinel-agent-grpc-inspector"

ENV RUST_LOG=info,sentinel_agent_grpc_inspector=debug \
    SOCKET_PATH=/var/run/sentinel/grpc-inspector.sock

USER nonroot:nonroot

ENTRYPOINT ["/sentinel-agent-grpc-inspector"]
