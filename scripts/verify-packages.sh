#!/usr/bin/env bash
# Verify plugin symlinks match PACKAGE-MATRIX.md included skills and SKILL.md frontmatter.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

fail=0

check_plugin() {
  local plugin="$1"
  shift
  local expected=("$@")
  local dir="plugins/$plugin/skills"

  if [[ ! -d "$dir" ]]; then
    echo "FAIL: missing $dir"
    fail=1
    return
  fi

  actual=()
  while IFS= read -r line; do
    actual+=("$line")
  done < <(find "$dir" -maxdepth 1 -type l -exec basename {} \; | sort)

  for skill in "${expected[@]}"; do
    if [[ ! -L "$dir/$skill" ]]; then
      echo "FAIL: $plugin missing symlink for $skill"
      fail=1
    elif [[ ! -f "$dir/$skill/SKILL.md" ]]; then
      echo "FAIL: $plugin/$skill symlink broken or SKILL.md missing"
      fail=1
    fi
  done

  for link in "${actual[@]}"; do
    local found=0
    for skill in "${expected[@]}"; do
      [[ "$link" == "$skill" ]] && found=1 && break
    done
    if [[ $found -eq 0 ]]; then
      echo "FAIL: $plugin has unexpected symlink: $link"
      fail=1
    fi
  done

  echo "OK: $plugin (${#expected[@]} skills)"
}

check_plugin cowork-work figma-design
check_plugin cowork-life endurance-coach
check_plugin cowork-utils \
  client-resources defuddle-n8n raindrop-bookmarks plan-workflow skill-creator \
  continual-learning deep-research deploy-artifact image-generator \
  plan-implement plan-write send-message
check_plugin cowork-skills \
  client-resources defuddle-n8n figma-design plan-workflow raindrop-bookmarks skill-creator

for plugin in cowork-work cowork-utils cowork-life cowork-skills; do
  manifest="plugins/$plugin/.claude-plugin/plugin.json"
  if ! jq -e '.name and .version and .description' "$manifest" >/dev/null; then
    echo "FAIL: invalid $manifest"
    fail=1
  fi
done

if [[ -f .claude-plugin/marketplace.json ]]; then
  echo "OK: marketplace.json present"
else
  echo "FAIL: missing .claude-plugin/marketplace.json"
  fail=1
fi

if [[ $fail -eq 0 ]]; then
  echo "All package checks passed."
  exit 0
else
  echo "Package verification failed."
  exit 1
fi
