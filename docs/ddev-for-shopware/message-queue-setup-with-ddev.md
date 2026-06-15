# Message Queue Setup with ddev

At some point it might be desired to mirror your local development or your demo environment as closely as possible to the production environment. When it comes to Symfony's or Shopware's message queue, this can be achieved easily with ddev.

### Supervisor

ddev has supervisord implemented as a control system for running automated tasks. ddev actually uses supervisord itself to schedule internal tasks. So essentially all we need to do is to extend the supervisord worker configuration.

### Defining supervisord Workers

To do so, add file `worker.conf` to the folder `.ddev/web-build`:

```
# .ddev/web-build/worker.conf
[program:scheduled-task]
command=bin/run-worker.sh "scheduled-task:run --time-limit=300 -vv"
directory=/var/www/html/shopware
numprocs=1
startsecs=0
autorestart=true
startretries=10
process_name=%(program_name)s_%(process_num)02d
stopwaitsecs=20
redirect_stderr=true
stdout_logfile=/var/log/scheduled-task.log

[program:messenger-async]
command=bin/run-worker.sh "messenger:consume async --time-limit=60 -vv"
directory=/var/www/html/shopware
numprocs=1
startsecs=0
autorestart=true
startretries=10
process_name=%(program_name)s_%(process_num)02d
stopwaitsecs=20
redirect_stderr=true
stdout_logfile=/var/log/messenger-async.log

[program:messenger-failed]
command=bin/run-worker.sh "messenger:consume failed --time-limit=300 -vv"
directory=/var/www/html/shopware
numprocs=1
startsecs=0
autorestart=true
startretries=10
process_name=%(program_name)s_%(process_num)02d
stopwaitsecs=20
redirect_stderr=true
stdout_logfile=/var/log/messenger-failed.log
```

For an explanation of the message queue worker configuration in general, head over to the [Symfony docs](https://symfony.com/doc/current/messenger.html#supervisor-configuration).

Should you need or want more than one instance of a particular worker, just adjust the `numproc` directive.

### Create a Persistent Worker Command

Note that the `command` directive in the above file does not call the bin/console commands directly. Instead, a self-written shell script `run-worker.sh` is executed. The reason for this is

supervisord with ddev cannot handle processes that kill themselves, such as the `messenger:consume` and `scheduled-task:run` commands when you use the `--time-limit` or `--message-limit` parameters. We need persistent commands for our supervisors. The solution is a custom script in your project's bin folder `shopware/bin`:

```bash
#!/usr/bin/env bash
# shopware/bin/run-worker.sh
# The purpose of this bash script is to provide a persistent command for ddev's supervisord implementation,
# while allowing to call Symfony's/Shopware's worker commands in a non-persistent mode
while :; do
  /usr/bin/php /var/www/html/shopware/bin/console $1 -n
done
```

This script just uses an endless loop to feed whatever command you provide as an argument to bin/console.

### Activate the Worker Configuration

Finally, to activate your worker configuration with ddev, add a file `Dockerfile.worker` to the folder `.ddev/web-build`

```docker
# .ddev/web-build/Dockerfile.worker
ADD worker.conf /etc/supervisor/conf.d
```

and restart ddev.

### Verify Workers are Active

To verify your workers have been started and are active, simply run the command

```
ddev exec ps -aux
```

You should see your workers being listed (amongst the other running processes):

```
...
developer       2151  1.6  0.4 683836 130576 ?       S    14:03   0:01 /usr/bin/php /var/www/html/shopware/bin/console scheduled-task:run --time-limit=300 -vv -n
developer       2152  1.1  0.3 683516 120936 ?       S    14:03   0:00 /usr/bin/php /var/www/html/shopware/bin/console messenger:consume failed --time-limit=300 -vv -n
developer       2383 12.4  0.3 683376 122132 ?       S    14:04   0:00 /usr/bin/php /var/www/html/shopware/bin/console messenger:consume async --time-limit=60 -vv -n
...

```

### Don't Forget to Deactivate the Admin Worker

Add a file `z-shopware.yaml` to your `shopware/config/packages` folder:

```yaml
# shopware/config/packages/z-shopware.yaml
shopware:
    admin_worker:
        enable_admin_worker: false
```
