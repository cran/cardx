# ard_survival_survfit() works with times provided

    Code
      print(dplyr::mutate(ard_survival_survfit(survival::survfit(survival::Surv(AVAL, CNSR) ~ TRTA, cards::ADTTE), times = c(60, 180)), stat = lapply(stat, function(x) ifelse(is.numeric(x), cards::round5(x, 3), x))), n = Inf)
    Message
      {cards} data frame: 32 x 11
    Output
         group1 group1_level                 variable variable_level  stat_name stat_label  stat
      1    TRTA      Placebo                     time             60     n.risk  Number o…    59
      2    TRTA      Placebo                     time             60   estimate  Survival… 0.893
      3    TRTA      Placebo                     time             60  std.error  Standard… 0.036
      4    TRTA      Placebo                     time             60  conf.high  CI Upper… 0.966
      5    TRTA      Placebo                     time             60   conf.low  CI Lower… 0.825
      6    TRTA      Placebo                     time            180     n.risk  Number o…    35
      7    TRTA      Placebo                     time            180   estimate  Survival… 0.651
      8    TRTA      Placebo                     time            180  std.error  Standard… 0.061
      9    TRTA      Placebo                     time            180  conf.high  CI Upper… 0.783
      10   TRTA      Placebo                     time            180   conf.low  CI Lower… 0.541
      11   TRTA    Xanomeli…                     time             60     n.risk  Number o…    14
      12   TRTA    Xanomeli…                     time             60   estimate  Survival… 0.694
      13   TRTA    Xanomeli…                     time             60  std.error  Standard… 0.071
      14   TRTA    Xanomeli…                     time             60  conf.high  CI Upper… 0.849
      15   TRTA    Xanomeli…                     time             60   conf.low  CI Lower… 0.568
      16   TRTA    Xanomeli…                     time            180     n.risk  Number o…     3
      17   TRTA    Xanomeli…                     time            180   estimate  Survival… 0.262
      18   TRTA    Xanomeli…                     time            180  std.error  Standard…  0.14
      19   TRTA    Xanomeli…                     time            180  conf.high  CI Upper… 0.749
      20   TRTA    Xanomeli…                     time            180   conf.low  CI Lower… 0.092
      21   TRTA    Xanomeli…                     time             60     n.risk  Number o…    20
      22   TRTA    Xanomeli…                     time             60   estimate  Survival… 0.732
      23   TRTA    Xanomeli…                     time             60  std.error  Standard… 0.068
      24   TRTA    Xanomeli…                     time             60  conf.high  CI Upper… 0.878
      25   TRTA    Xanomeli…                     time             60   conf.low  CI Lower…  0.61
      26   TRTA    Xanomeli…                     time            180     n.risk  Number o…     5
      27   TRTA    Xanomeli…                     time            180   estimate  Survival… 0.381
      28   TRTA    Xanomeli…                     time            180  std.error  Standard…  0.13
      29   TRTA    Xanomeli…                     time            180  conf.high  CI Upper… 0.743
      30   TRTA    Xanomeli…                     time            180   conf.low  CI Lower… 0.195
      31   <NA>           NA ..ard_survival_survfit..                conf.level  CI Confi…  0.95
      32   <NA>           NA ..ard_survival_survfit..                 conf.type    CI Type   log
    Message
      i 4 more variables: context, fmt_fun, warning, error

# ard_survival_survfit() works with different type

    Code
      print(dplyr::mutate(ard_survival_survfit(survival::survfit(survival::Surv(AVAL, CNSR) ~ TRTA, cards::ADTTE), times = c(60, 180), type = "risk"), stat = lapply(stat, function(x) ifelse(is.numeric(x), cards::round5(x, 3), x))), n = Inf)
    Message
      {cards} data frame: 32 x 11
    Output
         group1 group1_level                 variable variable_level  stat_name stat_label  stat
      1    TRTA      Placebo                     time             60     n.risk  Number o…    59
      2    TRTA      Placebo                     time             60   estimate  Survival… 0.107
      3    TRTA      Placebo                     time             60  std.error  Standard… 0.036
      4    TRTA      Placebo                     time             60  conf.high  CI Upper… 0.175
      5    TRTA      Placebo                     time             60   conf.low  CI Lower… 0.034
      6    TRTA      Placebo                     time            180     n.risk  Number o…    35
      7    TRTA      Placebo                     time            180   estimate  Survival… 0.349
      8    TRTA      Placebo                     time            180  std.error  Standard… 0.061
      9    TRTA      Placebo                     time            180  conf.high  CI Upper… 0.459
      10   TRTA      Placebo                     time            180   conf.low  CI Lower… 0.217
      11   TRTA    Xanomeli…                     time             60     n.risk  Number o…    14
      12   TRTA    Xanomeli…                     time             60   estimate  Survival… 0.306
      13   TRTA    Xanomeli…                     time             60  std.error  Standard… 0.071
      14   TRTA    Xanomeli…                     time             60  conf.high  CI Upper… 0.432
      15   TRTA    Xanomeli…                     time             60   conf.low  CI Lower… 0.151
      16   TRTA    Xanomeli…                     time            180     n.risk  Number o…     3
      17   TRTA    Xanomeli…                     time            180   estimate  Survival… 0.738
      18   TRTA    Xanomeli…                     time            180  std.error  Standard…  0.14
      19   TRTA    Xanomeli…                     time            180  conf.high  CI Upper… 0.908
      20   TRTA    Xanomeli…                     time            180   conf.low  CI Lower… 0.251
      21   TRTA    Xanomeli…                     time             60     n.risk  Number o…    20
      22   TRTA    Xanomeli…                     time             60   estimate  Survival… 0.268
      23   TRTA    Xanomeli…                     time             60  std.error  Standard… 0.068
      24   TRTA    Xanomeli…                     time             60  conf.high  CI Upper…  0.39
      25   TRTA    Xanomeli…                     time             60   conf.low  CI Lower… 0.122
      26   TRTA    Xanomeli…                     time            180     n.risk  Number o…     5
      27   TRTA    Xanomeli…                     time            180   estimate  Survival… 0.619
      28   TRTA    Xanomeli…                     time            180  std.error  Standard…  0.13
      29   TRTA    Xanomeli…                     time            180  conf.high  CI Upper… 0.805
      30   TRTA    Xanomeli…                     time            180   conf.low  CI Lower… 0.257
      31   <NA>           NA ..ard_survival_survfit..                conf.level  CI Confi…  0.95
      32   <NA>           NA ..ard_survival_survfit..                 conf.type    CI Type   log
    Message
      i 4 more variables: context, fmt_fun, warning, error

# ard_survival_survfit() works with probs provided

    Code
      print(dplyr::mutate(ard_survival_survfit(survival::survfit(survival::Surv(AVAL, CNSR) ~ TRTA, cards::ADTTE), probs = c(0.25, 0.75)), stat = lapply(stat, function(x) ifelse(is.numeric(x), cards::round5(x, 3), x))), n = Inf)
    Message
      {cards} data frame: 20 x 11
    Output
         group1 group1_level                 variable variable_level  stat_name stat_label stat
      1    TRTA      Placebo                     prob           0.25   estimate  Survival…  142
      2    TRTA      Placebo                     prob           0.25  conf.high  CI Upper…  181
      3    TRTA      Placebo                     prob           0.25   conf.low  CI Lower…   70
      4    TRTA      Placebo                     prob           0.75   estimate  Survival…  184
      5    TRTA      Placebo                     prob           0.75  conf.high  CI Upper…  191
      6    TRTA      Placebo                     prob           0.75   conf.low  CI Lower…  183
      7    TRTA    Xanomeli…                     prob           0.25   estimate  Survival…   44
      8    TRTA    Xanomeli…                     prob           0.25  conf.high  CI Upper…  180
      9    TRTA    Xanomeli…                     prob           0.25   conf.low  CI Lower…   22
      10   TRTA    Xanomeli…                     prob           0.75   estimate  Survival…  188
      11   TRTA    Xanomeli…                     prob           0.75  conf.high  CI Upper…   NA
      12   TRTA    Xanomeli…                     prob           0.75   conf.low  CI Lower…  167
      13   TRTA    Xanomeli…                     prob           0.25   estimate  Survival…   49
      14   TRTA    Xanomeli…                     prob           0.25  conf.high  CI Upper…  180
      15   TRTA    Xanomeli…                     prob           0.25   conf.low  CI Lower…   37
      16   TRTA    Xanomeli…                     prob           0.75   estimate  Survival…  184
      17   TRTA    Xanomeli…                     prob           0.75  conf.high  CI Upper…   NA
      18   TRTA    Xanomeli…                     prob           0.75   conf.low  CI Lower…  180
      19   <NA>           NA ..ard_survival_survfit..                conf.level  CI Confi… 0.95
      20   <NA>           NA ..ard_survival_survfit..                 conf.type    CI Type  log
    Message
      i 4 more variables: context, fmt_fun, warning, error

# ard_survival_survfit() works with unstratified model

    Code
      print(dplyr::mutate(ard_survival_survfit(survival::survfit(survival::Surv(time, status) ~ 1, data = survival::lung), times = c(60, 180)), stat = lapply(stat, function(x) ifelse(is.numeric(x), cards::round5(x, 3), x))), n = Inf)
    Message
      {cards} data frame: 12 x 9
    Output
                         variable variable_level  context  stat_name stat_label  stat
      1                      time             60 survival     n.risk  Number o…   213
      2                      time             60 survival   estimate  Survival… 0.925
      3                      time             60 survival  std.error  Standard… 0.017
      4                      time             60 survival  conf.high  CI Upper…  0.96
      5                      time             60 survival   conf.low  CI Lower… 0.892
      6                      time            180 survival     n.risk  Number o…   160
      7                      time            180 survival   estimate  Survival… 0.722
      8                      time            180 survival  std.error  Standard…  0.03
      9                      time            180 survival  conf.high  CI Upper… 0.783
      10                     time            180 survival   conf.low  CI Lower… 0.666
      11 ..ard_survival_survfit..                survival conf.level  CI Confi…  0.95
      12 ..ard_survival_survfit..                survival  conf.type    CI Type   log
    Message
      i 3 more variables: fmt_fun, warning, error

---

    Code
      print(dplyr::mutate(ard_survival_survfit(survival::survfit(survival::Surv(time, status) ~ 1, data = survival::lung), probs = c(0.5, 0.75)), stat = lapply(stat, function(x) ifelse(is.numeric(x), cards::round5(x, 3), x))), n = Inf)
    Message
      {cards} data frame: 8 x 9
    Output
                        variable variable_level   context  stat_name stat_label stat
      1                     prob            0.5 survival…   estimate  Survival…  310
      2                     prob            0.5 survival…  conf.high  CI Upper…  363
      3                     prob            0.5 survival…   conf.low  CI Lower…  285
      4                     prob           0.75 survival…   estimate  Survival…  550
      5                     prob           0.75 survival…  conf.high  CI Upper…  654
      6                     prob           0.75 survival…   conf.low  CI Lower…  460
      7 ..ard_survival_survfit..                 survival conf.level  CI Confi… 0.95
      8 ..ard_survival_survfit..                 survival  conf.type    CI Type  log
    Message
      i 3 more variables: fmt_fun, warning, error

# ard_survival_survfit() works with multiple stratification variables

    Code
      print(head(dplyr::select(dplyr::mutate(ard_survival_survfit(survival::survfit(survival::Surv(time, status) ~ sex + ph.ecog, data = survival::lung), times = c(60, 180)), stat = lapply(stat, function(x) ifelse(is.numeric(x), cards::round5(x, 3), x))),
      "group1", "group1_level", "group2", "group2_level"), 20), n = Inf)
    Message
      {cards} data frame: 20 x 4
    Output
         group1 group1_level  group2 group2_level
      1     sex            1 ph.ecog            0
      2     sex            1 ph.ecog            0
      3     sex            1 ph.ecog            0
      4     sex            1 ph.ecog            0
      5     sex            1 ph.ecog            0
      6     sex            1 ph.ecog            0
      7     sex            1 ph.ecog            0
      8     sex            1 ph.ecog            0
      9     sex            1 ph.ecog            0
      10    sex            1 ph.ecog            0
      11    sex            1 ph.ecog            1
      12    sex            1 ph.ecog            1
      13    sex            1 ph.ecog            1
      14    sex            1 ph.ecog            1
      15    sex            1 ph.ecog            1
      16    sex            1 ph.ecog            1
      17    sex            1 ph.ecog            1
      18    sex            1 ph.ecog            1
      19    sex            1 ph.ecog            1
      20    sex            1 ph.ecog            1

---

    Code
      print(head(dplyr::select(dplyr::mutate(ard_survival_survfit(survival::survfit(survival::Surv(time, status) ~ sex + ph.ecog, data = survival::lung), probs = c(0.5, 0.75)), stat = lapply(stat, function(x) ifelse(is.numeric(x), cards::round5(x, 3), x))),
      "group1", "group1_level", "group2", "group2_level"), 20), n = Inf)
    Message
      {cards} data frame: 20 x 4
    Output
         group1 group1_level  group2 group2_level
      1     sex            1 ph.ecog            0
      2     sex            1 ph.ecog            0
      3     sex            1 ph.ecog            0
      4     sex            1 ph.ecog            0
      5     sex            1 ph.ecog            0
      6     sex            1 ph.ecog            0
      7     sex            1 ph.ecog            1
      8     sex            1 ph.ecog            1
      9     sex            1 ph.ecog            1
      10    sex            1 ph.ecog            1
      11    sex            1 ph.ecog            1
      12    sex            1 ph.ecog            1
      13    sex            1 ph.ecog            2
      14    sex            1 ph.ecog            2
      15    sex            1 ph.ecog            2
      16    sex            1 ph.ecog            2
      17    sex            1 ph.ecog            2
      18    sex            1 ph.ecog            2
      19    sex            1 ph.ecog            3
      20    sex            1 ph.ecog            3

# ard_survival_survfit() works with competing risks

    Code
      print(dplyr::mutate(survival::survfit(survival::Surv(AVAL, CNSR) ~ TRTA, data = ADTTE_MS) %>% ard_survival_survfit(times = c(60, 180)), stat = lapply(stat, function(x) ifelse(is.numeric(x), cards::round5(x, 3), x))), n = Inf)
    Message
      Multi-state model detected. Showing probabilities into state 'death from cancer'.
      {cards} data frame: 32 x 11
    Output
         group1 group1_level                 variable variable_level  stat_name stat_label  stat
      1    TRTA      Placebo                     time             60     n.risk  Number o…    59
      2    TRTA      Placebo                     time             60   estimate  Survival… 0.054
      3    TRTA      Placebo                     time             60  std.error  Standard… 0.026
      4    TRTA      Placebo                     time             60  conf.high  CI Upper…  0.14
      5    TRTA      Placebo                     time             60   conf.low  CI Lower… 0.021
      6    TRTA      Placebo                     time            180     n.risk  Number o…    35
      7    TRTA      Placebo                     time            180   estimate  Survival… 0.226
      8    TRTA      Placebo                     time            180  std.error  Standard… 0.054
      9    TRTA      Placebo                     time            180  conf.high  CI Upper… 0.361
      10   TRTA      Placebo                     time            180   conf.low  CI Lower… 0.142
      11   TRTA    Xanomeli…                     time             60     n.risk  Number o…    14
      12   TRTA    Xanomeli…                     time             60   estimate  Survival… 0.137
      13   TRTA    Xanomeli…                     time             60  std.error  Standard… 0.057
      14   TRTA    Xanomeli…                     time             60  conf.high  CI Upper… 0.311
      15   TRTA    Xanomeli…                     time             60   conf.low  CI Lower…  0.06
      16   TRTA    Xanomeli…                     time            180     n.risk  Number o…     3
      17   TRTA    Xanomeli…                     time            180   estimate  Survival…  0.51
      18   TRTA    Xanomeli…                     time            180  std.error  Standard… 0.145
      19   TRTA    Xanomeli…                     time            180  conf.high  CI Upper… 0.892
      20   TRTA    Xanomeli…                     time            180   conf.low  CI Lower… 0.292
      21   TRTA    Xanomeli…                     time             60     n.risk  Number o…    20
      22   TRTA    Xanomeli…                     time             60   estimate  Survival… 0.162
      23   TRTA    Xanomeli…                     time             60  std.error  Standard… 0.059
      24   TRTA    Xanomeli…                     time             60  conf.high  CI Upper…  0.33
      25   TRTA    Xanomeli…                     time             60   conf.low  CI Lower…  0.08
      26   TRTA    Xanomeli…                     time            180     n.risk  Number o…     5
      27   TRTA    Xanomeli…                     time            180   estimate  Survival… 0.244
      28   TRTA    Xanomeli…                     time            180  std.error  Standard… 0.093
      29   TRTA    Xanomeli…                     time            180  conf.high  CI Upper… 0.516
      30   TRTA    Xanomeli…                     time            180   conf.low  CI Lower… 0.115
      31   <NA>           NA ..ard_survival_survfit..                conf.level  CI Confi…  0.95
      32   <NA>           NA ..ard_survival_survfit..                 conf.type    CI Type   log
    Message
      i 4 more variables: context, fmt_fun, warning, error

---

    Code
      survival::survfit(survival::Surv(AVAL, CNSR) ~ TRTA, data = ADTTE_MS) %>% ard_survival_survfit(times = c(60, 180), type = "risk")
    Condition
      Error in `ard_survival_survfit()`:
      ! Cannot use `type` argument with `survfit` models with class <survfitms/survfitcoxms>.

# ard_survival_survfit() errors are properly handled

    Code
      ard_survival_survfit(x, times = 25)
    Condition
      Error in `ard_survival_survfit()`:
      ! The call in the survfit object `x` must be an evaluated formula. Please see `ard_survival_survfit()` (`?cardx::ard_survival_survfit()`) documentation for details on properly specifying formulas.

---

    Code
      ard_survival_survfit(times = 25)
    Condition
      Error in `ard_survival_survfit()`:
      ! The `x` argument cannot be missing.

---

    Code
      ard_survival_survfit("not_survfit")
    Condition
      Error in `UseMethod()`:
      ! no applicable method for 'ard_survival_survfit' applied to an object of class "character"

---

    Code
      ard_survival_survfit(survival::survfit(survival::Surv(AVAL, CNSR) ~ TRTA,
      cards::ADTTE), times = 100, type = "notatype")
    Condition
      Error in `ard_survival_survfit()`:
      ! `type` must be one of "survival", "risk", or "cumhaz", not "notatype".

---

    Code
      ard_survival_survfit(survival::survfit(survival::Surv(AVAL, CNSR) ~ TRTA,
      cards::ADTTE), probs = c(0.25, 0.75), type = "risk")
    Condition
      Error in `ard_survival_survfit()`:
      ! Cannot use `type` argument when `probs` argument specifed.

---

    Code
      ard_survival_survfit(survival::survfit(survival::Surv(AVAL, CNSR) ~ TRTA,
      cards::ADTTE), times = 100, probs = c(0.25, 0.75))
    Condition
      Error in `ard_survival_survfit()`:
      ! One and only one of `times` and `probs` must be specified.

---

    Code
      ard_survival_survfit(x = cards::ADTTE, formula = survival::Surv(ttdeath, death) ~
        trt, variables = "trt", probs = c(0.25, 0.5, 0.75))
    Condition
      Error in `ard_survival_survfit()`:
      ! The `y` argument cannot be missing.

---

    Code
      ard_survival_survfit(x = cards::ADTTE, y = survival::Surv(ttdeath, death) ~ tte,
      probs = c(0.25, 0.5, 0.75))
    Condition
      Error in `ard_survival_survfit()`:
      ! The `y` argument must be a string or expression that evaluates to an object of class <Surv> most often created with `survival::Surv()` or `ggsurvfit::Surv_CNSR()`.

# ard_survival_survfit() errors with stratified Cox model

    Code
      ard_survival_survfit(survfit(coxph(Surv(time, status) ~ age + strata(sex),
      survival::lung)))
    Condition
      Error in `ard_survival_survfit()`:
      ! Argument `x` cannot be class <survfitcox>.

# ard_survival_survfit() works with '=' in strata variable level labels

    Code
      ard_survival_survfit(survival::survfit(survival::Surv(time, status) ~ age_bin, data = lung2), times = 100)
    Message
      {cards} data frame: 12 x 11
    Output
          group1 group1_level                 variable variable_level  stat_name stat_label  stat
      1  age_bin          <60                     time            100     n.risk  Number o…    77
      2  age_bin          <60                     time            100   estimate  Survival… 0.928
      3  age_bin          <60                     time            100  std.error  Standard… 0.028
      4  age_bin          <60                     time            100  conf.high  CI Upper… 0.985
      5  age_bin          <60                     time            100   conf.low  CI Lower… 0.874
      6  age_bin         >=60                     time            100     n.risk  Number o…   119
      7  age_bin         >=60                     time            100   estimate  Survival… 0.827
      8  age_bin         >=60                     time            100  std.error  Standard… 0.031
      9  age_bin         >=60                     time            100  conf.high  CI Upper… 0.891
      10 age_bin         >=60                     time            100   conf.low  CI Lower… 0.768
      11    <NA>           NA ..ard_survival_survfit..                conf.level  CI Confi…  0.95
      12    <NA>           NA ..ard_survival_survfit..                 conf.type    CI Type   log
    Message
      i 4 more variables: context, fmt_fun, warning, error

# ard_survival_survfit() extends to times outside range

    Code
      print(ard_survival_survfit(survival::survfit(survival::Surv(AVAL, CNSR) ~ TRTA, cards::ADTTE), times = 200), n = Inf)
    Message
      {cards} data frame: 17 x 11
    Output
         group1 group1_level                 variable variable_level  stat_name stat_label stat
      1    TRTA      Placebo                     time            200     n.risk  Number o…    0
      2    TRTA      Placebo                     time            200   estimate  Survival…    0
      3    TRTA      Placebo                     time            200  std.error  Standard…  NaN
      4    TRTA      Placebo                     time            200  conf.high  CI Upper…   NA
      5    TRTA      Placebo                     time            200   conf.low  CI Lower…   NA
      6    TRTA    Xanomeli…                     time            200     n.risk  Number o…    0
      7    TRTA    Xanomeli…                     time            200   estimate  Survival…    0
      8    TRTA    Xanomeli…                     time            200  std.error  Standard…  NaN
      9    TRTA    Xanomeli…                     time            200  conf.high  CI Upper…   NA
      10   TRTA    Xanomeli…                     time            200   conf.low  CI Lower…   NA
      11   TRTA    Xanomeli…                     time            200     n.risk  Number o…    0
      12   TRTA    Xanomeli…                     time            200   estimate  Survival…    0
      13   TRTA    Xanomeli…                     time            200  std.error  Standard…  NaN
      14   TRTA    Xanomeli…                     time            200  conf.high  CI Upper…   NA
      15   TRTA    Xanomeli…                     time            200   conf.low  CI Lower…   NA
      16   <NA>           NA ..ard_survival_survfit..                conf.level  CI Confi… 0.95
      17   <NA>           NA ..ard_survival_survfit..                 conf.type    CI Type  log
    Message
      i 4 more variables: context, fmt_fun, warning, error

# ard_survival_survfit.data.frame() works as expected

    Code
      res_quo <- print(dplyr::mutate(ard_survival_survfit(x = mtcars, y = "survival::Surv(mpg, am)", variables = "vs", times = 20, method.args = list(start.time = 0, id = cyl)), stat = lapply(stat, function(x) ifelse(is.numeric(x), cards::round5(x, 3), x))),
      n = Inf)
    Message
      {cards} data frame: 12 x 11
    Output
         group1 group1_level                 variable variable_level  stat_name stat_label  stat
      1      vs            0                     time             20     n.risk  Number o…     3
      2      vs            0                     time             20   estimate  Survival… 0.615
      3      vs            0                     time             20  std.error  Standard… 0.082
      4      vs            0                     time             20  conf.high  CI Upper…   0.8
      5      vs            0                     time             20   conf.low  CI Lower… 0.474
      6      vs            1                     time             20     n.risk  Number o…    11
      7      vs            1                     time             20   estimate  Survival…     1
      8      vs            1                     time             20  std.error  Standard…     0
      9      vs            1                     time             20  conf.high  CI Upper…     1
      10     vs            1                     time             20   conf.low  CI Lower…     1
      11   <NA>           NA ..ard_survival_survfit..                conf.level  CI Confi…  0.95
      12   <NA>           NA ..ard_survival_survfit..                 conf.type    CI Type   log
    Message
      i 4 more variables: context, fmt_fun, warning, error

