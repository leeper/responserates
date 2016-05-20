# AAPOR Survey Response Rates #

**responserates** is a package for calculating survey response rates according to the [American Association for Public Opinion Research](http://www.aapor.org/) (AAPOR) [Standard Definitions](http://www.aapor.org/AAPOR_Main/media/publications/Standard-Definitions20169theditionfinal.pdf).

The main function of interest is `rates()`, which calculates all AAPOR standard response, refusal, cooperation, and contact rates based upon specified disposition codes. Disposition codes can be specified either as a vector of character codes (following AAPOR's standard acronyms):



```r
library("responserates")
rates(c(rep("I", 100), rep("NC", 20)))
```

```
## Response Rates
##  RR1:    83.3% 
##  RR2:    83.3% 
##  RR3:    83.3% 
##  RR4:    83.3% 
##  RR5:    83.3% 
##  RR6:    83.3% 
## Cooperation Rates
##  COOP1: 100.0% 
##  COOP2: 100.0% 
##  COOP3: 100.0% 
##  COOP4: 100.0% 
## Refusal Rates
##  REF1:    0.0% 
##  REF2:    0.0% 
##  REF3:    0.0% 
## Contact Rates
##  CON1:   83.3% 
##  CON2:   83.3% 
##  CON3:   83.3%
```

or as a table or list of totals (codes are not case-sensitive):


```r
rates(list(i = 100, nc = 20))
```

```
## Response Rates
##  RR1:    83.3% 
##  RR2:    83.3% 
##  RR3:    83.3% 
##  RR4:    83.3% 
##  RR5:    83.3% 
##  RR6:    83.3% 
## Cooperation Rates
##  COOP1: 100.0% 
##  COOP2: 100.0% 
##  COOP3: 100.0% 
##  COOP4: 100.0% 
## Refusal Rates
##  REF1:    0.0% 
##  REF2:    0.0% 
##  REF3:    0.0% 
## Contact Rates
##  CON1:   83.3% 
##  CON2:   83.3% 
##  CON3:   83.3%
```

Calculations are performed assuming equal probability of selection, but this can be modified by specifying a vector of codes and corresponding weights:


```r
set.seed(1)
rates(c(rep("I", 100), rep("NC", 20)), w = runif(120))
```

```
## Response Rates
##  RR1:    84.1% 
##  RR2:    84.1% 
##  RR3:    84.1% 
##  RR4:    84.1% 
##  RR5:    84.1% 
##  RR6:    84.1% 
## Cooperation Rates
##  COOP1: 100.0% 
##  COOP2: 100.0% 
##  COOP3: 100.0% 
##  COOP4: 100.0% 
## Refusal Rates
##  REF1:    0.0% 
##  REF2:    0.0% 
##  REF3:    0.0% 
## Contact Rates
##  CON1:   84.1% 
##  CON2:   84.1% 
##  CON3:   84.1%
```

If some cases have unknown eligibility, a default value for the proportion eligible (`e` in the Standard Definitions) is assumed to be 1. This can easily be changed if other values are appropriate:


```r
rates(list(i = 100, nc = 20, uo = 100, e = .25))
```

```
## Response Rates
##  RR1:    45.5% 
##  RR2:    45.5% 
##  RR3:    69.0% 
##  RR4:    69.0% 
##  RR5:    83.3% 
##  RR6:    83.3% 
## Cooperation Rates
##  COOP1: 100.0% 
##  COOP2: 100.0% 
##  COOP3: 100.0% 
##  COOP4: 100.0% 
## Refusal Rates
##  REF1:    0.0% 
##  REF2:    0.0% 
##  REF3:    0.0% 
## Contact Rates
##  CON1:   45.5% 
##  CON2:   69.0% 
##  CON3:   83.3%
```

The package also exposes functions for calculating each response rate (`rr1()`, `rr2()`, `ref1()`, etc.) based upon counts of disposition codes for a survey. These can be useful, for example, when one is only interested in a particular rate becuase the design is very simple (such as `rr1(i = 10, r = 5)`) or when handling complex survey designs. For instance, in a dual-frame survey, the overall response rate needs to average the response rate for each frame:


```r
# landline frame
(ll <- rr1(i = 100, r = 400, nc = 300))
```

```
## Response Rate (AAPOR_RR1):  12.5%
```

```r
# cellphone frame
(cp <- rr1(i = 150, r = 300, nc = 200))
```

```
## Response Rate (AAPOR_RR1):  23.1%
```

```r
# Pr(interviews from ll frame)
p <- 100/150

# overall response rate
(ll * p) + (cp * (1-p))
```

```
## Response Rate (AAPOR_RR1):  16.0%
```


## Installation ##

[![CRAN](http://www.r-pkg.org/badges/version/responserates)](http://cran.r-project.org/package=responserates)
[![Build Status](https://travis-ci.org/leeper/responserates.png?branch=master)](https://travis-ci.org/leeper/responserates)
[![codecov.io](http://codecov.io/github/leeper/responserates/coverage.svg?branch=master)](http://codecov.io/github/leeper/responserates?branch=master)

This package is not yet on CRAN. To install the latest development version from GitHub:

```R
if(!require("ghit")){
    install.packages("ghit")
}
ghit::install_github("leeper/responserates")
```

