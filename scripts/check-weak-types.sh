#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

calcit calcit.cirru analyze weak-types --only coverage --coverage-level none,partial --format json |
  jq -e --slurpfile budget config/weak-types-budget.json '
    all(.data.definitions[]; .coverage == $budget[0].coverage[.id]
      or (.coverage == "partial" and $budget[0].coverage[.id] == "none"))'

calcit calcit.cirru analyze weak-types \
  --only schema-dynamic,unresolved-type-slot,code-dynamic,code-nil,unsafe-coerce,data-dynamic --format json |
  jq -e --slurpfile budget config/weak-types-budget.json '
    all(.data.definitions[]; .id as $id |
      all(.occurrences | map(.kind) + map(select(.intent == "unresolved") | .intent) | group_by(.)[];
        length <= ($budget[0].weak[$id][.[0]] // 0)))'
