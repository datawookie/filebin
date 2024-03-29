% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bin-archive.R
\name{bin_archive}
\alias{bin_archive}
\title{Get contents of bin as archive}
\usage{
bin_archive(bin, format = "zip", file = NA)
}
\arguments{
\item{bin}{Bin name. If \code{NA} the generate random bin name.}

\item{format}{Archive format. Either \code{"zip"} (default) or \code{"tar"}.}

\item{file}{File name to use to save results.}
}
\value{
File name as character vector.
}
\description{
Get contents of bin as archive
}
\examples{
\dontrun{
bin_archive("placeholder", file = tempfile(fileext = ".zip"))
}
}
