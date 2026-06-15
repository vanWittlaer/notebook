# PaaS with Coolify

Think of Coolify as a management tool for your servers and all the services you need. Coolify provides an intuitive, user-friendly interface to help you maintain control.

Behind the scenes, Coolify uses Docker to run your services, whether they are web applications, transactional databases (MySQL, MariaDB, MongoDB, etc.) or other utilities such as Redis and RabbitMQ. You don't need to know anything about Docker to use Coolify. It's as simple as turning a light on or off — you don't need to be an engineer or physicist to do that.

In order to use Coolify, you will either need an account with Coolify's cloud or you will need to host your own Coolify admin instance. The latter option does require some technical knowledge.

You will need a basic Linux-based server for your shop. The easiest and cheapest option is to get one from a cloud provider such as Hetzner or DigitalOcean. You will then need to check your server in with Coolify. From this point onwards, Coolify will take full control and set up all the basic components it needs on the server.

You then need to instruct Coolify to install all the services you require for your Shopware installation. These typically include:

* a MySQL or MariaDB database,
* one or more Redis instances,
* a RabbitMQ instance,
* an OpenSearch instance.

These are all pre-defined services offered by Coolify.

Ultimately, you will need to define the services required to run the core functions of Shopware, such as a web server to process user requests and one or more worker services to perform offline tasks. The easiest way to achieve this is to use Shopware Docker, which provides a framework for creating a Docker image based on your source code. This image contains either a Caddy or an Nginx web server, as well as PHP-FPM to run the PHP code. The resulting Docker container represents a high-performance application ready for production.

Does that sound complicated? It's not too much, and it's feasible either way. I won't go into more detail here, but you can find more information in my reference implementation: <https://github.com/vanwittlaer/swoofy>. The README.md file provides all the technical details you need.

You can use the repository as a blueprint for your project, employing DDEV as your local development environment and Coolify to manage your staging and production environments. This provides a complete assembly line for your project, utilising GitHub workflows (or GitLab pipelines as an alternative).

This it what you'll find in the repository:

* A Shopware installation (based on 6.7.1.2 at the time of writing and occasionally updated)
* Some extras like shopware/docker, frosh/tools etc.
* A DDEV setup to run your system locally
* A set of Dockerfile and docker-compose.yaml files to bring up the webserver and worker services in Coolify

It's just a straightforward CI/CD solution, designed to meet the needs of a typical Shopware 6 client project. Any feedback is appreciated. Have fun!
