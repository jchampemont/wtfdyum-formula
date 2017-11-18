# seafile-formula
Formula for WTFDYUM: Why the f*** did you unfollow me? (https://github.com/jchampemont/WTFDYUM).

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