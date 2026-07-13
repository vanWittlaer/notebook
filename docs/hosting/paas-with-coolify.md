# PaaS with Coolify

Think of Coolify as a management tool for your servers and all the services you need. Coolify provides an intuitive, user-friendly interface to help you maintain control.

Behind the scenes, Coolify uses Docker to run your services, whether they are web applications, transactional databases (MySQL, MariaDB, MongoDB, etc.) or other utilities such as Redis and RabbitMQ. You don't need to know anything about Docker to use Coolify. It's as simple as turning a light on or off — you don't need to be an engineer or physicist to do that.

To use Coolify, you either need an account with Coolify's cloud or you host your own Coolify admin instance (the latter requires some technical knowledge). Your shop then runs on a basic Linux server — the easiest and cheapest option is one from a cloud provider such as Hetzner or DigitalOcean. You check that server in with Coolify, and from there Coolify takes control and sets up everything it needs.

## The services a Shopware shop needs

A production Shopware installation typically relies on:

* a MySQL or MariaDB database,
* two Redis instances (cache and session),
* a RabbitMQ instance,
* an (optional) OpenSearch or Elasticsearch instance.

On top of that you need the services that run Shopware itself: a web server to handle requests and one or more workers for offline tasks. The easiest way to build these is [Shopware Docker](https://github.com/shopware/docker), which produces a production-ready image (Caddy or Nginx plus PHP-FPM) from your source code.

Wiring all of this together by hand in the Coolify UI is tedious and error-prone. The two tools below do it for you.

## Provisioning the stack: `terraform-coolify-shopware-stack`

<https://github.com/vanWittlaer/terraform-coolify-shopware-stack> is an OpenTofu module that provisions the **entire** Shopware environment on Coolify in a single `tofu apply`: the web application (with workers and scheduler), MariaDB, two Redis instances, RabbitMQ, Elasticsearch, and optional extras such as Mailpit and a backup sidecar.

The optional backup sidecar is the [`shopware-ops-shell`](https://github.com/vanWittlaer/shopware-ops-shell) image — a lightweight maintenance container that ships the tools the official Shopware image lacks (`bash`, `shopware-cli`, `rclone`). It runs idle and you trigger its scripts on a schedule (Coolify Scheduled Tasks, `docker exec` or cron):

* `bin/backup-db.sh` dumps the database via `shopware-cli project dump`, pushes it to an S3 bucket and prunes old dumps per `DB_BACKUPS_TO_KEEP`.
* `bin/backup-s3.sh` mirrors the public and private media buckets offsite with soft-delete retention.

It follows a **day-0 bootstrap** model: you provision the environment once, and after that the **Coolify UI is the single source of truth**. You don't keep re-applying the module against a running system — from then on you manage and upgrade through Coolify.

You'll need OpenTofu ≥ 1.7, a Coolify v4 control plane with credentials, pre-built Docker images in a registry, S3 buckets, and DNS in place. The README covers the variables, the prerequisites, and the handful of one-time manual steps after the first apply.

## Driving it from DDEV: `ddev-coolify-shopware`

If you already use DDEV for local development (and the [swoofy](https://github.com/vanwittlaer/swoofy) blueprint below assumes you do), the [`ddev-coolify-shopware`](https://github.com/vanWittlaer/ddev-coolify-shopware) add-on is the friendlier front door. It installs OpenTofu into the web container and adds a `coolify-bootstrap` command that wraps the module above:

```bash
ddev add-on get vanWittlaer/ddev-coolify-shopware
ddev coolify-bootstrap init      # scaffold the tfvars templates
# …fill in secrets.auto.tfvars and your per-environment .tfvars…
ddev coolify-bootstrap up        # provision production and staging
ddev coolify-bootstrap destroy   # tear it all down again
```

Same day-0 contract applies: it refuses to bootstrap a project that already exists in Coolify, so it won't clobber changes you made in the UI.

## A complete blueprint

For a full end-to-end example — the Shopware application itself, `shopware/docker`, `frosh/tools`, the DDEV setup, and the Docker/compose files for the web and worker services — see my reference implementation, [swoofy](https://github.com/vanwittlaer/swoofy). Used together with the two tools above, it gives you a straightforward CI/CD assembly line for a typical Shopware 6 client project: DDEV locally, Coolify for staging and production, driven by GitHub workflows (or GitLab pipelines).

The full instructions live in each repository's `README.md`. Any feedback is appreciated. Have fun!
