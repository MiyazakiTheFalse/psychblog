from pathlib import Path
import math
import pandas as pd
from scipy import stats
import matplotlib.pyplot as plt

HERE = Path(__file__).resolve().parent
df = pd.read_csv(HERE / "synthetic_procrastination.csv")

print("Rows:", len(df))
print("\nMissing values:")
print(df.isna().sum())

cols = ["self_efficacy", "procrastination", "study_hours", "employment_hours"]
print("\nDescriptive statistics:")
print(df[cols].describe().round(2))

r, p = stats.pearsonr(df["self_efficacy"], df["procrastination"])
n = len(df)
z = 0.5 * math.log((1 + r) / (1 - r))
se = 1 / math.sqrt(n - 3)
zcrit = stats.norm.ppf(0.975)
lo_z, hi_z = z - zcrit * se, z + zcrit * se
lo = (math.exp(2 * lo_z) - 1) / (math.exp(2 * lo_z) + 1)
hi = (math.exp(2 * hi_z) - 1) / (math.exp(2 * hi_z) + 1)

print(f"\nPearson r = {r:.3f}")
print(f"p = {p:.6g}")
print(f"95% CI for r = [{lo:.3f}, {hi:.3f}]")
print("\nInterpretation: this synthetic cross-sectional analysis demonstrates association only, not causation.")

plt.figure()
plt.scatter(df["self_efficacy"], df["procrastination"])
plt.xlabel("Self-efficacy score")
plt.ylabel("Procrastination score")
plt.title("Synthetic psychology-style dataset")
plt.tight_layout()
plt.savefig(HERE / "scatterplot.png", dpi=160)
print("\nSaved scatterplot.png")
