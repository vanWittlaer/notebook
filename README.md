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

The path structure matches the old GitBook site exactly. With
`use_directory_urls: false`, MkDocs builds flat files like
`hosting/rabbitmq.html`, and GitHub Pages serves them at the **extensionless,
no-trailing-slash** URL `/hosting/rabbitmq` — identical to the old GitBook URLs,
so every inbound link and bookmark keeps resolving to the same address.
`/introduction` redirects to the home page, matching GitBook's old behaviour.

Trade-off: because of `use_directory_urls: false`, the links MkDocs writes
*within* the site carry a `.html` suffix (e.g. clicking a nav item lands on
`/hosting/rabbitmq.html`). Both forms serve the same page. To instead get clean
trailing-slash URLs (`/hosting/rabbitmq/`) at the cost of a redirect on old
no-slash links, set `use_directory_urls: true`.

## Migration note

The initial content was imported from the live GitBook site (which exposes raw
Markdown by appending `.md` to each URL). GitBook-specific syntax — the
`{% embed %}` blocks, the per-page `llms.txt` header and the trailing
"Agent Instructions" block — was stripped during import.
