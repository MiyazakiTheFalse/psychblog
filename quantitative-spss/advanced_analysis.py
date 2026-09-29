from pathlib import Path
import math
import pandas as pd
import numpy as np
from scipy import stats
import matplotlib.pyplot as plt

HERE = Path(__file__).resolve().parent
df = pd.read_csv(HERE / "synthetic_procrastination.csv")

# Create three synthetic self-efficacy items around the existing scale for reliability demonstration.
# These are deterministic transformations for a software-skills exercise, not participant data.
rng = np.random.default_rng(20260929)
base = df["self_efficacy"].to_numpy()
for i, noise_sd in enumerate([4.0, 5.0, 4.5], start=1):
    df[f"selfeff_item{i}"] = np.clip(base + rng.normal(0, noise_sd, len(df)), 0, 100)

def cronbach_alpha(frame):
    item_scores = frame.to_numpy(dtype=float)
    k = item_scores.shape[1]
    item_variances = item_scores.var(axis=0, ddof=1)
    total_variance = item_scores.sum(axis=1).var(ddof=1)
    return (k/(k-1)) * (1 - item_variances.sum()/total_variance)

print("ADVANCED QUANTITATIVE PSYCHOLOGY DEMONSTRATION")
print("="*52)
print(f"N = {len(df)}")
print("\nMissingness")
print(df.isna().sum().to_string())

print("\nDescriptives")
print(df[["self_efficacy","procrastination","study_hours","employment_hours"]].describe().round(2).to_string())

alpha = cronbach_alpha(df[["selfeff_item1","selfeff_item2","selfeff_item3"]])
print(f"\nCronbach alpha for 3 synthetic self-efficacy items: {alpha:.3f}")

r, p = stats.pearsonr(df["self_efficacy"], df["procrastination"])
print(f"\nPearson correlation self-efficacy vs procrastination: r={r:.3f}, p={p:.6g}")

# Median split used only to demonstrate t-test mechanics, not recommended as the primary analysis.
median = df["self_efficacy"].median()
hi = df.loc[df["self_efficacy"] >= median, "procrastination"]
lo = df.loc[df["self_efficacy"] < median, "procrastination"]
t, tp = stats.ttest_ind(hi, lo, equal_var=False)
pooled = math.sqrt(((len(hi)-1)*hi.var(ddof=1)+(len(lo)-1)*lo.var(ddof=1))/(len(hi)+len(lo)-2))
d = (hi.mean()-lo.mean())/pooled
print(f"Welch t-test (demonstration only): t={t:.3f}, p={tp:.6g}, Cohen d={d:.3f}")

# Multiple regression via least squares: procrastination ~ self-efficacy + study_hours + employment_hours
X = np.column_stack([
    np.ones(len(df)),
    df["self_efficacy"],
    df["study_hours"],
    df["employment_hours"]
])
y = df["procrastination"].to_numpy()
beta, *_ = np.linalg.lstsq(X, y, rcond=None)
pred = X @ beta
resid = y - pred
ss_res = np.sum(resid**2)
ss_tot = np.sum((y-y.mean())**2)
r2 = 1 - ss_res/ss_tot
n, k = X.shape
sigma2 = ss_res/(n-k)
cov = sigma2 * np.linalg.inv(X.T @ X)
se = np.sqrt(np.diag(cov))
tvals = beta/se
pvals = 2*(1-stats.t.cdf(np.abs(tvals), df=n-k))
print("\nMultiple regression: procrastination ~ self-efficacy + study_hours + employment_hours")
names=["Intercept","self_efficacy","study_hours","employment_hours"]
for name,b,s,tv,pv in zip(names,beta,se,tvals,pvals):
    print(f"{name:18s} B={b:8.3f} SE={s:7.3f} t={tv:7.3f} p={pv:.6g}")
print(f"R^2 = {r2:.3f}")

# Assumption-oriented outputs
sh_w, sh_p = stats.shapiro(resid)
print(f"\nShapiro-Wilk residual check: W={sh_w:.3f}, p={sh_p:.4f}")
print("Note: assumption checks are interpreted alongside plots, design and sample size.")

plt.figure(figsize=(7,5))
plt.scatter(df["self_efficacy"], df["procrastination"])
m,b = np.polyfit(df["self_efficacy"], df["procrastination"],1)
xs=np.linspace(df["self_efficacy"].min(),df["self_efficacy"].max(),100)
plt.plot(xs,m*xs+b)
plt.xlabel("Self-efficacy")
plt.ylabel("Procrastination")
plt.title("Synthetic Psychology Dataset: Association")
plt.tight_layout()
plt.savefig(HERE/"advanced_scatter.png",dpi=180)

plt.figure(figsize=(7,5))
plt.scatter(pred,resid)
plt.axhline(0)
plt.xlabel("Predicted procrastination")
plt.ylabel("Residual")
plt.title("Regression Residual Check")
plt.tight_layout()
plt.savefig(HERE/"residual_plot.png",dpi=180)

print("\nSaved advanced_scatter.png and residual_plot.png")
print("\nBOUNDARY: synthetic data only; this demonstrates analysis competence, not participant research.")
