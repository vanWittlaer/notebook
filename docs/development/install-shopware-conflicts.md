# Install the Shopware Conflicts Package

## What and Why You Should Install It

Shopware 6 deliberately allows patch-level updates of its dependencies to happen automatically. This is a feature, not an oversight: when a security fix is published for one of the underlying libraries, you receive it immediately, without having to wait for a new Shopware release.

The downside is that not every dependency honours strict backwards compatibility on its internal APIs. Every now and then a seemingly harmless patch release of a third-party library slips through and breaks your installation — even though, on paper, the version constraint allowed it.

To protect against exactly this class of problem, Shopware maintains the [`shopware/conflicts`](https://github.com/shopware/conflicts) metapackage. It is a central, continuously updated registry of package versions that are known to be incompatible with Shopware 6. Once required in your project, Composer consults this list during dependency resolution and simply refuses to install any version that is known to cause trouble.

The mechanism is fully automatic. You do not have to track incompatibilities yourself, watch changelogs, or pin versions by hand — the metapackage keeps the bad versions out of your installation for you, and it can be updated independently of the Shopware release cycle. There is essentially no reason not to have it in a project.

## How to Install

Run the following two commands in the root of your Shopware project:

```bash
composer config repositories.shopware composer https://shopware.github.io/conflicts/
composer require shopware/conflicts
```

The first command registers Shopware's conflicts repository as a Composer source; the second requires the metapackage itself. From then on, `composer require` and `composer update` will automatically exclude any version that is listed as incompatible.

Because the package carries no code — it only declares `conflict` constraints — there is nothing to configure and nothing to maintain afterwards. Keeping it updated happens along with your regular `composer update` runs.
