* Advanced SPSS syntax demonstration for synthetic psychology data.
* This mirrors the reproducible Python workflow and is not participant research.

GET DATA
  /TYPE=TXT
  /FILE='synthetic_procrastination.csv'
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /VARIABLES=
    participant_id A4
    self_efficacy F8.2
    procrastination F8.2
    study_hours F8.2
    employment_hours F8.2.
EXECUTE.

VARIABLE LEVEL self_efficacy procrastination study_hours employment_hours (SCALE).

FREQUENCIES VARIABLES=self_efficacy procrastination study_hours employment_hours
  /STATISTICS=MEAN MEDIAN STDDEV MINIMUM MAXIMUM.

EXAMINE VARIABLES=self_efficacy procrastination
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /STATISTICS DESCRIPTIVES
  /MISSING LISTWISE.

CORRELATIONS
  /VARIABLES=self_efficacy procrastination
  /PRINT=TWOTAIL
  /MISSING=PAIRWISE.

* Median-split t-test is included only to demonstrate mechanics.
RANK VARIABLES=self_efficacy (A)
  /NTILES(2)
  /PRINT=NO
  /TIES=MEAN
  /RFRACTION.
T-TEST GROUPS=NSELF_EF(1 2)
  /VARIABLES=procrastination
  /CRITERIA=CI(.95).

REGRESSION
  /DEPENDENT procrastination
  /METHOD=ENTER self_efficacy study_hours employment_hours
  /STATISTICS COEFF OUTS R ANOVA CI(95)
  /RESIDUALS HISTOGRAM(ZRESID) NORMPROB(ZRESID)
  /SAVE PRED RESID.

* Reliability example requires item-level variables.
* RELIABILITY
*   /VARIABLES=selfeff_item1 selfeff_item2 selfeff_item3
*   /SCALE('Self-efficacy synthetic items') ALL
*   /MODEL=ALPHA.

* Interpretation boundary:
* software output must be interpreted in light of measurement,
* research design, assumptions, uncertainty and causal limits.
