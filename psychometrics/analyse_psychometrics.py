"""Synthetic psychometrics cross-check. No participant data."""
import pandas as pd

df = pd.read_csv("synthetic_psychometrics.csv")
items = [f"se{i}" for i in range(1, 7)]

def cronbach_alpha(frame):
    k = frame.shape[1]
    item_variances = frame.var(axis=0, ddof=1).sum()
    total_variance = frame.sum(axis=1).var(ddof=1)
    return (k / (k - 1)) * (1 - item_variances / total_variance)

df["self_efficacy_mean"] = df[items].mean(axis=1)

print(df[items + ["self_efficacy_mean", "procrastination"]].describe())
print("Cronbach alpha:", round(cronbach_alpha(df[items]), 3))
print("Correlation:", round(df["self_efficacy_mean"].corr(df["procrastination"]), 3))
