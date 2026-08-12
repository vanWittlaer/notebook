# Benny's Shopware Notebook

MkDocs Material site published at <https://notebook.vanwittlaer.de>.
See `README.md` for local preview, editing basics and the GitHub Pages setup.

## Never change the path of an existing page

The URL structure is inherited from the old GitBook site and is load-bearing:
inbound links and bookmarks reach `/hosting/rabbitmq/` and rely on GitHub Pages'
301 from the old no-trailing-slash form. Renaming or moving an existing
`docs/**.md` file silently breaks those links.

If a page genuinely must move, say so and leave a redirect behind — do not do it
as part of an unrelated change. `docs/introduction.html` is the pattern: a
hand-written meta-refresh stub, not a content page.

## Adding a page touches two or three files

1. The `.md` file under `docs/`.
2. A `nav:` entry in `mkdocs.yml` — a page missing from `nav:` fails the build.
3. `mkdocs.yml` → `plugins: llmstxt: sections:` **only when adding a brand-new
   top-level section.** Existing sections use globs, so new pages inside them are
   picked up automatically. This third step is the one that gets forgotten.

## Verify with the same command CI runs

```bash
mkdocs build --strict
```

`--strict` turns warnings (broken internal links, pages absent from `nav:`) into
errors, and it is what `.github/workflows/deploy.yml` runs on every push to
`main`. A build that passes locally without `--strict` can still fail the deploy.

The build **needs network access**: `pymdownx.snippets` has `url_download: true`
and the install page pulls its `install.sh` from a remote gist at build time, so
a strict build fails when the gist is unreachable rather than when anything is
actually wrong with the content.

## Keep serve.sh in sync with requirements.txt

`serve.sh` does not read `requirements.txt`. It pins the
`squidfunk/mkdocs-material` image tag and pip-installs `mkdocs-llmstxt` by
version inside the container. Bumping a version in `requirements.txt` means
bumping it in `serve.sh` too, or Docker preview and CI drift apart.

## Conventions

- Content is a personal, practical notebook that **supplements** the official
  Shopware 6 docs — real-world findings, gotchas and working configs. Don't
  restate what the official documentation already covers well; link to it.
- Folder layout under `docs/` mirrors the site's URL structure.
- Section landing pages are the `index.md` in each section folder
  (the `navigation.indexes` theme feature) — not a separate overview page.
- Commit messages: short sentence-case summary, no type prefixes or scopes.
- `site/` is gitignored build output — never edit it by hand.
