## Homework

- [Summary Tabular Data](https://acmennaforests.github.io/ENVS543FALL2024/Homework10.01.24.html)
---
## "Summary Tabular Data Homework"

## Abstract
Specific climatic variables were selected from an Ameriflux (US-UMd) dataset from a disturbed forest in Upper Lower Michigan. Variables were chosen and utilized based on their direct effect on temporal stability of NEE. Variables were then filtered and tabulated utilizing the reframe() function. Functions from knitr library, kable() and kable_styling() were utilized to tabulate the three variables in an organized fashion. On an ecological note, after disturbance in 2008, NEE fell and then climbed back up 2010-2021.

## Introduction

FASET (Forest Accelerated Succession ExperimenT) is an ongoing long-term forest disturbance study at UMBS (University of Michigan Biological Station). Since May 2008, more than 3,700 birch and aspen were girdled in a single disturbance event over a three-week period to eventually change the composition of the forest. Many studies have been conducted from this experiment, and flux towers have been established on the control (US-UMB in 1999) and disturbed forests (US-UMd in 2007) of this specific part of the UMBS experimental forest in order to measure carbon fluxes. 

In this particular instance, I am interested in seeing the effect that climate as well as the disturbance itself has on the temporal stability of NEE (Net ecosystem exchange). A few climatic variables have been selected that would affect directly the overall stability of the forest with and without disturbance.

The purpose of this specific exercise was to tabulate the yearly NEE, Sunlight and Air temperature from the flux tower for the disturbed forest, so that it can be ready to be put into a time series, from which a CV (coefficient of variation) will be calculated. 

## Methods

1. Imported csv file for US-UMd and read it with the read.csv() function.

```{r}
file1 <-"docs/AMF_US-UMd_FLUXNET_FULLSET_YY_2007-2021_3-5.csv"
disturbed <- read.csv(file1)
```


2. Specified column numbers (interested in the following variables: NEE_CUT_REF, TA_F and PPFD_IN). Also any -9999.0 values were manually changed to NA. Tables were printed

```{r}
data1 <- disturbed[ c(56,15,104)]
summary(data1) 
print(data1)
```


3.Specified variables are put into a table by year utilizing the reframe() function.

```{r}
disturbed |>
  reframe(`Year` = TIMESTAMP, `Air Temperature (degrees C)`= TA_F  , `Sunlight (umolphoton/m^2/s)`= PPFD_IN, `Net Ecosystem Exchange (gC/m^2/yr)`= NEE_CUT_REF ) -> distable
distable
```


## Results
The table below represents Air temperature, Sunlight and NEE for the FASET forest at the University of Michigan Biological Station from 2007-2021. NA replaced -9999.0 values in the sunlight variable. kable() function and kable_styling() function were utilized to refine the data and represent it in a clean form. It is important to see that NEE abruptly decreases and then as the forest recovers from the disturbance, NEE goes back up.

```{r}
distable |>
  kable(digits = 1, caption ="Climate and Ecosystem Variables in Disturbed Forest") -> finaltable1
  finaltable1 |>
    kable_styling() -> distable2
  distable2
```
