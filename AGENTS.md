# AGENTS.md

## What this repo is

Docker packaging for the [Ceno](https://censorship.no/) Ouinet client. No application code — only the Dockerfile, config, TLS certs, and deployment helpers.

## Key files

- `Dockerfile` — builds from `equalitie/ouinet:${OUINET_VERSION}` (default: `latest`)
- `docker-compose.yml` — local run helper; uses `host` networking, mounts `ceno_data` volume
- `ouinet-client.conf` — Ouinet client config; debug logging commented out by default
- `railway.json` — Railway deployment config (DOCKERFILE builder)
- `README-paskoocheh.md` — Paskoocheh variant instructions (separate `paskoocheh` branch)

## Build

    sudo docker build -t equalitie/ceno-client .

Pin a version:

    sudo docker build --build-arg OUINET_VERSION=vX.Y.Z -t equalitie/ceno-client:vX.Y.Z .

## Run

    sudo docker run --name ceno-client -dv ceno:/var/opt/ouinet \
      --network host --restart unless-stopped equalitie/ceno-client

Non-Linux hosts need port mappings instead of `--network host`:
`-p 127.0.0.1:8077-8078:8077-8078 -p 28729:28729/udp`

## Conventions

- No tests, no linting, no CI workflows in this repo.
- Sensitive-looking values in `ouinet-client.conf` (certs, tokens, keys) are repo-public and intended for general client distribution.
- The Paskoocheh variant lives on the `paskoocheh` branch, not `main`.
