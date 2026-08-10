#!/usr/bin/env bash
# Dev server: serves the workspace exactly as GitHub Pages serves it, and
# live-reloads the browser when the HTML, CSS or JS changes.
#
# This is the working stand-in for the `gulp dev` task described in README.md,
# which no longer runs (see .superset/setup.sh for why). browser-sync picks the
# next free port starting at 3000, so several workspaces can run side by side.
set -euo pipefail

workspace="${SUPERSET_WORKSPACE_PATH:-$(cd "$(dirname "$0")/.." && pwd)}"
cd "$workspace"

# Pass the workspace as an absolute path rather than "." so the path shows up in
# the process command line - that is what lets teardown.sh find and stop only
# this workspace's server.
exec npx --yes browser-sync start \
  --server "$workspace" \
  --files "index.html, css/*.css, js/*.js, img/**" \
  --no-notify
