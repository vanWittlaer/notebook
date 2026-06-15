# Basic-Auth for Shopware 6 with nginx

Unlike Apache2, where basic-auth is set in the local .htaccess file, in nginx it is set in the server's vhosts file. The downside is that it is difficult to integrate into the CI/CD pipeline. The upside is that it is defined per server by definition and thus doesn't require CI/CD procedures to take care of what the deployment's target (e.g. production, staging, ...) is.

First of all, create an .htpasswd file suiting your needs. A variety of online tools exist for this task. If you have access to a Unix/Ubuntu system, the clean way to go is to run the hdpasswd command:

```shell
htpasswd -c .htpasswd <user>
```

- `-c` tells `htpasswd` to create a new file. Omit it if you want to add further users to an existing file.
- `.htpasswd` is the name of the htpasswd file. You may choose any name; `.htpasswd` is just common practice.
- `<user>` is the user to be used for basic auth.

htpasswd will prompt you for the basic auth password.

Then locate and edit the nginx vhost file. At its head, preceding the server section, add the following lines:

```nginx
map $request_uri $auth_type {
  default "off";
  ~/api/* "off";
  ~* "vanWittlaer Demo Site";
}
...
```

Choose any text you like in place of `vanWittlaer Demo Site` — it is displayed on the basic-auth login popup.

The above code sets a variable $auth\_type to either "off" or to "vanWittlaer Demo Site" (or any other text you chose). Further down in the vhost file, and inside the server section, add the following two lines:

```nginx
...
auth_basic $auth_type;
auth_basic_user_file <path-to-your-htpasswd-file>/.htpasswd;
...
```
