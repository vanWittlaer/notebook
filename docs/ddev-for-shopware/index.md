# DDEV for Shopware

- [Why use DDEV for Shopware?](why-use-ddev.md):  Recently, DDEV has been growing in popularity amongst both Shopware developers and Shopware agencies. Here’s my theory as to why that is.
- [Less than 5 Minutes Install with DDEV and Symfony Flex](less-than-5-minutes-install-with-ddev-and-symfony-flex.md): This page describes how to install Shopware in a local DDEV environment, using Shopware's Symfony Flex template.
- [Using shopware-cli with DDEV](using-shopware-cli-with-ddev.md): This page explains how to use shopware-cli with DDEV. shopware-cli replaces some of Shopware's commands (like bin/storefront-build.sh), and adds a set of useful commands.
- [Storefront and Admin Watchers with DDEV](storefront-and-admin-watchers-with-ddev.md): This page explains how to set up and use Shopware's storefront and admin watchers.
- [Setting up workers and the scheduler as automated tasks](message-queue-setup-with-ddev.md): This page explains how to setup the messenger:consume and scheduled-task:run workers (the "message queue") in a DDEV environment, mirroring a production server setup.
- [Contribute with DDEV](contribute-with-ddev.md): This page explains how to setup a local contributing environment for Shopware 6' community edition with DDEV.
- [Performance Tweaks](performance-tweaks.md): This page provides some basic performance tweaks for running a Shopware project with DDEV.
- [RabbitMQ with DDEV](rabbitmq-with-ddev.md): This page explains how to setup the open-source message queuing software RabbitMQ with DDEV and Shopware 6.
- [phpstan pro with DDEV](phpstan-pro-with-ddev.md): For phpstan pro see https://phpstan.org/blog/introducing-phpstan-pro. It's a great tool, it's monthly plan for developers should be worth it for most of us.
- [Fetch Media from Production or Staging Server](fetch-media-from-production-or-staging-server.md): For local development and testing you do not have to copy all media files to your local environment.
- [Running Claude Code in DDEV](running-claude-code-in-ddev.md): If you do not wish to install Claude Code directly on your computer, this chapter explains how you can easily run it from within your DDEV container.
- [Frontend Work with Claude Code and Playwright](frontend-work-with-claude-code-and-playwright.md): When asking Claude for help with frontend development, it obviously needs some kind of access to the browser frontend. Playwright can provide direct access to browser output for Claude Code.
- [DDEV behind Fritz!Box Routers](ddev-behind-fritzbox-routers.md): Your project starts, but the browser cannot find `myshop.ddev.site`. The Fritz!Box's DNS rebind protection is swallowing the answer — here is the one-line exception that fixes it.
