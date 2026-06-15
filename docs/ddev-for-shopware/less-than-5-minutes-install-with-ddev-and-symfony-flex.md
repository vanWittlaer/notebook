# Less than 5 Minutes Install with ddev and Symfony Flex

### Why use ddev with Symfony Flex template?

If you’re used to using ddev to run your local projects, you’ll find it easy and straightforward to use the new Symfony Flex template to develop and contribute to client projects. While the template comes with its own Docker setup, one advantage of using it within ddev is that you do not need a local composer environment. In fact, the only prerequisites on your local machine are Docker and [ddev](https://ddev.readthedocs.io/en/stable/).

Not to mention the benefits of ddev’s ease of use and flexibility.

### Scripted Install

The first thing to do is create a project folder, let’s call it my-project, and cd into it. The name of this folder will be the project name used with ddev.

The easiest and quickest way for the install is to copy my installation script [install.sh](https://gist.github.com/vanWittlaer/def64280969ff3e8d2934ac03b206828) file from Github into your project folder. Then run the following command:

```
chmod +x install.sh && ./install.sh
```

When the installation script is finished, you will have

* a current version of Shopware installed in the folder `shopware.`
* Use the **ddev ssh** command to ssh into the project’s web container.
* Browser-wise, your project storefront can be reached at `https://my-project.ddev.site`,
* the project admin can be found at `https://my-project.ddev.site/admin`
* or use the command `ddev launch /admin` to launch it directly in your preferred browser.
* The admin credentials are admin and shopware.

### The Script Explained

[https://gist.github.com/vanWittlaer/def64280969ff3e8d2934ac03b206828](https://gist.github.com/vanWittlaer/def64280969ff3e8d2934ac03b206828)

The first command – `ddev config` – creates a configuration file for your ddev project with these settings:

* `--project-type=shopware6` – this tells ddev to setup a Shopware 6 type project. ddev will create a `.env.local` file within the project's `shopware` folder with all relevant settings
* `--docroot=shopware/public` – this directive tells the webserver where to find the web root
* `--web-environment="APP_ENV=dev"` - read all environment variables from `.env.dev`
* `--web-working-dir=/var/www/html/shopware` – this defines the working dir for the web service
* `--composer-root` - if you want to use the ddev composer command, this tells ddev where to find your composer.json file
* `--database=mysql:8.4` – for a very long time mySQL has been the default with Shopware 6, however MariaDB will do as well. In any event, chose your local database to match your server installation.
* `--php-version=8.3` – you may want to adjust the php version to your needs
* `--nodejs-version=22` – you may want to adjust the nodejs version to your needs. 22 is the current LTS of node.js and supported by Shopware 6.6.9 and above. Downgrade it to 18 if your are still on Shopware 6.5.x
* `--webserver-type=apache-fpm` – again, as with the database flavour, best to chose apache or nginx to match your server setup

The next command – `ddev start` – starts your project containers.

Shopware itself then is installed with this command

```
ddev composer create-project shopware/production -n
```

Finally, the command

```
ddev exec bin/console system:install --basic-setup --shop-locale=de-DE
```

initializes the Shopware system and database. Carefully chose your shop locale here (as either `de-DE` or `en-GB`) as it might be a bit tricky to change it afterwards.

### Use Traditional Install for < 6.5

Note that this Symfony Flex based approach is applicable only for Shopware 6.5.0.0 and above. Should you need to install an earlier version, follow the „traditional“ approach, i.e. setup the ddev project and then use the Shopware-provided installation zip file and install it within your ddev project.

### Updating Shopware and Plugins

With Symfony Flex, updating is now just a matter of running `composer update` – you do not even need Shopware’s `shopware-installer.phar.php`. Just run

```sh
bin/console system:update:prepare
composer update
bin/console system:update:finish
```

You may want to restrict the `composer update` command to particular versions, components or plugins.

After running `composer update`, check that you recipes are up-to-date with the command `composer recipes`. Apply updates as advised.
