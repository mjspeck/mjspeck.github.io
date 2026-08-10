#!/usr/bin/env bash
# Runs once per new Superset workspace.
#
# This repo is a static GitHub Pages site: index.html plus the committed
# css/, js/, img/ and vendor/ assets are exactly what gets served. Nothing
# has to be built or installed to preview or edit it.
#
# We deliberately do NOT run `npm install`. The devDependencies in
# package.json (gulp 3.9.1 + gulp-sass 4 -> node-sass 4) cannot be built on a
# modern toolchain: node-sass 4's node-gyp needs Python 2 and does not compile
# against Node >= 12 (this machine is on Node 23), so `npm install` fails
# outright. Skipping it keeps workspace creation fast and green.
set -euo pipefail

# Pre-warm the npx cache for the dev server so the Run button starts instantly.
# Purely an optimization - stay green if the machine is offline.
if command -v npx >/dev/null 2>&1; then
  npx --yes browser-sync --version >/dev/null 2>&1 \
    || echo "setup: could not pre-fetch browser-sync (offline?); ./.superset/run.sh will fetch it on demand"
else
  echo "setup: npx not found - install Node to use ./.superset/run.sh"
fi

echo "setup: ready - press Run to preview the site, or just open index.html"
