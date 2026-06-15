# Patching the Core

There are several means of customizing Shopware code to your project's needs, like Shopware's event system or Symfony's service decorator patterns to name just two. From time to time, however, you might encounter a situation, where customization requirements make a change to Shopware core code  inevitable.

Now, changing Shopware's core code within the vendor folder is not a good  idea, for obvious reasons. Fortunately, a Composer based solution is available. It is called composer-patches and is very well documented for Typo3 in the [docs](https://docs.typo3.org/m/typo3/guide-installation/main/en-us/ApplyingCorePatches/Index.html).

The power of this: You can do almost everything. The obvious downside: You'l lose your update capability.

Needless to say that the following instructions allow to patch any Shopware plugin and any other Composer required package as well.

### How To

In short, you need to require the following composer extension to your project:

```bash
composer require cweagans/composer-patches
```

Create a folder to store your actual patches. I have created a new subfolder `patches` within the `custom` folder of my Shopware project for this purpose.

To activate a patch, amend the code in the "extra" section of your `composer.json`, like in the following example:

```json
    "extra": {
        "patches": {
            "shopware/core": {
                "Append trailing slash to sitemap home url": "custom/patches/shopware/add_trailing_slash_to_sitemap_home_url.diff"
            }
        },
 ...
    }
```

Apply the patch by running composer install:

```sh
composer install
```

### Identifying the Relative Filenames for the Patch File

I use to create my patch files using PhpStorm's diff functionality. However, the resulting relative filenames need to be adjusted to match the composer setup of the Shopware project.

In my example, my patch file looks like this:

```diff
# shopware/custom/patches/shopware/add_trailing_slash_to_sitemap_home_url.diff
diff --git a/Content/Sitemap/Service/SitemapExporter.php b/Content/Sitemap/Service/SitemapExporter.php
--- a/Content/Sitemap/Service/SitemapExporter.php
+++ b/Content/Sitemap/Service/SitemapExporter.php
@@ -167,7 +167,7 @@ class SitemapExporter implements SitemapExporterInterface

             foreach ($result->getUrls() as $url) {
                 $newUrl = clone $url;
-                $newUrl->setLoc(empty($newUrl->getLoc()) ? $host : $host . '/' . $newUrl->getLoc());
+                $newUrl->setLoc(rtrim($host, '/') . '/' . $newUrl->getLoc());
                 $urls[] = $newUrl;
             }
```

As you see, the relative filenames are relative to the root of the Symfony component, i.e. vendor/shopware/core.
