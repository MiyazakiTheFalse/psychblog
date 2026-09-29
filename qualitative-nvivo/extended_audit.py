from pathlib import Path
import csv
from collections import Counter, defaultdict

HERE=Path(__file__).resolve().parent

with open(HERE/"extended_fictional_interviews.csv",newline="",encoding="utf-8") as f:
    excerpts={r["participant"]:r["excerpt"] for r in csv.DictReader(f)}

with open(HERE/"extended_codebook.csv",newline="",encoding="utf-8") as f:
    codes=list(csv.DictReader(f))

assert len(excerpts)==18, "Expected 18 fictional excerpts"
assert all(r["participant"] in excerpts for r in codes), "Unknown participant in codebook"

theme_counts=Counter(r["candidate_theme"] for r in codes)
participant_map=defaultdict(list)
for r in codes:
    participant_map[r["participant"]].append(r["initial_code"])

print("EXTENDED QUALITATIVE AUDIT")
print("="*40)
print(f"Sources: {len(excerpts)}")
print(f"Coding records: {len(codes)}")
print("\nCandidate themes (audit counts only, not prevalence):")
for theme,n in theme_counts.most_common():
    print(f"- {theme}: {n}")

print("\nNegative/complicating cases deliberately retained:")
for p in ["P05","P08","P11","P15"]:
    print(f"- {p}: {excerpts[p]}")

print("\nAudit trail integrity:")
print("All coded participant IDs resolve to a source excerpt.")
print("Interpretation remains manual; this script does not generate themes.")
