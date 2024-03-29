test_that("ard_ttest() works", {
  expect_error(
    ard_ttest <-
      cards::ADSL |>
      dplyr::filter(ARM %in% c("Placebo", "Xanomeline High Dose")) |>
      ard_ttest(by = ARM, variable = AGE, var.equal = TRUE),
    NA
  )

  expect_equal(
    ard_ttest |>
      cards::get_ard_statistics(stat_name %in% c("estimate", "conf.low", "conf.high")),
    t.test(
      AGE ~ ARM,
      data = cards::ADSL |> dplyr::filter(ARM %in% c("Placebo", "Xanomeline High Dose")),
      var.equal = TRUE
    ) |>
      broom::tidy() |>
      dplyr::select(estimate, conf.low, conf.high) |>
      unclass(),
    ignore_attr = TRUE
  )

  # errors are properly handled
  expect_snapshot(
    cards::ADSL |>
      ard_ttest(by = ARM, variable = AGE, var.equal = TRUE) |>
      as.data.frame()
  )
})

test_that("ard_paired_ttest() works", {
  ADSL_paired <-
    cards::ADSL[c("ARM", "AGE")] |>
    dplyr::filter(ARM %in% c("Placebo", "Xanomeline High Dose")) |>
    dplyr::mutate(.by = ARM, USUBJID = dplyr::row_number())

  expect_error(
    ard_paired_ttest <-
      ADSL_paired |>
      ard_paired_ttest(by = ARM, variable = AGE, id = USUBJID, var.equal = TRUE),
    NA
  )

  expect_equal(
    ard_paired_ttest |>
      cards::get_ard_statistics(stat_name %in% c("estimate", "conf.low", "conf.high")),
    with(
      data =
        dplyr::full_join(
          ADSL_paired |> dplyr::filter(ARM %in% "Placebo") |> dplyr::rename(ARM1 = ARM, AGE1 = AGE),
          ADSL_paired |> dplyr::filter(ARM %in% "Xanomeline High Dose") |> dplyr::rename(ARM2 = ARM, AGE2 = AGE),
          by = "USUBJID"
        ),
      expr =
        t.test(
          x = AGE1,
          y = AGE2,
          paired = TRUE,
          var.equal = TRUE
        ) |>
          broom::tidy() |>
          dplyr::select(estimate, conf.low, conf.high) |>
          unclass()
    ),
    ignore_attr = TRUE
  )

  # errors are properly handled
  expect_snapshot(
    ADSL_paired |>
      dplyr::mutate(
        ARM = ifelse(dplyr::row_number() == 1L, "3rd ARM", ARM)
      ) |>
      ard_paired_ttest(by = ARM, variable = AGE, id = USUBJID, var.equal = TRUE) |>
      as.data.frame()
  )
})
