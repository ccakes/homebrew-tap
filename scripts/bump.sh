#!/usr/bin/env bash
# Bump Formula/Cask files to the latest upstream GitHub release.
#
# Reads metadata via `gh release view --json tagName,assets`, then rewrites
# `version "x.y.z"` and the matching `sha256 "..."` lines in place.
#
# For the formula, each sha256 line is matched against the asset filename
# in the preceding `url ".../<asset>"` line (two-line awk window), so the
# four arch-specific sha256 values stay correctly mapped without per-line
# markers in the formula source.
#
# Idempotent: prints `up-to-date` and exits 0 when nothing changes.

set -euo pipefail

cd "$(dirname "$0")/.."

# Latest release metadata: <tag> then NAME<TAB>SHA pairs, one per line.
fetch_release() {
  local repo="$1"
  gh release view --repo "$repo" --json tagName,assets --jq '
    .tagName,
    (.assets[] | "\(.name)\t\(.digest | sub("^sha256:"; ""))")
  '
}

# Read sha for a named asset from the fetched metadata block (stdin).
sha_for() {
  local name="$1"
  awk -F'\t' -v want="$name" '$1 == want { print $2; found=1; exit }
    END { if (!found) exit 1 }'
}

# Rewrite `version "..."` to a new value.
sed_version() {
  local file="$1" new="$2"
  sed -i.bak -E "s/^([[:space:]]*version[[:space:]]+)\"[^\"]+\"/\1\"${new}\"/" "$file"
  rm -f "${file}.bak"
}

# For formula files: rewrite each sha256 line, choosing the new value by
# matching the asset filename in the preceding url line. awk passes once.
bump_formula_shas() {
  local file="$1" tmp
  shift
  # Remaining args are name=sha pairs.
  tmp=$(mktemp)
  awk -v pairs="$*" '
    BEGIN {
      n = split(pairs, kvs, " ")
      for (i = 1; i <= n; i++) {
        split(kvs[i], kv, "=")
        sha[kv[1]] = kv[2]
      }
    }
    {
      line = $0
      if (line ~ /url[[:space:]]+"[^"]+\//) {
        asset = line
        sub(/^.*\//, "", asset)
        sub(/".*$/, "", asset)
        last_asset = asset
      }
      if (last_asset != "" && sha[last_asset] != "" \
          && line ~ /^[[:space:]]*sha256[[:space:]]+"/) {
        prefix = line
        sub(/".*$/, "", prefix)
        line = prefix "\"" sha[last_asset] "\""
        last_asset = ""
      }
      print line
    }
  ' "$file" > "$tmp"
  mv "$tmp" "$file"
}

# For cask files: single top-level sha256.
sed_single_sha() {
  local file="$1" new="$2"
  sed -i.bak -E "s/^([[:space:]]*sha256[[:space:]]+)\"[^\"]+\"/\1\"${new}\"/" "$file"
  rm -f "${file}.bak"
}

current_version() {
  grep -E '^[[:space:]]*version[[:space:]]+"' "$1" \
    | head -n 1 \
    | sed -E 's/.*"([^"]+)".*/\1/'
}

bump_workbench() {
  local file="Formula/workbench.rb"
  local meta tag new_version
  meta=$(fetch_release ccakes/workbench)
  tag=$(echo "$meta" | head -n 1)
  new_version="${tag#v}"

  if [ "$(current_version "$file")" = "$new_version" ]; then
    echo "up-to-date: $file ($new_version)"
    return 0
  fi

  local body sha_darwin_arm sha_darwin_amd sha_linux_arm sha_linux_amd
  body=$(echo "$meta" | tail -n +2)
  sha_darwin_arm=$(echo "$body" | sha_for "bench-darwin-arm64")
  sha_darwin_amd=$(echo "$body" | sha_for "bench-darwin-amd64")
  sha_linux_arm=$(echo "$body"  | sha_for "bench-linux-arm64")
  sha_linux_amd=$(echo "$body"  | sha_for "bench-linux-amd64")

  sed_version "$file" "$new_version"
  bump_formula_shas "$file" \
    "bench-darwin-arm64=$sha_darwin_arm" \
    "bench-darwin-amd64=$sha_darwin_amd" \
    "bench-linux-arm64=$sha_linux_arm" \
    "bench-linux-amd64=$sha_linux_amd"

  echo "bumped: $file -> $new_version"
}

bump_elo() {
  local file="Casks/elo.rb"
  local meta tag new_version body sha
  meta=$(fetch_release ccakes/elo)
  tag=$(echo "$meta" | head -n 1)
  new_version="${tag#v}"

  if [ "$(current_version "$file")" = "$new_version" ]; then
    echo "up-to-date: $file ($new_version)"
    return 0
  fi

  body=$(echo "$meta" | tail -n +2)
  sha=$(echo "$body" | sha_for "Elo-macos.app.zip")

  sed_version "$file" "$new_version"
  sed_single_sha "$file" "$sha"

  echo "bumped: $file -> $new_version"
}

bump_workbench
bump_elo
