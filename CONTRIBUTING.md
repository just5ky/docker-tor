# Contributing

Contributions are welcome. Please follow the guidelines below.

## Reporting Issues

- Search existing [issues](https://github.com/just5ky/docker-tor/issues) before opening a new one.
- Use the provided issue templates.
- Include your Docker version, host OS, and reproduction steps.

## Pull Requests

1. Fork the repository and create a branch from `latest`.
2. Make your changes.
3. Test locally with `docker build .` before submitting.
4. Open a PR against `latest` with a clear description of what changed and why.
5. Link any related issues.

## Dockerfile Guidelines

- Follow the [CIS Docker Benchmark](https://www.cisecurity.org/benchmark/docker).
- Use `apt-get` (not `apt`) with `--no-install-recommends`.
- Clean up in the same `RUN` layer: `apt-get clean && rm -rf /var/lib/apt/lists/*`.
- Do not store secrets or credentials in the image.
- Use `COPY` not `ADD` unless tar extraction is explicitly needed.

## Commit Style

Use [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: add arm64 support
fix: correct torbrowser-launcher path
chore: bump base image to latest
docs: update README env vars
```

## Code of Conduct

By participating you agree to abide by the [Code of Conduct](CODE_OF_CONDUCT.md).
