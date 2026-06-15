#!/usr/bin/env sh
# Live-preview the notebook locally at http://127.0.0.1:8000 (Ctrl-C to stop).
# Uses the pinned Material image — no local Python needed, just Docker.
# Works from anywhere: it mounts this script's own directory.
set -eu

DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

exec docker run --rm -it -p 8000:8000 -v "$DIR:/docs" \
  squidfunk/mkdocs-material:9.7.6 serve --dev-addr 0.0.0.0:8000
