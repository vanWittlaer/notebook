# Fetch Media from Production or Staging Server

The following redirect or proxy directives will load all media and thumbnail files not available locally from a staging or production server.

When using apache (`webserver-type: apache-fpm`) add these lines at the beginning of your `public/.htaccess` file:

```apacheconf
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteCond %{REQUEST_URI} ^/(media|thumbnail)/
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^(.*)$ https://staging.example.com/$1 [L,R=301]
</IfModule>
```

Do not commit this updated public/.htaccess file to your repo.

When using nginx (`webserver-type: nginx-fpm`), create a file `.ddev/nginx/media-redirect.conf` with the following contents (with optional basic auth):

```nginx
   set $media_proxy_url "https://staging.example.com";

   location @mediaserver {
        resolver 1.1.1.1;
        proxy_pass $media_proxy_url$request_uri;
        proxy_set_header Authorization "Basic your-basic-auth-secret";
    }

    location ^~ /media/ {
        access_log off;
        expires max;
        try_files $uri $uri/ @mediaserver;
        break;
    }

    location ^~ /thumbnail/ {
        access_log off;
        expires max;
        try_files $uri $uri/ @mediaserver;
        break;
    }
```

The nginx way obviously has the advantage that it can be committed to your repository and, once setup, doesn't need any further attention. Also, as nginx acts as a proxy, you can upload files locally in admin and use them seamlessly in the storefront.

Also see [Media URLs Out Of Sync between Servers](../hosting/media-urls-out-of-sync-between-servers.md).
