# Performance Tweaks

Even with the default settings, you will notice a surprisingly good performance in terms of UI response times. If you want to spice things up a bit, follow these instructions.

Add a file `.ddev/php/shopware.ini` with the following content:

```
# <my-project>/.ddev/php/shopware.ini
[PHP]
assert.active = 0
opcache.enable_file_override = 1
opcache.interned_strings_buffer = 20
# note contrary to Shopware's recommendations, do not disable validate_timestamps in dev environments
# opcache.validate_timestamps = 0
zend.assertions = -1
zend.detect_unicode = 0
realpath_cache_ttl = 3600
```

These settings just implement Shopware’s performance recommendations <https://developer.shopware.com/docs/guides/hosting/performance/performance-tweaks.html#php-config-tweaks>. The only exception being the value for opcache.validate\_timestamps. Disabling it will result in changes to your source files being un-noticed by the web container.

Add a file .ddev/mysql/my.cnf with the following content:

```
# <my-project>/.ddev/mysql/my.cnf
[mysqld]
sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'
group_concat_max_len = 320000
```

The above settings remove the ONLY\_FULL\_GROUP\_BY sql mode and set the group concat max len to 320000. Again, these are Shopware’s recommendations <https://developer.shopware.com/docs/guides/hosting/performance/performance-tweaks.html#mysql-configuration>.

Eventually, add some lines to your .env.local file:

```
# <my-project>/shopware/.env.local
APP_ENV=prod
APP_DEBUG=0
APP_URL=${DDEV_PRIMARY_URL}
DATABASE_URL=mysql://db:db@db:3306/db
MAILER_DSN=null://null

# Performance tweaks
SHOPWARE_CACHE_ID=<my-project>
SQL_SET_DEFAULT_SESSION_VARIABLES=0
APP_URL_CHECK_DISABLED=1
```

See <https://developer.shopware.com/docs/guides/hosting/performance/> for more details and explanations.
