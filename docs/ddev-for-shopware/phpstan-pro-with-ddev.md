# phpstan pro with ddev

Unfortunately, at this point in time, phpstan pro is not fully compatible with ddev. The following guide thus just describes a workaround, restricted to be used with one ddev project at a time.

First, make sure you have composer required phpstan in your project.

Add a file .ddev/docker-compose.phpstan.yaml with the following content:

```yaml
# .ddev/docker-compose.phpstan.yaml
services:
  web:
    volumes:
      - ~/phpstan-pro:/tmp/phpstan-fixer
    environment:
      - PHPSTAN_PRO_WEB_PORT=11111
    ports:
      - 127.0.0.1:11111:11111
```

Restart ddev. Start phpstan with a command like:

```bash
ddev exec vendor/bin/phpstan analyse --pro
```

You should see something like:

```bash
Running in Docker? Don't forget to do these steps:
1) Publish this port when running Docker:
   -p 127.0.0.1:11111:11111
2) Map the temp directory to a persistent volume
   so that you don't have to log in every time:
   -v ~/.phpstan-pro:/tmp/phpstan-fixer

Open your web browser at: http://127.0.0.1:11111
Press [Ctrl-C] to quit.
```

Now simply point your browser to <http://127.0.0.1:11111> - after login/registration, you will be redirected to phpstan pro's dashboard.
