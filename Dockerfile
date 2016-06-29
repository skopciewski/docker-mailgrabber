FROM gliderlabs/alpine:edge

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk-install --no-cache bash ruby getmail@testing procmail
COPY data/entrypoint /entrypoint
RUN chmod 755 /entrypoint

ENV MAILGRABBER_HOME /opt/mailgrbber
VOLUME [${MAILGRABBER_HOME}]
WORKDIR ${MAILGRABBER_HOME}

ENTRYPOINT ["/entrypoint"]
CMD ["escto", "bash"]
