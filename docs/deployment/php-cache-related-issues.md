# PHP Cache Related Issues

The php-fpm configuration for production servers is and should be optimized to use the various caching options. With PHP 7.x and above, there have been a number of improvements, most notably with the introduction of the new file cache. See [here](https://patrickkerrigan.uk/blog/php-opcache-file-cache/) for a brief overview.

However, these new features have side effects: For example, after deploying, you may find that source changes have not taken effect on your server.

### Ignoring Timestamps

In most cases, the cause of these issues is related to the

```
opcache.validate_timestamps
```

configuration value. For performance reasons, Shopware recommends to disable it on production servers. See [here](https://developer.shopware.com/docs/guides/hosting/performance/performance-tweaks.html#php-config-tweaks) for details.

### Reset Cache After Deployment

The easiest and safest way to completely reset opcache is to use the famous [cachetool](https://github.com/gordalina/cachetool). Just request it with composer in your environment:

```
composer require gordalina/cachetool
```

Then, assuming your server is equipped with php-fpm, resetting opcache is as simple as running the following command:

```
vendor/bin/cachetool opcache:reset --fcgi=/var/run/php-fpm.sock
```

Note that the value of --fcgi depends on your actual web server setup.

### ddev and other Local Environments

In local environments, just make sure that opcache file timestamps are always validated by adding the following directive to your php ini file:

```
opcache.validate_timestamps = 1
```
