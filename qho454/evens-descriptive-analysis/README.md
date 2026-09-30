# EVENS Descriptive Analysis — QHO454 Evidence

## Purpose

This directory is structured around the released QHO454 Task 2 requirements using the EVENS 2021 variable names.

The task requires three descriptive analyses, each comparing one specified outcome across one permitted grouping variable.

## Required outcomes

### Analysis 1

`willvacc` — likelihood of having a coronavirus vaccine

Permitted grouping variables:

- `age`
- `religion`
- `health`

### Analysis 2

`wwb.total.NEW` — CES-D8 total score

Permitted grouping variables:

- `sex`
- `age`
- `health`

### Analysis 3

`polstop` — stopped by police since Covid

Permitted grouping variables:

- `sex`
- `age`
- `ethnicity`

## Workflow

1. Open the released EVENS `.sav` file in SPSS.
2. Inspect variable labels, value labels, missing-value coding and measurement level.
3. Choose one permitted grouping variable for each outcome.
4. Select descriptive statistics appropriate to the outcome and grouping variable.
5. Produce one appropriate table or graph per analysis.
6. Check that missing values are handled consistently with the dataset coding.
7. Summarise the observed similarities/differences without making causal claims.
8. Save SPSS syntax/output as evidence of the workflow.

## Evidence to capture

Useful portfolio evidence includes:

- Variable View showing the relevant variables and value labels.
- Data View with the EVENS file open.
- SPSS syntax used for each analysis.
- Output Viewer showing descriptive statistics.
- Output Viewer showing the table/graph.
- A short interpretation note explaining why that display/statistic is appropriate.

## Reproducibility

The accompanying `analysis_template.sps` provides a syntax-first structure. It deliberately requires the local EVENS file path and chosen grouping variables to be set before execution.
