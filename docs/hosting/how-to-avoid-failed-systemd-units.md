# How to Avoid Failed Systemd Units

If you have configured your Shopware 6 using systemd as described [here](https://developer.shopware.com/docs/guides/hosting/infrastructure/message-queue.html#systemd-example), and you see your message queues building up and messages not being processed anymore, it's time to take a look at the status of your systemd services (or "units" as they are also called).

Presuming all your systemd units for Shopware start with the prefix `shopware`, check the status of your units using the following command:

```sh
sudo systemctl list-units | grep shopware
```

All relevant units should be in the status `loaded active running`. If one or more units are not, you may safely restart those with

```
sudo systemctl restart <the-unit-not-running>
```

But why would a unit fail permanently? The point is that the `Restart=always` directive works fine in general, but by default systemd will only try to restart a failed unit five times, and the default time between attempts is only 100 ms. Now suppose your database (or redis or RabbitMQ, whatever is configured for the message queues) is not responding properly for some seconds, or even has a short downtime. The task runner and message consumers are reading from the database (or redis or RabbitMQ) and will inevitably fail. Now, systemd will only retry five times within a total of 500 ms, making it very likely that the unit will end up in a permanently failed state.

You can increase the resilience of your units to such failures by Increase the number of retries and the time between retries. To do this, add this statement

```sh
StartLimitBurst=10
StartLimitIntervalSec=30s
```

to the `[Unit]` section and add this one

```
RestartSec=2s
```

to the `[Service]` section. This causes systemd to attempt to restart 10 times, with 2 seconds between retries, within a maximum of 30 seconds. It shouldn't be a problem for the task runner or message consumers to be down for 2 seconds or up to 30 seconds if the queues are reliably restarted at the end.
