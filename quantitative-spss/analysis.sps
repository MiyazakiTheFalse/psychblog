* SPSS syntax for the synthetic psychology-style dataset.
* Import synthetic_procrastination.csv before running these commands.

VARIABLE LEVEL self_efficacy procrastination study_hours employment_hours (SCALE).

FREQUENCIES VARIABLES=self_efficacy procrastination
  /STATISTICS=MEAN MEDIAN STDDEV MINIMUM MAXIMUM.

DESCRIPTIVES VARIABLES=self_efficacy procrastination study_hours employment_hours
  /STATISTICS=MEAN STDDEV MIN MAX.

GRAPH
  /SCATTERPLOT(BIVAR)=self_efficacy WITH procrastination.

CORRELATIONS
  /VARIABLES=self_efficacy procrastination
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

* Interpretation boundary:
* A correlation in this cross-sectional synthetic dataset is not evidence that
* changing self-efficacy would cause procrastination to change.
