# Contribute with ddev

While [Shopware 6](https://github.com/shopware/shopware) comes with a predefined Docker setup file, there is a good reason to use ddev for your local contribution environment: It can be booted in parallel with other ddev projects. In fact, I often have one or more client projects up and running at the same time as a contribution environment.

Within your contribution project folder, initiate ddev with the following command:

```
ddev config --project-type=shopware6 --docroot=shopware/public --composer-root=shopware --web-working-dir=/var/www/html/shopware \
        --database=mysql:8.4 --php-version=8.3 --nodejs-version=22 --webserver-type=apache-fpm \
        --web-environment-add="DATABASE_URL=mysql://db:db@db:3306/db,MAILER_DSN=smtp://localhost:1025?encryption=&auth_mode=,APP_URL=\${DDEV_PRIMARY_URL},APP_DEBUG=1,APP_ENV=dev"
```

Adjust the php and nodejs versions to the current requirements.

Start ddev and ssh into the web container:

```
ddev start
```

Clone your fork of Shopware:

```
rm -rf shopware && git clone git@github.com:<your-github-user>/shopware.git
```

Install the dependencies:

```
ddev exec composer install
```

Create a .env file and the jwt secrets:

```
ddev exec bin/console system:setup
```

The database user, password, host and database are all the same, just: 'db'. I recommend to go for a "dev" setup.

Initialize the database and build the administration and storefront components:

```
ddev exec composer setup
```

Voilá, you are set! Run

```
ddev launch /admin
```

to bring up the admin UI in your web browser. The admin credentials, as usual are 'admin' and 'shopware'.

Happy contributing!
