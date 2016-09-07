FROM skopciewski/ruby

# grab gosu for easy step-down from root
RUN apk-install curl \
    && curl -o /usr/local/bin/gosu -fsSL \
      "https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64" \
    && chmod +x /usr/local/bin/gosu \
    && apk del curl \
    && rm -rfv /var/cache/apk/*

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN echo "@edge http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk-install bash getmail@testing python2@edge procmail
RUN gem-install mayaml-getmail:'~>3'

ENV MAIL_USER_ID=1000
ENV MAIL_GROUP_ID=1000
ENV MAILGRABBER_MAILDIR=/mnt/mailgrabber
ENV DEFAULT_MAILDIR_MAILBOX=INBOX
ENV PROCMAIL_FILTERS=/mnt/ext_procmailrc
ENV MAYAML_FILE=/mnt/mayaml.yml
ENV GETMAIL_DIR=/tmp/getmail

COPY data/entrypoint /entrypoint
RUN chmod 755 /entrypoint
COPY data/getmail_all /usr/local/bin
RUN chmod 755 /usr/local/bin/getmail_all
COPY data/procmailrc /tmp
RUN mkdir /var/spool/mail && chmod 777 /var/spool/mail

VOLUME ["${MAILGRABBER_MAILDIR}"]

ENTRYPOINT ["/entrypoint"]
CMD ["all"]
