# ard_categorical_ci(method='strat_wilson') works

    Code
      ard_categorical_ci_strat_wilson
    Message
      {cards} data frame: 7 x 9
    Output
        variable variable_level   context  stat_name stat_label      stat
      1      rsp           TRUE proporti…          N          N        80
      2      rsp           TRUE proporti…          n          n        50
      3      rsp           TRUE proporti…   estimate   estimate     0.625
      4      rsp           TRUE proporti…   conf.low   conf.low     0.487
      5      rsp           TRUE proporti…  conf.high  conf.high     0.719
      6      rsp           TRUE proporti… conf.level  conf.lev…      0.95
      7      rsp           TRUE proporti…     method     method Stratifi…
    Message
      i 3 more variables: fmt_fun, warning, error

---

    Code
      ard_categorical_ci_strat_wilsoncc
    Message
      {cards} data frame: 7 x 9
    Output
        variable variable_level   context  stat_name stat_label      stat
      1      rsp           TRUE proporti…          N          N        80
      2      rsp           TRUE proporti…          n          n        50
      3      rsp           TRUE proporti…   estimate   estimate     0.625
      4      rsp           TRUE proporti…   conf.low   conf.low     0.448
      5      rsp           TRUE proporti…  conf.high  conf.high     0.753
      6      rsp           TRUE proporti… conf.level  conf.lev…      0.95
      7      rsp           TRUE proporti…     method     method Stratifi…
    Message
      i 3 more variables: fmt_fun, warning, error

# ard_categorical_ci() messaging

    Code
      ard <- ard_categorical_ci(data = mtcars, variables = cyl, value = cyl ~ 10,
      method = "jeffreys")
    Condition
      Warning:
      A value of `value=10` for variable "cyl" was passed, but is not one of the observed levels: 4, 6, and 8.
      i This may be an error.
      i If value is a valid, convert variable to factor with all levels specified to avoid this message.

