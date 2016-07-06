FROM skopciewski/ruby

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk-install bash getmail@testing procmail
RUN gem-install mayaml-getmail
COPY data/entrypoint /entrypoint
RUN chmod 755 /entrypoint

ENV MAILGRABBER_HOME /opt/mailgrbber
VOLUME [${MAILGRABBER_HOME}]
WORKDIR ${MAILGRABBER_HOME}

ENTRYPOINT ["/entrypoint"]
CMD ["escto", "bash"]
