# Media URLs Out Of Sync between Servers

### tl;dr

If you are getting 404 responses for all your media files in the local, dev or staging environment, the most likely case is a mismatch in Shopware's media pathname strategies between environments. The cure is simply to define the SHOPWARE\_CDN\_STRATEGY\_DEFAULT environment variable in all environments. In many cases, 'Id' is the correct choice, however this needs to be verified. Add one of the lines below to your .env files for all environments:

```
# .env
# SHOPWARE_CDN_STRATEGY_DEFAULT="physical_filename" - or -
SHOPWARE_CDN_STRATEGY_DEFAULT="id"
```

Should broken URLs persist after having determined and correctly set your strategy, you may need to run the following command:

```bash
bin/console media:update-path --force
```

### The Problem

When you set up your local environment or a staging server as a clone of your production server, you are essentially copying your code sources, your database and all your media files to your cloned environment.

Since media files can take up a lot of disk space, one way to avoid having to maintain all your media files locally is to simply retrieve them using a redirect, as in this .htaccess example:

```xml
<IfModule mod_rewrite.c>
    RewriteEngine On
    RedirectMatch 301 ^/media/(.*)$ https://<your-production-server>/media/$1
    RedirectMatch 301 ^/thumbnail/(.*)$ https://<your-production-server>/thumbnail/$1
</IfModule>
```

Now, whether you've copied your media folders or you're using the redirect approach, sometimes this doesn't seem to work. Instead, the media URLs are returning 404s. If you analyse the problem, you will quickly realize that the hashed path to the exact same media file is different in your local environment and on your production server. For example

```
# locally
.../a1/b2/c3/myPicture.jpg

# server
.../1c/2b/3a/myPicture.jpg
```

### Shopware's Media Pathname Strategies

So what happens? Shopware generates the media paths using a pathname strategy. The relevant classes can be found in Shopware's core: `core/Content/Media/Core/Strategy`. Basically there are four predefined strategies: `id`, `filename`, `physicalFilename` and `plain`.

The id strategy simply creates a path based on the md5 hash of the mediaId. Thus there is no relationship between the filename and the generated path, it is impossible to 'guess' the path just knowing the filename.

The filename strategy does the same, but uses the filename as the basis for the hash. It is not possible to have two physical files sharing the same filename with this strategy.

The physicalFilename strategy adds the uploadedAt timestamp to the filename to create the hash, thus allowing multiple files with the same filename.

Without going into detail, if you are trying to redirect your media requests to another server, or if you copied your media folder from another server, you need to make sure that both your local environment and the server are using the same pathname strategy.

However, as the default strategy changed from id in "ancient" versions to physicalFilename in 6.5 (as far as I know), you may have to explicitly define the strategy when using existing media folders from older installations.

### Recommended Action

Check whether SHOPWARE\_CDN\_STRATEGY\_DEFAULT was/is defined in all your environments. For older installations (pre 6.5), the default value might have been 'Id'. To enable the correct strategy, define and set the SHOPWARE\_CDN\_STRATEGY\_DEFAULT variable in your .env file. Remember to do this in your local env as well as on your server.

If broken URLs persist, run `bin/console media:update-path --force` after correcting the strategy setting.
