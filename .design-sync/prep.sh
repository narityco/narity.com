#!/bin/sh
# Prepare the synthetic tokens-only package the converter consumes.
# Run from the repo root before package-build.mjs, on every sync.
#
# Two things the converter's own bounds require and that we therefore
# regenerate rather than commit:
#
#   1. cssEntry is bounded to the package dir and realpath'd, so it can
#      neither point at ../../assets/style.css nor reach it by symlink.
#      We copy it in. assets/style.css stays the single source of truth;
#      brand/styles.css is a build input, gitignored, never hand-edited.
#   2. tokensGlob only resolves under node_modules/<tokensPkg>, so the
#      package needs to be resolvable there. .ds-sync/node_modules is
#      regenerated per clone, hence so is this link.
set -eu

root=$(cd "$(dirname "$0")/.." && pwd)
cd "$root"

cp assets/style.css .design-sync/brand/styles.css
mkdir -p .ds-sync/node_modules
ln -sfn ../../.design-sync/brand .ds-sync/node_modules/narity-brand

echo "prep: brand/styles.css refreshed from assets/style.css; narity-brand linked"
