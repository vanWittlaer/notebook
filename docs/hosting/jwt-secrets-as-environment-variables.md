# JWT-Secrets as Environment Variables

Note this article is obsolete with 6.6.1.0. SInce 6.6.1.0 you can are encouraged to use the following configuration for your JWT secrets:

```yaml
shopware:
    api:
        jwt_key:
              use_app_secret: true
```

The above configuration however is already deprecated with 6.6.x and has been removed with 6.7.0.0, since this method (using the APP\_SECRET) is the only one being used - no configuration for JWT is required anymore.

Make sure you have an APP\_SECRET with sufficient entropy and length. You may want to create it yourself with the help of PHP:

```php
php -r "echo bin2hex(random_bytes(32));"
```

Run this command in any environment where you have PHP available (like your ddev web container) and copy the generated string into your .env.local file. Do not commit the app secret to git.

For Shopware versions below 6.6.1.0 you may want to follow the instructions below:

In your shopware.yaml (or any other valid configuration file), create or amend the following entry:

```yaml
shopware:
    api:
        jwt_key:
            private_key_path: '%env(base64:JWT_PRIVATE_KEY)%'
            public_key_path: '%env(base64:JWT_PUBLIC_KEY)%'
```

The easiest way to generate JWT secrets is using shopware-cli with the following command:

```sh
shopware-cli project generate-jwt --env
```

If you have already generated your file-based JWT keys, use these commands to create the base64 equivalent to be specified in .env:

```sh
cat shopware/config/jwt/private.pem | base64 | tr -d '\n'
cat shopware/config/jwt/public.pem | base64 | tr -d '\n'
```

and paste the corresponding results as values for JWT\_PRIVATE\_KEY and JWT\_PUBLIC\_KEY, respectively, in your .env.local.
