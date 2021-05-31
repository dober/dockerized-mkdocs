## MkDocs

[![build status](https://ci.inet.club/api/v1/teams/main/pipelines/mkdocs/jobs/build-n-publish/badge)](https://ci.inet.club/teams/main/pipelines/mkdocs)

Dockerized MkDocs with material theme.

### Docker compose:

```yaml
---
version: '3'
services:
  mkdocs:
    image: ghcr.io/dober/mkdocs:latest
    ports:
      - "127.0.0.1:8000:8000"
    volumes:
      - ./mkdocs:/mkdocs
    restart: always
```
