# wtfdyum-formula
Formula for WTFDYUM: Why the f*** did you unfollow me? (https://github.com/jchampemont/WTFDYUM).

See the full [Salt Formulas installation and usage instructions](http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html).

## Available states
### `wtfdyum`
Installs WTFDYUM.

Example pillar:

```
wtfdyum:
  user: deploy
  path: /apps/wtfdyum
  version: 1.1.0-SNAPSHOT
  url: https://exemple.com
  appId: app-id
  appSecret: secret
```

Supervisord is used as process control system.