
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

## Endpoints

File endpoints:

-   [x] `GET /{bin}/{filename}`
-   [x] `DELETE /{bin}/{filename}`
-   [x] `POST /{bin}/{filename}`

Bin endpoints:

-   [x] `GET /{bin}`
-   [x] `PUT /{bin}`
-   [x] `DELETE /{bin}`
-   [x] `GET /qr/{bin}`
-   [ ] `GET /archive/{bin}/tar`
-   [ ] `GET /archive/{bin}/zip`
