# docker-tor

[![Docker](https://github.com/just5ky/docker-tor/actions/workflows/docker.yml/badge.svg)](https://github.com/just5ky/docker-tor/actions/workflows/docker.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/justsky/tor)](https://hub.docker.com/r/justsky/tor)
[![Docker Image Size](https://img.shields.io/docker/image-size/justsky/tor/latest)](https://hub.docker.com/r/justsky/tor)

Tor Browser running in a containerised desktop environment, streamed to your browser via [Selkies](https://github.com/selkies-project/selkies-gstreamer). Built on [LinuxServer's baseimage-selkies](https://github.com/linuxserver/docker-baseimage-selkies).

## Features

- Full Tor Browser desktop accessible from any web browser
- Hardware-accelerated streaming via Selkies (WebSocket-based, no special firewall rules)
- Works behind Traefik + Pangolin out of the box
- Nvidia GPU passthrough supported

## Usage

### Docker Compose

```yaml
services:
  tor:
    image: justsky/tor:latest
    container_name: tor
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      - TITLE=Tor Browser
    volumes:
      - /path/to/config:/config
    ports:
      - 3000:3000
```

### Docker Run

```bash
docker run -d \
  --name tor \
  --security-opt no-new-privileges:true \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e TITLE="Tor Browser" \
  -v /path/to/config:/config \
  -p 3000:3000 \
  --restart unless-stopped \
  justsky/tor:latest
```

## Environment Variables

| Variable | Default | Description |
|---|---|---|
| `PUID` | `1000` | User ID for file ownership |
| `PGID` | `1000` | Group ID for file ownership |
| `TZ` | `Etc/UTC` | Timezone (e.g. `Europe/London`) |
| `TITLE` | `Tor Browser` | Tab title shown in the browser UI |
| `DISABLE_ZINK` | — | Set to `true` to disable Zink even when GPU is detected |
| `DRI_NODE` | — | GPU device for hardware encoding (e.g. `/dev/dri/renderD128`) |
| `HARDEN_DESKTOP` | — | Set to `true` to disable terminals, sudo, and file transfers |
| `SELKIES_ENCODER` | auto | Video encoder (`x264enc`, `vp8enc`, `jpeg`) |
| `SELKIES_FRAMERATE` | `60` | Stream framerate |
| `SELKIES_VIDEO_BITRATE` | `2000` | Video bitrate in kbps |

See [baseimage-selkies](https://github.com/linuxserver/docker-baseimage-selkies) for the full list of Selkies environment variables.

## Volumes

| Path | Description |
|---|---|
| `/config` | Persistent user config, Tor Browser profile, and bookmarks |

## Ports

| Port | Description |
|---|---|
| `3000` | Selkies web UI (HTTP) |
| `3001` | Selkies web UI (HTTPS) |

## Accessing the UI

Navigate to `http://<host>:3000` in your browser. Tor Browser launches automatically on startup.

### Behind Pangolin + Traefik

Selkies uses WebSocket-based streaming — no UDP or TURN server configuration required. Add the container as a target resource in Pangolin. Ensure your Traefik entrypoint passes through WebSocket upgrades (default behaviour).

## GPU Acceleration (optional)

```yaml
    environment:
      - DRI_NODE=/dev/dri/renderD128
    devices:
      - /dev/dri:/dev/dri
```

## Building Locally

```bash
docker build \
  --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
  --build-arg VERSION=local \
  -t docker-tor .
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Security

See [SECURITY.md](SECURITY.md) for vulnerability reporting.

## License

[GPL-3.0-only](LICENSE)
