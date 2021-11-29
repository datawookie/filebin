spelling::spell_check_package()

devtools::check(cran = TRUE)

# Incoming feasibility checks for CRAN.
#
devtools::check(remote = TRUE)

# Check it on Windows.
#
devtools::check_win_devel()

rhub::check_for_cran()
