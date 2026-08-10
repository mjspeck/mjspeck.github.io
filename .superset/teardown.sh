#!/usr/bin/env bash
# Runs when the workspace is deleted.
#
# Setup installs nothing and starts no containers or databases, so there is no
# global state to undo. The only thing that can outlive the workspace is a
# browser-sync process left over from ./.superset/run.sh - kill just the one
# serving this workspace, never another workspace's.
set -euo pipefail

workspace="${SUPERSET_WORKSPACE_PATH:-$(cd "$(dirname "$0")/.." && pwd)}"

if command -v pkill >/dev/null 2>&1; then
  pkill -f "browser-sync.*${workspace}" 2>/dev/null || true
fi

echo "teardown: done"
