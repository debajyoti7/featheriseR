
[![Build Status](https://travis-ci.org/debajyoti7/featheriseR.svg?branch=master)](https://travis-ci.org/debajyoti7/featheriseR)

[![codecov.io](https://codecov.io/github/debajyoti7/featheriseR/coverage.svg?branch=master)](https://codecov.io/github/debajyoti7/featheriseR?branch=master)

# featheriseR

Simple wrapper for converting input files to feather format.

Currently supports csv, xls and xlsx inputs.


## Install

with `devtools`:

```S
devtools::install_github('debajyoti7/featheriseR')
```

## Use


This package has dedicated functions for different file types.
Just call the function as featheriseR_extension e.g. `featheriseR_csv` for csv files.

## Note

The data for examples is the `babynames` dataset. (Source: https://github.com/hadley/babynames/tree/master/data-raw )
