from pathlib import Path
import csv
import sys

path = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(__file__).resolve().parent / "protocol_checklist.csv"
allowed = {"yes", "no", "review_required", "not_applicable"}

with open(path, newline="", encoding="utf-8") as f:
    rows = list(csv.DictReader(f))

invalid = [r for r in rows if r["addressed"] not in allowed]
if invalid:
    raise SystemExit(f"Invalid status values: {invalid}")

needs_attention = [r for r in rows if r["addressed"] in {"no", "review_required"}]

print(f"Domains reviewed: {len(rows)}")
print(f"Domains requiring human attention: {len(needs_attention)}")
for r in needs_attention:
    print(f"- {r['domain']}: {r['addressed']} | {r['evidence_or_action']}")

print("\nBoundary:")
print("This tool checks documentation completeness only. It does not make ethical judgments or grant approval.")
