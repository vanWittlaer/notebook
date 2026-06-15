# Benny's Shopware Notebook

The source for <https://notebook.vanwittlaer.de> — a practical notebook
supplementing the official Shopware 6 documentation. Built with
[MkDocs](https://www.mkdocs.org/) + [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/),
migrated off GitBook.

## Local preview

```bash
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve            # live-reload preview at http://127.0.0.1:8000
```

## Editing

- Pages live under `docs/` as plain Markdown. The folder layout mirrors the URL
  structure of the site.
- The sidebar order and titles are defined by the `nav:` block in `mkdocs.yml`.
  Add a new page by creating the `.md` file **and** adding a `nav:` entry.
- Section landing pages are the `index.md` inside each section folder
  (the `navigation.indexes` theme feature).

## Deployment

Pushing to `main` triggers `.github/workflows/deploy.yml`, which builds the site
with `mkdocs build --strict` and publishes it to GitHub Pages.

### One-time GitHub setup

1. Repo **Settings → Pages → Build and deployment → Source: GitHub Actions**.
2. Push to `main`; the workflow builds and deploys.
3. Custom domain: `docs/CNAME` already contains `notebook.vanwittlaer.de`.
   At your DNS provider, point the host `notebook` at GitHub Pages:
   - `CNAME notebook -> vanwittlaer.github.io.` (recommended for a subdomain), **or**
   - the four GitHub Pages `A` records if you prefer an apex/A setup.
   Then enable **Enforce HTTPS** in Settings → Pages.

## URL preservation

The path structure matches the old GitBook site. With the default
`use_directory_urls: true`, pages build to `hosting/rabbitmq/index.html` and are
served at the clean, extension-less path `/hosting/rabbitmq/`. In-site links
carry no `.html` suffix, and the old no-trailing-slash GitBook URLs
(`/hosting/rabbitmq`) are **301-redirected** by GitHub Pages to the trailing-slash
form — so every inbound link and bookmark keeps working, and the 301 is the
correct SEO signal for the move. `/introduction` redirects to the home page,
matching GitBook's old behaviour.

(Setting `use_directory_urls: false` would instead emit flat `*.html` files and
serve byte-identical extension-less URLs with no trailing slash, but then the
site's own navigation links would carry a visible `.html` suffix — and the
canonical tags would point at the `.html` form anyway. Trailing-slash is the
cleaner, conventional choice.)

## Migration note

The initial content was imported from the live GitBook site (which exposes raw
Markdown by appending `.md` to each URL). GitBook-specific syntax — the
`{% embed %}` blocks, the per-page `llms.txt` header and the trailing
"Agent Instructions" block — was stripped during import.
