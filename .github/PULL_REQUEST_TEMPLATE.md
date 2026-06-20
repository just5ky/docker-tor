## Summary

<!-- What does this PR change and why? -->

## Type of change

- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] CI / build change
- [ ] Dependency bump

## Checklist

- [ ] `docker build .` completes without errors locally
- [ ] No secrets or credentials added to the image or workflow
- [ ] `apt-get` used with `--no-install-recommends` and cache cleaned in same `RUN` layer
- [ ] `COPY` used instead of `ADD` (unless tar extraction is needed)
- [ ] Dockerfile changes pass CIS Docker Benchmark checks
- [ ] `CHANGELOG.md` updated
- [ ] Related issues linked below

## Related issues

Closes #
