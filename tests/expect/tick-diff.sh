#!/usr/bin/env bash
# tick-diff.sh <before.md> <after.md>
#
# Asserts the only difference between two roadmap files is checkbox state:
# identical line count (nothing added or removed), and every changed line is
# `- [ ]` -> `- [x]` with the rest of the line byte-identical. Any rewording,
# annotation, or strikethrough folded into a tick is a failure — the tick
# protocol says ticking is the only edit that operation makes.
#
# Exit 0 if the diff is tick-only, 1 otherwise.

set -u
before="${1:?usage: tick-diff.sh <before> <after>}"
after="${2:?usage: tick-diff.sh <before> <after>}"

if [ "$(wc -l < "$before")" != "$(wc -l < "$after")" ]; then
  echo "FAIL: line count differs — lines were added or removed"
  exit 1
fi

awk 'NR==FNR { a[FNR]=$0; next }
     {
       if ($0 == a[FNR]) next
       b = a[FNR]
       sub(/- \[ \]/, "- [x]", b)          # the one permitted transformation
       if (b != $0) {
         printf "FAIL line %d: non-tick change\n  before: %s\n  after:  %s\n", FNR, a[FNR], $0
         bad = 1
       }
     }
     END { exit bad }' "$before" "$after" && echo "ok: tick-only diff"
