# docker-bibliogram

## source

[Source repository.](https://git.sr.ht/~cadence/bibliogram)

## example

```
  bibliogram:
    image: ghcr.io/xnaas/bibliogram:latest
    container_name: bibliogram
    restart: unless-stopped
    ports:
      - "10407:10407"
    volumes:
      ./bibliogram/config.js:/app/config.js:ro
      ./bibliogram/db:/app/db
```
