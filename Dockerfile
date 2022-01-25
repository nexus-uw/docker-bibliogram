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

RUN apk add --no-cache graphicsmagick nodejs npm

WORKDIR /app

COPY --from=builder /app/ /app/

EXPOSE 10407

CMD ["npm", "start"]
