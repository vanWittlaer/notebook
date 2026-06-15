# Close-to-Zero Downtime Deployment

The following assumes a local environment and repo structure as outlined in this [page](../ddev-for-shopware/less-than-5-minutes-install-with-ddev-and-symfony-flex.md). The outlined procedure is suitable for the CI/CD provided with Gitlab or Bitbucket. Both provide so called "runners", i.e. virtual servers that are used to compile and prepare your sources and to transfer them to your app servers.

The procedure described below is a "poor-man's-deployment": For the sake of simplicity, we run the database migration, plugin update and the theme compilation tasks on the server, resulting in a possible downtime in the range of up to 30 seconds.  (Thus the "close-to-zero".)

CI/CD Deployment happens in a number of steps, which are spread across a runner and a server script.

### Repository Folder Structure

This is straight-forward, setting up ddev and Shopware will create the two folders `.ddev` and `shopware` for you. I have added a third folder `.deploy`, which holds all stuff needed for the deployment, and has a subfolder for each environment (ddev, stage, production, ...).

```
<my-project>
├── .ddev
├── .deploy
├── shopware
├── .gitignore
└── .gitlab-ci.yml
```

ddev and Shopware bring their own .gitignore files. I recommend not to touch these files. If you need to add your custom rules to .gitignore, add a .gitignore file on the project level. Below is an example. As you see, I have added an ignore rule for the .htaccess file in Shopware's public folder, as this file may contain some environment specific directives (like htpasswd protection for the stage environment). The deployment script needs to take care to set up the public/.htaccess file based on the Shopware provided public/.htaccess.dist file.

```
# .gitignore
/.idea/

/shopware/public/.htaccess

/*.sql.gz
/*.tar.gz
```

### Server Folder Structure

Point the docroot of your web server's vhost to the folder shopware/current, which is actually a symlink pointing to the current release.

In your environment specific shopware.yaml file, configure the appropriate filesystem settings for the private (files) and public (bundles, media, sitemap, theme, thumbnails) filesystems.

```
shopware
├── current -> /var/www/shopware/releases/240216085356
├── releases
│   ├── ...
│   ├── ...
│   └── 240216085356
└── shared
    ├── config
        └── jwt
    ├── files
    ├── public
    ├── var
        └── log
    └── .env.prod.local
```

### The Runner Part

Both Bitbucket and Gitlab provide public shared runners, though their usage on free plans is very limited. I prefer to use my own runner. It's not limited, and I know I am the only one using this server. A smaller Hetzner cloud server will do the job.

#### The Runner Image

A Docker-based runner, as the one I use, needs  a Docker image to perform his tasks. The runner image needs to provide all components that are required by Shopware. Obviously, this depends on the Shopware version. On the other hand, the smaller the image, the faster the runner.

#### Composer Install and Build

This step on the runner installs all dependencies. Make sure you have the auth.json generated with your bearer token (from the Shopware account), to allow installation of store plugins. Note the various environment variables. They control how the build commands are executed. Note that Bitbucket and Gitlab preset the env variable CI with CI=1.

The build process does not need to have access to the database. The prequisite for this being that all plugins, including all custom plugins, are Composer installed.

```yaml
- export APP_ENV=prod
- export DATABASE_URL=""
- export COMPOSER_CACHE_DIR="$(pwd)/composer-cache"
- export SHOPWARE_SKIP_BUNDLE_DUMP=1
- export SHOPWARE_SKIP_ASSET_COPY=1
- export SHOPWARE_SKIP_THEME_COMPILE=1
- export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1
- export SHOPWARE_ADMIN_BUILD_ONLY_EXTENSIONS=1
#
- composer config -d shopware bearer.packages.shopware.com "$BEARER_PACKAGES_SHOPWARE"
- composer install -d shopware --no-scripts
#
- shopware/bin/ci bundle:dump -n
- shopware/bin/ci feature:dump -n
- shopware/bin/build-js.sh
- shopware/bin/ci administration:delete-files-after-build -n
```

#### Completing the Sources, Shipping and Handover to the Server

The sources are being completed for environment dependent files, like robots.txt or .htaccess. Eventually rsync ships the sources to a folder \_tmp on the target server. Eventually a script deploy.sh is run on the server.

```yaml
- test -f .deploy/$CI_ENVIRONMENT_NAME/public/robots.txt && mv -f .deploy/$CI_ENVIRONMENT_NAME/public/robots.txt shopware/public/robots.txt
- test -f .deploy/$CI_ENVIRONMENT_NAME/public/.htaccess.dist && mv -f .deploy/$CI_ENVIRONMENT_NAME/public/.htaccess.dist shopware/public/.htaccess
- cat shopware/public/.htaccess.dist >> shopware/public/.htaccess && rm -f shopware/public/.htaccess.dist
- touch shopware/install.lock
#
- rsync -av -q --rsh="ssh"
--rsync-path="sudo -u www-data /usr/bin/rsync"
--delete-excluded
./shopware/ $SSH_USER@$SSH_HOST:$DEPLOY_ROOT/_tmp/
#
- ssh $SSH_USER@$SSH_HOST "/bin/bash -s " < .deploy/deploy.sh $DEPLOY_ROOT $CI_ENVIRONMENT_NAME
```

### Server Side

On the server side, the first step is move the \_tmp folder created by the runner to a uniquily named folder. Use a time stamp or a commit sha for this purpose.

The second step is to set the symlinks pointing to the var/log and the config/jwt folder.

Don't forget to symlink to a .env.local file, which holds all server specific secrets and sets the APP\_ENV variable.

Next run Shopware specific tasks:

* database migrations
* plugin updates
* theme compile
* assets install

At this point you should ensure that all files and folders created at this point get the correct file permissions (755 for folders, 644 for all files, +x only for commands in the bin folder) and ownership (to the owner/group of the web server).

Eventually, set the symlink for the web servers docroot to your new sources folder (shopware/current).

To make the change of the symlink effective in the PHP environment, the APCu and opcache need to be reset. How to do this depends on the server setup.

Last but not least, cleanup older release folders to avoid drive space congestion on your server. Again, how to do this is server specific.
