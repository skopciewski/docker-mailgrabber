FROM gliderlabs/alpine:edge

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk-install --no-cache bash ruby getmail@testing procmail


