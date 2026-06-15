#!/usr/bin/env sh
# Live-preview the notebook locally at http://127.0.0.1:8000 (Ctrl-C to stop).
# Native variant of serve.sh: runs MkDocs in a local Python venv instead of
# Docker. Use this when Docker's bind-mount live-reload doesn't fire (e.g. the
# inotify/VirtioFS gap on OrbStack/Docker Desktop) — host-native file watching
# is reliable. Needs python3 + pip; the Docker variant needs neither.
# Works from anywhere: it operates on this script's own directory.
set -eu

DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
VENV="$DIR/.venv"

if [ ! -d "$VENV" ]; then
  echo "Creating venv at $VENV ..."
  python3 -m venv "$VENV"
fi

# Idempotent: fast once the pinned wheel is cached.
"$VENV/bin/pip" install --quiet --disable-pip-version-check -r "$DIR/requirements.txt"

exec "$VENV/bin/mkdocs" serve -f "$DIR/mkdocs.yml" --dev-addr 127.0.0.1:8000
