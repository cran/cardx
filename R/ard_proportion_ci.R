#' ARD Proportion Confidence Intervals
#'
#' `r lifecycle::badge('experimental')`\cr
#' Calculate confidence intervals for proportions.
#'
#' @inheritParams cards::ard_categorical
#' @param variables ([`tidy-select`][dplyr::dplyr_tidy_select])\cr
#'   columns to include in summaries. Columns must be class `<logical>`
#'   or `<numeric>` values coded as `c(0, 1)`.
#' @param by ([`tidy-select`][dplyr::dplyr_tidy_select])\cr
#'   columns to stratify calculations by
#' @param conf.level (`numeric`)\cr
#'   a scalar in `(0, 1)` indicating the confidence level.
#'   Default is `0.95`
#' @param method (`string`)\cr
#'   string indicating the type of confidence interval to calculate.
#'   Must be one of `r formals(ard_proportion_ci)[["method"]] |> eval() |> shQuote()`.
#'   See `?proportion_ci` for details.
#' @param strata,weights,max.iterations arguments passed to `proportion_ci_strat_wilson()`,
#'   when `method='strat_wilson'`
#'
#' @return an ARD data frame
#' @export
#'
#' @examples
#' ard_proportion_ci(mtcars, variables = c(vs, am), method = "wilson")
ard_proportion_ci <- function(data, variables, by = dplyr::group_vars(data),
                              conf.level = 0.95,
                              strata,
                              weights = NULL,
                              max.iterations = 10,
                              method = c(
                                "waldcc", "wald", "clopper-pearson",
                                "wilson", "wilsoncc",
                                "strat_wilson", "strat_wilsoncc",
                                "agresti-coull", "jeffreys"
                              )) {
  # process inputs -------------------------------------------------------------
  cards::process_selectors(data, variables = {{ variables }}, by = {{ by }})
  method <- arg_match(method)
  if (method %in% c("strat_wilson", "strat_wilsoncc")) {
    cards::process_selectors(data, strata = strata)
    check_scalar(strata)
  }

  # calculate confidence intervals ---------------------------------------------
  cards::ard_complex(
    data = data,
    variables = {{ variables }},
    by = {{ by }},
    statistic =
      ~ list(
        prop_ci =
          switch(method,
            "waldcc" = \(x, ...) proportion_ci_wald(x, conf.level = conf.level, correct = TRUE),
            "wald" = \(x, ...) proportion_ci_wald(x, conf.level = conf.level, correct = FALSE),
            "wilsoncc" = \(x, ...) proportion_ci_wilson(x, conf.level = conf.level, correct = TRUE),
            "wilson" = \(x, ...) proportion_ci_wilson(x, conf.level = conf.level, correct = FALSE),
            "clopper-pearson" = \(x, ...) proportion_ci_clopper_pearson(x, conf.level = conf.level),
            "agresti-coull" = \(x, ...) proportion_ci_agresti_coull(x, conf.level = conf.level),
            "jeffreys" = \(x, ...) proportion_ci_jeffreys(x, conf.level = conf.level),
            "strat_wilsoncc" = \(x, data, ...) {
              proportion_ci_strat_wilson(x,
                strata = data[[strata]], weights = weights,
                max.iterations = max.iterations,
                conf.level = conf.level, correct = TRUE
              )
            },
            "strat_wilson" = \(x, data, ...) {
              proportion_ci_strat_wilson(x,
                strata = data[[strata]], weights = weights,
                max.iterations = max.iterations,
                conf.level = conf.level, correct = FALSE
              )
            }
          )
      )
  ) |>
    dplyr::mutate(
      context = "proportion_ci"
    )
}
