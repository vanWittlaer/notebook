# Using shopware-cli with ddev

For basic information on shopware-cli see [Shopware docs](https://developer.shopware.com/docs/products/cli/).

To install shopware-cli with your ddev project, run the command below to install the shopware-cli add-on:

```bash
ddev add-on get vanWittlaer/ddev-shopware-cli
ddev restart
```

This will also install a config.watcher.yaml to define the necessary ports for using the [storefront and admin watchers](storefront-and-admin-watchers-with-ddev.md) with shopware-cli.

Use it with one of the commands below:

```bash
ddev shopware-cli --version                          # any shopware-cli command
ddev admin-watch custom/static-plugins/MyPlugin      # administration watcher (Vite)
ddev storefront-watch                                # storefront watcher
```

Always open the watchers via your **primary DDEV URL** (`https://<project>.ddev.site`), never `localhost`. The admin-watch URL omits the `/admin` slug.
