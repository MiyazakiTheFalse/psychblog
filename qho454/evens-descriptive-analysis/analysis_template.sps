* QHO454 — EVENS descriptive analysis evidence template.
* Set the local EVENS .sav path before running.
* This file provides a reproducible structure around the released variable requirements.

GET FILE='C:/PATH/TO/EVENS_2021.sav'.
DATASET NAME EVENS.

* ------------------------------------------------------------------.
* Initial variable inspection.
* ------------------------------------------------------------------.

DISPLAY DICTIONARY
  /VARIABLES=willvacc wwb.total.NEW polstop sex age religion health ethnicity.

FREQUENCIES VARIABLES=willvacc polstop sex religion health ethnicity
  /ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=wwb.total.NEW age
  /STATISTICS=MEAN STDDEV MIN MAX.

* ------------------------------------------------------------------.
* ANALYSIS 1.
* Outcome: willvacc.
* Choose ONE grouping variable: age OR religion OR health.
* ------------------------------------------------------------------.

* Example categorical comparison using religion.
CROSSTABS
  /TABLES=religion BY willvacc
  /CELLS=COUNT ROW COLUMN
  /BARCHART.

* If age is selected instead, inspect its distribution/measurement first and
* choose a grouping/display strategy justified by the data dictionary.

* ------------------------------------------------------------------.
* ANALYSIS 2.
* Outcome: wwb.total.NEW (CES-D8 total).
* Choose ONE grouping variable: sex OR age OR health.
* ------------------------------------------------------------------.

* Example grouped descriptive comparison using sex.
MEANS TABLES=wwb.total.NEW BY sex
  /CELLS=COUNT MEAN STDDEV.

GRAPH
  /BOXPLOT=wwb.total.NEW BY sex.

* ------------------------------------------------------------------.
* ANALYSIS 3.
* Outcome: polstop.
* Choose ONE grouping variable: sex OR age OR ethnicity.
* ------------------------------------------------------------------.

* Example categorical comparison using ethnicity.
CROSSTABS
  /TABLES=ethnicity BY polstop
  /CELLS=COUNT ROW COLUMN
  /BARCHART.

* ------------------------------------------------------------------.
* Interpretation boundary.
* ------------------------------------------------------------------.
* These are descriptive comparisons.
* Group differences in this observational survey do not by themselves
* establish causal effects.
