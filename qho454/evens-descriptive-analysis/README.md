# EVENS Descriptive Analysis — QHO454 Evidence

## Purpose

This directory targets the released QHO454 Task 2 requirements and the marking criteria used to judge descriptive statistics and displays.

The target is not merely to make SPSS produce output. Each analysis must show that the statistical choice, interpretation and presentation are appropriate.

## Required analyses

### Analysis 1

Outcome: `willvacc`

Choose one grouping variable:

- `age`
- `religion`
- `health`

### Analysis 2

Outcome: `wwb.total.NEW` — CES-D8 total

Choose one grouping variable:

- `sex`
- `age`
- `health`

### Analysis 3

Outcome: `polstop`

Choose one grouping variable:

- `sex`
- `age`
- `ethnicity`

## Marking-criteria workflow

For each analysis:

1. Inspect variable labels, value labels, declared missing values and measurement levels.
2. Use exactly one permitted grouping variable.
3. Select descriptive statistics appropriate to the variable types and comparison.
4. Do not report irrelevant statistics simply because SPSS generated them.
5. Produce exactly one appropriate table or graph.
6. Check whether unequal group sizes make raw-count displays misleading.
7. Check missing-value handling and denominator size.
8. Describe the substantive similarity/difference in the data.
9. Show insight rather than merely restating output values.
10. Do not make causal claims from descriptive group differences.

## Top-band quality gate

### Statistics

- [ ] informative;
- [ ] appropriate;
- [ ] relevant;
- [ ] accurate;
- [ ] correctly reported;
- [ ] interpreted with insight.

### Display

- [ ] appropriate for the comparison;
- [ ] accurate;
- [ ] clearly labelled;
- [ ] cleanly formatted;
- [ ] consistent with the supplied reporting conventions;
- [ ] free of unnecessary SPSS clutter.

### Missing data and group sizes

- [ ] dataset missing-value codes checked;
- [ ] participants not manually deleted simply for missing one variable;
- [ ] analysis denominators understood;
- [ ] percentages/normalised comparisons used where unequal group sizes would make counts misleading.

## Presentation controls for submission-shaped artefacts

- mention the table/figure before it appears;
- maintain separate sequential numbering for tables and figures;
- place number and concise title above the display;
- use bold number and italic title;
- avoid surrounding border boxes;
- remove unnecessary cumulative percentages;
- remove unnecessary vertical lines in copied SPSS tables;
- avoid redundant statistics tables when key values are already reported in prose;
- use clean copied/exported output rather than screenshot images.

## RPL evidence capture

Native screenshots remain useful to prove software operation:

- Variable View;
- Data View;
- Syntax Editor;
- Output Viewer statistics;
- Output Viewer graph/table.

Also retain:

- saved `.sps` syntax;
- saved SPSS output where possible;
- a short rationale explaining the statistic/display selection;
- a short interpretation note for each comparison.

## Reproducibility

The accompanying `analysis_template.sps` provides the syntax-first framework. It deliberately requires the actual EVENS file path and final grouping-variable choices before execution.
