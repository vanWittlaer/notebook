# Why use ddev?

When it comes to setting up and running a Shopware project locally, there's no shortage of good options — not
least Shopware's own shopware-cli, which keeps gaining project setup and management features. Shopware's goal is
clearly to make shopware-cli the one-stop tool for Shopware development. So why might you still want to reach for
ddev?

It helps to look at this from two perspectives: the individual developer/freelancer, and the team/agency.

## Developers' benefits

- **Easy to install** — The only requirements are git, Docker and ddev. On macOS, "Docker" can simply be
  OrbStack, and ddev is a small Go app installed with a single install script.
- **Keeps your machine clean** — Project dependencies such as PHP, MySQL and Node.js stay where they belong:
  inside the project, not scattered across your system.
- **Easy to set up** — A fresh Shopware install takes just two commands, `composer create-project` and
  `bin/console system:install` — or, shorter still, a single copy-and-paste
  [install script](less-than-5-minutes-install-with-ddev-and-symfony-flex.md).
- **Excellent performance** — Built on Docker (OrbStack on macOS), with performance tooling such as Mutagen
  built in.
- **Project isolation** — Freelancers often juggle several client projects at once. With ddev, each project runs
  in its own fully isolated environment by default — no fiddly trial-and-error with port numbers.

## Agencies' benefits

- **Low barrier to entry, fast onboarding** — There's very little a team member needs to know beyond
  `ddev start` and `ddev stop`, all covered by the community-maintained
  [documentation](https://docs.ddev.com/en/stable/){:target="_blank"}. Getting onto an existing project is just
  `git clone` and `ddev start`; built-in commands like `ddev pull remote-db` fetch what isn't in the repo, and an
  [nginx reverse proxy](fetch-media-from-production-or-staging-server.md) loads and caches production media on
  the fly — no need to sync gigabytes of files to every machine.
- **Consistent, reproducible environments** — Every detail of the setup is committed to the project repository,
  so every change is clearly documented and versioned. No more drifting PHP or Node.js versions between team
  members.
- **Simple by default, yet able to mirror production** — ddev strikes a good balance: trivial to run for a basic
  project, but ready to reproduce a complex production stack locally when you need to. Extra services such as
  Redis, [RabbitMQ](rabbitmq-with-ddev.md), Elasticsearch/OpenSearch and more are a few lines of config or a
  ready-made add-on away, so your local environment matches production instead of merely approximating it.
