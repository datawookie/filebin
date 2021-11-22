
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

    [1] '0.0.2'

Upload a file to randomly named bin on Filebin.

``` r
DESCRIPTION_PATH <- system.file("DESCRIPTION", package = "filebin")

description <- file_post(DESCRIPTION_PATH)
```

Take a look at the result.

``` r
description %>% select(url, filename, bin, md5)
```

    # A tibble: 1 × 4
      url                                              filename    bin     md5      
      <chr>                                            <chr>       <chr>   <chr>    
    1 https://filebin.net/jk7gurl9w1zbv6m4/DESCRIPTION DESCRIPTION jk7gur… N2VlOGE4…

Download a file using an URL.

``` r
file_get(description$url, file = "description.txt")
```

    [1] "Package: filebin\nType: Package\nTitle: Wrapper for the Filebin File Sharing API\nVersion: 0.0.2\nAuthors@R: \n    c(person(given = c(\"Andrew\", \"B.\"),\n             family = \"Collier\",\n             role = c(\"aut\", \"cre\", \"cph\"),\n             email = \"andrew@fathomdata.dev\"))\nDescription: A wrapper for the Filebin API. Filebin implements convenient file\n    sharing on the web.\nLicense: GPL-3\nLanguage: en-GB\nEncoding: UTF-8\nLazyData: true\nImports: dplyr, httr, janitor, logger, purrr, stringi, tibble, tidyr\nSuggests: testthat (>= 3.0.0), withr\nConfig/testthat/edition: 3\nRoxygenNote: 7.1.2\nAuthor: Andrew B. Collier [aut, cre, cph]\nMaintainer: Andrew B. Collier <andrew@fathomdata.dev>\nBuilt: R 4.1.2; ; 2021-11-21 09:13:07 UTC; unix\n"

Download a file using filename and bin.

``` r
file_get(
  description$filename,
  description$bin,
  file = "description.txt",
  overwrite = TRUE
)
```

    [1] "Package: filebin\nType: Package\nTitle: Wrapper for the Filebin File Sharing API\nVersion: 0.0.2\nAuthors@R: \n    c(person(given = c(\"Andrew\", \"B.\"),\n             family = \"Collier\",\n             role = c(\"aut\", \"cre\", \"cph\"),\n             email = \"andrew@fathomdata.dev\"))\nDescription: A wrapper for the Filebin API. Filebin implements convenient file\n    sharing on the web.\nLicense: GPL-3\nLanguage: en-GB\nEncoding: UTF-8\nLazyData: true\nImports: dplyr, httr, janitor, logger, purrr, stringi, tibble, tidyr\nSuggests: testthat (>= 3.0.0), withr\nConfig/testthat/edition: 3\nRoxygenNote: 7.1.2\nAuthor: Andrew B. Collier [aut, cre, cph]\nMaintainer: Andrew B. Collier <andrew@fathomdata.dev>\nBuilt: R 4.1.2; ; 2021-11-21 09:13:07 UTC; unix\n"

``` r
md5sum(c("DESCRIPTION", "description.txt"))
```

                           DESCRIPTION                    description.txt 
    "4135e20f96f59de2d3d3746f6cbea22d" "7ee8a88d978570d067610e5dd2bb319c" 

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
