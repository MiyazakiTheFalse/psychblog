* QHO454 — EVENS descriptive analysis evidence template.
* Set the local EVENS .sav path before running.
* Select ONE permitted grouping variable for each analysis.
*
* MARKING CONTROL:
* Output is not sufficient by itself. Before finalising each analysis, confirm
* that the statistic is informative/appropriate/relevant/accurate, the display
* is appropriate and clearly labelled, missing values are handled correctly,
* and the written interpretation demonstrates insight without causal overclaim.

GET FILE='C:/PATH/TO/EVENS_2021.sav'.
DATASET NAME EVENS.

* ------------------------------------------------------------------.
* INITIAL VARIABLE INSPECTION.
* Verify variable labels, value labels, missing-value definitions and levels.
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
* Choose ONE: age OR religion OR health.
* ------------------------------------------------------------------.

* Example structure using religion. Replace only after inspecting the actual
* EVENS coding and confirming this is the chosen permitted comparison.
CROSSTABS
  /TABLES=religion BY willvacc
  /CELLS=COUNT ROW COLUMN
  /BARCHART.

* QUALITY CHECK:
* - Is a categorical summary appropriate to the actual coding?
* - Are percentages more informative than counts because group sizes differ?
* - Which cells/categories actually drive the substantive pattern?
* - Are missing values being excluded according to the file's definitions?

* ------------------------------------------------------------------.
* ANALYSIS 2.
* Outcome: wwb.total.NEW (CES-D8 total).
* Choose ONE: sex OR age OR health.
* ------------------------------------------------------------------.

* Example structure using sex.
MEANS TABLES=wwb.total.NEW BY sex
  /CELLS=COUNT MEAN STDDEV.

GRAPH
  /BOXPLOT=wwb.total.NEW BY sex.

* QUALITY CHECK:
* - Confirm CES-D8 scoring/measurement from the supplied dataset documentation.
* - Confirm mean/SD are suitable for the observed distribution and task.
* - Use only ONE final table OR figure in a submission-shaped artefact.
* - Explain the observed group pattern rather than simply listing values.

* ------------------------------------------------------------------.
* ANALYSIS 3.
* Outcome: polstop.
* Choose ONE: sex OR age OR ethnicity.
* ------------------------------------------------------------------.

* Example structure using ethnicity.
CROSSTABS
  /TABLES=ethnicity BY polstop
  /CELLS=COUNT ROW COLUMN
  /BARCHART.

* QUALITY CHECK:
* - Confirm actual value coding and missing codes.
* - Prefer percentage comparisons where unequal group sizes make raw counts
*   misleading.
* - Identify the meaningful pattern without implying causation.

* ------------------------------------------------------------------.
* FINAL PRESENTATION CONTROL.
* ------------------------------------------------------------------.
* For portfolio evidence capture, retain native SPSS views/screenshots.
*
* For a submission-shaped table/figure:
* - exactly one display per analysis;
* - mention it in prose before it appears;
* - use separate sequential Figure/Table numbering;
* - place number/title above display;
* - bold number, italic title;
* - remove unnecessary cumulative percentages / vertical table lines / clutter;
* - avoid redundant statistics tables if values are already in prose;
* - use clean copied/exported SPSS output rather than screenshot images.

* ------------------------------------------------------------------.
* INTERPRETATION BOUNDARY.
* ------------------------------------------------------------------.
* These are descriptive comparisons.
* Group differences in this observational survey do not by themselves
* establish causal effects.
