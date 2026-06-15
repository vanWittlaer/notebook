#!/usr/bin/env sh
# Live-preview the notebook locally at http://127.0.0.1:8000 (Ctrl-C to stop).
# Uses the pinned Material image — no local Python needed, just Docker.
# Works from anywhere: it mounts this script's own directory.
#
# The Material image ships only mkdocs-material, so we pip-install the extra
# plugins this site uses (currently mkdocs-llmstxt, for /llms.txt) into the
# container before serving — keep this version in sync with requirements.txt.
set -eu

DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

exec docker run --rm -it -p 8000:8000 -v "$DIR:/docs" \
  --entrypoint sh \
  squidfunk/mkdocs-material:9.7.6 -c \
  'pip install --quiet --disable-pip-version-check mkdocs-llmstxt==0.5.0 \
     && exec mkdocs serve --dev-addr 0.0.0.0:8000'
