% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ard_effectsize_cohens_d.R
\name{ard_effectsize_cohens_d}
\alias{ard_effectsize_cohens_d}
\alias{ard_effectsize_paired_cohens_d}
\title{ARD Cohen's D Test}
\usage{
ard_effectsize_cohens_d(data, by, variables, conf.level = 0.95, ...)

ard_effectsize_paired_cohens_d(data, by, variables, id, conf.level = 0.95, ...)
}
\arguments{
\item{data}{(\code{data.frame})\cr
a data frame. See below for details.}

\item{by}{(\code{\link[dplyr:dplyr_tidy_select]{tidy-select}})\cr
column name to compare by. Must be a categorical variable with exactly two levels.}

\item{variables}{(\code{\link[dplyr:dplyr_tidy_select]{tidy-select}})\cr
column names to be compared. Must be a continuous variables.
Independent tests will be run for each variable.}

\item{conf.level}{(scalar \code{numeric})\cr
confidence level for confidence interval. Default is \code{0.95}.}

\item{...}{arguments passed to \code{effectsize::cohens_d(...)}}

\item{id}{(\code{\link[dplyr:dplyr_tidy_select]{tidy-select}})\cr
column name of the subject or participant ID}
}
\value{
ARD data frame
}
\description{
Analysis results data for paired and non-paired Cohen's D Effect Size Test
using \code{\link[effectsize:cohens_d]{effectsize::cohens_d()}}.
}
\details{
For the \code{ard_effectsize_cohens_d()} function, the data is expected to be one row per subject.
The data is passed as \code{effectsize::cohens_d(data[[variable]]~data[[by]], data, paired = FALSE, ...)}.

For the \code{ard_effectsize_paired_cohens_d()} function, the data is expected to be one row
per subject per by level. Before the effect size is calculated, the data are
reshaped to a wide format to be one row per subject.
The data are then passed as
\verb{effectsize::cohens_d(x = data_wide[[<by level 1>]], y = data_wide[[<by level 2>]], paired = TRUE, ...)}.
}
\examples{
\dontshow{if (do.call(asNamespace("cardx")$is_pkg_installed, list(pkg = c("effectsize", "parameters")))) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
cards::ADSL |>
  dplyr::filter(ARM \%in\% c("Placebo", "Xanomeline High Dose")) |>
  ard_effectsize_cohens_d(by = ARM, variables = AGE)

# constructing a paired data set,
# where patients receive both treatments
cards::ADSL[c("ARM", "AGE")] |>
  dplyr::filter(ARM \%in\% c("Placebo", "Xanomeline High Dose")) |>
  dplyr::mutate(.by = ARM, USUBJID = dplyr::row_number()) |>
  dplyr::arrange(USUBJID, ARM) |>
  dplyr::group_by(USUBJID) |>
  dplyr::filter(dplyr::n() > 1) |>
  ard_effectsize_paired_cohens_d(by = ARM, variables = AGE, id = USUBJID)
\dontshow{\}) # examplesIf}
}
