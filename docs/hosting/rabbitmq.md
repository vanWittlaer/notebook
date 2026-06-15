# RabbitMQ

### Get and Setup RabbitMQ

I recommend running RabbitMQ on a dedicated server. For three reasons:

1. Security - any application on a server adds potential security risks and you do not want it to be used as a backdoor to your actual Shopware 6 (web) server.
2. Complexity - an application running on a dedicated server is easier to maintain and operate.
3. Performance - a dedicated server can be easily optimized, e.g. for CPU or RAM for RabbitMQ.

If you are running your setup in Digital Ocean's cloud, you can spin up a server with a pre-configured RabbitMQ image. This is my recommended and certainly the easiest way to go.

Otherwise, follow the [instructions for setting up RabbitMQ](https://www.rabbitmq.com/docs/download) on your server.

Create a new non-administrative user `shopware` and grant config/read/write access to the default virtual host '/'

```bash
sudo rabbitmqctl add_user shopware <password>
sudo rabbitmqctl set_permissions -p / shopware ".*" ".*" ".*"
```

Note that you do not need to define any queues on the server, as Symfony will dynamically create the necessary configurations.

### Harden your RabbitMQ Instance with a Firewall

RabbitMQ opens quite a few ports. Only two of them should respond to external requests, 5672 (for connections) and 15672 (for the management UI). So set up your firewall to restrict access to these two ports, and most importantly, allow it only from the IP address of your web server. You may also want to limit SSH access.

A note about **secure communication**: This tutorial describes a setup where the communication between Shopware and RabbitMQ (via port 5762) is not encrypted. Therefore it is highly recommended to use this setup only in an environment where **both Shopware and RabbitMQ are inside the same VPC** (Virtual Private Cloud).

### Prepare and Enable Shopware 6 to use RabbitMQ

First you need to install the AMQP extension on your server. On Debian/Ubuntu run

```
sudo apt install php8.2-amqp
```

and don't forget to restart your fpm service and possibly your message queue worker services.

Second, the Symfony amqp-messenger extension must be required in your composer setup. This can be done locally with

```
composer require symfony/amqp-messenger
```

Commit this to your repository and deploy to your server.

Finally, you need to tell Symfony and Shopware to switch to the RabbitMQ transport. To do this, add the following lines to your `.env` file:

```
# .env or .env.local or .env.<dist>.local
MESSENGER_TRANSPORT_DSN=amqp://shopware:<password>@<rabbitmq-ip4>:5672/%2f/async
MESSENGER_TRANSPORT_LOW_PRIORITY_DSN=amqp://shopware:<password>@<rabbitmq-ip4>:5672/%2f/low_priority
MESSENGER_TRANSPORT_FAILURE_DSN=amqp://shopware:<password>@<rabbitmq-ip4>:5672/%2f/failed
```

That's it! To disable RabbitMQ as messenger transport, and revert to the default Doctrine transport, just comment out the above lines in your `.env` file.
