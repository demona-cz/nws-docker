# NWN Server Docker Images

## Description

Docker images recipe for NWN and NWNEE server with proper signal handling.

`dockerize` is used for config templating and signal handlig.
`entrypoint.sh` can be used for extra tasks before final server execution via
dockerize.

## Usage

### Build

`docker build --tag localhost/server-1.69:v1 nws169/`

### Run

`docker run -d --rm --init localhost/server-1.69:v1`

## Tests

Ephemeral docker image is builded for every pull_request. Publish not enabled now.

## License

MIT
