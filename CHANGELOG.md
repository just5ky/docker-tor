# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Changed
- Removed `tor` system daemon (redundant — Tor Browser ships its own bundled tor binary)
- Removed `curl` from explicit install (pre-installed in `baseimage-selkies`)
- Migrated base image from `linuxserver/baseimage-kasmvnc:debianbookworm` to `linuxserver/baseimage-selkies:debianbookworm`
- Updated `startwm.sh` with Nvidia/Zink GPU detection block required by Selkies
- Renamed `dockerfile.amd64` to `Dockerfile` (standard naming)
- Updated CI workflow: fixed invalid `actions/checkout@v6` → `v4`; pinned all action refs to SHA; replaced broken `workflow_run` trigger with `push` on `latest` branch
- Pinned all GitHub Actions to SHA for supply-chain security (CIS)
- Added `--no-install-recommends`, `apt-get clean`, and cache purge to `RUN` layer
- Added `HEALTHCHECK`, `EXPOSE`, `VOLUME`, and OCI `LABEL` metadata to Dockerfile
- Added `DEBIAN_FRONTEND=noninteractive` and `TITLE` env vars
- Dropped deprecated `version:` key from `docker-compose.yml`
- Added `security_opt: no-new-privileges:true` to `docker-compose.yml`
- Changed dependabot schedule from `daily` to `weekly`

### Added
- `README.md` with full usage documentation
- `.gitignore`
- `SECURITY.md`
- `CONTRIBUTING.md`
- `CODE_OF_CONDUCT.md`
- `CHANGELOG.md`
- GitHub Issue templates (bug report, feature request)
- GitHub Pull Request template
