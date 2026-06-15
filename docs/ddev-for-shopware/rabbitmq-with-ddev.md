# RabbitMQ with ddev

Before using RabbitMQ in a production environment, it may be useful to do a local installation to familiarize yourself with the setup. A local installation also allows for easy debugging in case of runtime problems.

### Setup RabbitMQ with ddev

To setup RabbitMQ in your ddev environment, follow the instructions on <https://github.com/b13/ddev-rabbitmq>. Basically, it comes down to executing the command

```bash
ddev get b13/ddev-rabbitmq && ddev restart
```

For our needs, the basic RabbitMQ configuration settings provided with this recipe are sufficient.

### Enable RabbitMQ as Message Transport with Shopware 6

To enable RabbitMQ with Shopware 6 we need to enable the php8.2-amqp extension as a prerequisite. For this, add the following line to your `.ddev/config.yaml` file:

```yaml
webimage_extra_packages: [ php8.2-amqp ]
```

Restart ddev with `ddev restart` to make this effective.

Since its release 6.5, Shopware uses the plain implementation of the Symfony messenger component. Install the Symfony AMQP component, which provides the link between the messenger and RabbitMQ:

```
ddev exec composer require symfony/amqp-messenger
```

Finally, to tell Symfony to use RabbitMQ instead of the default Doctrine transport, add these three lines to your `.env.dev` file:

```bash
MESSENGER_TRANSPORT_DSN=amqp://rabbitmq:rabbitmq@rabbitmq:5672/%2f/async
MESSENGER_TRANSPORT_LOW_PRIORITY_DSN=amqp://rabbitmq:rabbitmq@rabbitmq:5672/%2f/low_priority
MESSENGER_TRANSPORT_FAILURE_DSN=amqp://rabbitmq:rabbitmq@rabbitmq:5672/%2f/failed
```

Shopware 6 will now use RabbitMQ as its message queue transport system.

### Monitor and Control RabbitMQ - Management UI

The admin user interface for RabbitMQ can be reached on your local machine at:

`https://<your-project>.ddev.site:15673`

The default credentials are rabbitmq/rabbitmq. Refer to the [RabbitMQ documentation](https://www.rabbitmq.com/docs) for further details. The ddev implementation also comes with three easy-to-use commands

```
ddev rabbitmq
ddev rabbitmqadmin
ddev rabbitmqctl
```

see e.g. `ddev rabbitmqadmin --help` for more details.
