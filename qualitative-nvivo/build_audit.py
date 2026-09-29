from pathlib import Path
import csv
from collections import Counter, defaultdict

HERE = Path(__file__).resolve().parent
excerpts = {}
with open(HERE / "fictional_excerpts.csv", newline="", encoding="utf-8") as f:
    for row in csv.DictReader(f):
        excerpts[row["participant"]] = row["excerpt"]

rows = []
with open(HERE / "codebook.csv", newline="", encoding="utf-8") as f:
    rows = list(csv.DictReader(f))

missing = sorted({r["participant"] for r in rows} - set(excerpts))
if missing:
    raise SystemExit(f"Codebook refers to missing participants: {missing}")

theme_counts = Counter(r["candidate_theme"] for r in rows)
codes_by_participant = defaultdict(list)
for r in rows:
    codes_by_participant[r["participant"]].append(r["code"])

print("Participants:", len(excerpts))
print("Coding rows:", len(rows))
print("\nCandidate theme coverage:")
for theme, n in theme_counts.items():
    print(f"- {theme}: {n} coded excerpts")

print("\nAudit by participant:")
for participant in sorted(excerpts):
    print(f"{participant}: {', '.join(codes_by_participant[participant])}")

print("\nInterpretive boundary:")
print("This script validates and summarises manually specified coding. It does not infer themes.")
