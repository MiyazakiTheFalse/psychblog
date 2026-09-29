* Psychometrics competency demonstration.
* Synthetic data only. No real participants.

GET DATA
  /TYPE=TXT
  /FILE='synthetic_psychometrics.csv'
  /DELCASE=LINE
  /DELIMITERS=","
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /VARIABLES=
    id F3.0
    se1 TO se6 F1.0
    procrastination F5.1.
DATASET NAME Psychometrics.

VARIABLE LEVEL se1 TO se6 (ORDINAL).
VARIABLE LEVEL procrastination (SCALE).

FREQUENCIES VARIABLES=se1 TO se6
  /STATISTICS=MEAN STDDEV MINIMUM MAXIMUM.

RELIABILITY
  /VARIABLES=se1 se2 se3 se4 se5 se6
  /SCALE('Self-efficacy') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR.

COMPUTE self_efficacy_mean=MEAN.5(se1,se2,se3,se4,se5,se6).
VARIABLE LEVEL self_efficacy_mean (SCALE).
EXECUTE.

DESCRIPTIVES VARIABLES=self_efficacy_mean procrastination
  /STATISTICS=MEAN STDDEV MIN MAX.

GRAPH
  /SCATTERPLOT(BIVAR)=self_efficacy_mean WITH procrastination.

CORRELATIONS
  /VARIABLES=self_efficacy_mean procrastination
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

REGRESSION
  /DEPENDENT procrastination
  /METHOD=ENTER self_efficacy_mean
  /STATISTICS COEFF OUTS R ANOVA CI(95).

* Reliability does not establish construct validity.
* Synthetic association does not establish causality.
