#!/usr/bin/env bash
#
# package-codex.sh
# Creates a tarball of the built Codex CLI (bin + dist).

set -euo pipefail

# Output archive name (default: codex.tgz)
OUT="${1:-codex.tgz}"

# Ensure we're at the project root
if [ ! -d "codex-cli/dist" ]; then
  echo "Error: 'codex-cli/dist' directory not found. Run 'pnpm build' first." >&2
  exit 1
fi

# Remove any existing archive
rm -f "$OUT"

# Create tarball containing bin/ and dist/ from codex-cli
tar czf "$OUT" -C codex-cli bin dist

echo "Created package: $OUT"