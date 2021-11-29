# Updates the wordlist used by CRAN checks.

library(here)

WORDLIST <- here("inst", "WORDLIST")

words <- readLines(WORDLIST)

dir.create(".aspell", showWarnings = FALSE)

saveRDS(words, file = file.path(".aspell", "filebin.rds"), version = 2)
