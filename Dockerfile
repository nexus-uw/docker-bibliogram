###########
# builder #
FROM node:16-alpine as builder

RUN apk --no-cache add git python3 make g++

WORKDIR /app
RUN git clone https://git.sr.ht/~cadence/bibliogram .
RUN npm install --no-optional


#######
# app #
FROM ghcr.io/linuxserver/baseimage-alpine:3.15

RUN apk add --no-cache git graphicsmagick nodejs npm

WORKDIR /config
COPY --from=builder /app/ /config/
RUN chown -R abc:abc /config

EXPOSE 10407

CMD ["s6-setuidgid", "abc", "npm", "start"]
