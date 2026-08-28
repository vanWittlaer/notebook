# Why use DDEV?

When it comes to setting up and running a Shopware project locally, there's no shortage of good options — not
least Shopware's own shopware-cli, which keeps gaining project setup and management features. Shopware's goal is
clearly to make shopware-cli the one-stop tool for Shopware development. So why might you still want to reach for
DDEV?

It helps to look at this from two perspectives: the individual developer/freelancer, and the team/agency.

## Developers' benefits

- **Easy to install** — The only requirements are git, Docker and DDEV. On macOS, "Docker" can simply be
  OrbStack, and DDEV is a small Go app installed with a single install script.
- **Keeps your machine clean** — Project dependencies such as PHP, MySQL and Node.js stay where they belong:
  inside the project, not scattered across your system.
- **Easy to set up** — A fresh Shopware install takes just two commands, `composer create-project` and
  `bin/console system:install` — or, shorter still, a single copy-and-paste
  [install script](less-than-5-minutes-install-with-ddev-and-symfony-flex.md).
- **Excellent performance** — Built on Docker (OrbStack on macOS), with performance tooling such as Mutagen
  built in.
- **Project isolation** — Freelancers often juggle several client projects at once. With DDEV, each project runs
  in its own fully isolated environment by default — no fiddly trial-and-error with port numbers.
- **Trusted HTTPS** DDEV uses traefik and mkcert to conduct all your artifacts with locally trusted HTTPS.
- **Cross-project connectivity** Projects can communicate with each other via the DDEV provided local URLs. 
A crucial feature e.g. for development of Shopware apps, when you want to test your server with a local Shopware client.
- **xdebug out-of-the-box** With phpstorm, using xdebug is just one command `ddev xdebug on` away. (With VSCode some setup,
approx. 2 min., is required.)

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
- **Simple by default, yet able to mirror production** — DDEV strikes a good balance: trivial to run for a basic
  project, but ready to reproduce a complex production stack locally when you need to. Extra services such as
  Redis, [RabbitMQ](rabbitmq-with-ddev.md), Elasticsearch/OpenSearch and more are a few lines of config or a
  ready-made add-on away, so your local environment matches production instead of merely approximating it.
- **Instant client demos** With a single command `ddev share` projects can be accessed across the web using a 
tunnel provider like ngrok or cloudflared. Teams can thus easily share their achievements with clients on-the-fly, 
without running deployments and demo server setups.

Also read Randy's (lead maintainer of DDEV) 
[blog article on opensource.com](https://opensource.com/article/22/12/ddev){:target="_blank"}.
