# Security Policy

## Supported Versions

Only the latest image published to Docker Hub (`justsky/tor:latest`) receives security updates.

| Version | Supported |
|---|---|
| `latest` | ✅ |
| Pinned older tags | ❌ |

## Reporting a Vulnerability

**Do not open a public GitHub issue for security vulnerabilities.**

Report vulnerabilities privately via [GitHub Security Advisories](https://github.com/just5ky/docker-tor/security/advisories/new).

Include:
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if known)

You will receive a response within 7 days. If the issue is confirmed, a fix will be released as soon as possible and you will be credited unless you prefer otherwise.

## Scope

| In scope | Out of scope |
|---|---|
| Dockerfile and image configuration | Upstream Tor Browser vulnerabilities |
| Exposed ports / privilege escalation | Selkies upstream vulnerabilities |
| Secrets leaking via build args or labels | Issues requiring physical host access |

For Tor Browser security issues, report to the [Tor Project](https://www.torproject.org/contact/).  
For LinuxServer base image issues, report to [linuxserver/docker-baseimage-selkies](https://github.com/linuxserver/docker-baseimage-selkies/security).
