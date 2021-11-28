
# {filebin} <img src="man/figures/filebin-hex.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/filebin)](https://cran.r-project.org/package=filebin)
![GitHub Actions build
status](https://github.com/datawookie/filebin/actions/workflows/build.yaml/badge.svg)
[![Codecov test
coverage](https://img.shields.io/codecov/c/github/datawookie/filebin.svg)](https://codecov.io/github/datawookie/filebin)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html)
<!-- badges: end -->

[Filebin](https://filebin.net/) allows you to quickly & easily share
files. Development of the software behind Filebin happens here:

-   <https://github.com/espebra/filebin2> (current) and
-   <https://github.com/espebra/filebin> (deprecated).

This is an R wrapper for the [Filebin API](https://filebin.net/api).

The documentation for `{filebin}` can be found
[here](https://datawookie.github.io/filebin/).

## Installation

Install the development version from GitHub as follows:

``` r
remotes::install_github("datawookie/filebin")
```

## Basic Usage

Load the package and check the versions.

``` r
library(filebin)

packageVersion("filebin")
```

    [1] '0.0.4'

Upload a file to randomly named bin on Filebin.

``` r
DESCRIPTION_PATH <- system.file("DESCRIPTION", package = "filebin")

description <- file_post(DESCRIPTION_PATH)
```

Take a look at the result.

``` r
description %>% select(url, filename, bin)
```

    # A tibble: 1 × 3
      url                                              filename    bin             
      <chr>                                            <chr>       <chr>           
<<<<<<< HEAD
    1 https://filebin.net/4kwd1cphb0fvklc6/DESCRIPTION DESCRIPTION 4kwd1cphb0fvklc6
=======
    1 https://filebin.net/u5e361taf9cbcyk5/DESCRIPTION DESCRIPTION u5e361taf9cbcyk5
>>>>>>> cc2dbe7... Bump version: 0.0.3 → 0.0.4

Download a file using an URL.

``` r
file_get(description$url, file = "description.txt")
```

Download a file using filename and bin.

``` r
file_get(
  description$filename,
  description$bin,
  file = "description.txt",
  overwrite = TRUE
)
```

Compare to original document.

``` r
md5sum(c(DESCRIPTION_PATH, "description.txt"))
```

    /home/wookie/.R/x86_64-pc-linux-gnu-library/4.1/filebin/DESCRIPTION 
                                     "a0fc0f4d94e738394e18e78f17dfb510" 
                                                        description.txt 
                                     "a0fc0f4d94e738394e18e78f17dfb510" 

The MD5 checksums are the same, as one would expect.

## API Endpoints

File endpoints:

-   [x] `GET /{bin}/{filename}`
-   [x] `DELETE /{bin}/{filename}`
-   [x] `POST /{bin}/{filename}`

Bin endpoints:

-   [x] `GET /{bin}`
-   [x] `PUT /{bin}`
-   [x] `DELETE /{bin}`
-   [x] `GET /qr/{bin}`
-   [x] `GET /archive/{bin}/tar`
-   [x] `GET /archive/{bin}/zip`
