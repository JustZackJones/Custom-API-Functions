#!/usr/bin/env bash
set -euo pipefail

# Usage: ./build_zip.sh [output_zip]
OUTPUT_ZIP="${1:-lambda_deploy.zip}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if ! command -v zip >/dev/null 2>&1; then
  echo "Error: 'zip' is not installed. Install it and rerun."
  exit 1
fi

# Remove existing archive to avoid stale contents.
rm -f "$OUTPUT_ZIP"

# Package all Python modules in this folder, excluding common non-runtime files.
zip -r "$OUTPUT_ZIP" . \
  -i "*.py" \
  -x "build_zip.sh" "test_*.py" "*_test.py"

echo "Created $OUTPUT_ZIP in $SCRIPT_DIR"
