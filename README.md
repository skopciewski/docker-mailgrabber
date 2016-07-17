# Mailgrabber docer container

## Usage

The container provides script for running getmail and fetching all emails from accounts defined in the mayaml.yml file (see: [Mayaml project][mayaml_url]). 
By default, all files go to the one `/mnt/mailgrabber/INBOX` maildir, but you can change that by providing additional procamil config.

```bash
  docker run -it --rm --name mailgrabber \
    -v /path/to/mayaml.yml:/mnt/mayaml.yml \
    -v /path/to/maildir:/mnt/mailgrabber \
    # -v /path/to/procamilrcfilters:/mnt/ext_procmailrc \
    skopciewski/mailgrabber
```

### Escape to

If you want to execute other command than `getmail`, run docker container with `escto` as first param:

```bash
    docker run -it --rm --name maiilgrabber 
    -v /path/to/mayaml.yml:/mnt/mayaml.yml \
    -v /path/to_maildir:/mnt/mailgrabber \
    skopciewski/mailgrabber escto bash
```

## Dependencies and requirements

* `mayaml.yml` file mounted to the `$MAYAML_FILE` (default: `/mnt/mayaml.yml`)
* local maildir mounted to the `$MAILGRABBER_MAILDIR` (default: `/mnt/mailgrabber`)

Additionally:

* mount custom procmail filters to the `$PROCMAIL_FILTERS` (default: `/mnt/ext_procmailrc`)
* set default inbox directory relative to the `$MAILGRABBER_MAILDIR` by overwriting `$DEFAULT_MAILDIR_MAILBOX` (default: `INBOX`)
* set the owner of created files by overwriting `$MAIL_USER_ID` (default: `1000`) and `$MAIL_GROUP_ID` (default: `1000`)

[mayaml_url]: https://github.com/skopciewski/mayaml
