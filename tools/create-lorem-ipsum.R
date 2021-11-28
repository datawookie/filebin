for (filename in c("lorem-ipsum.txt", "more-lorem-ipsum.txt")) {
  filename <- here::here("inst", filename)
  if (!file.exists(filename)) {
    message("Creating ", basename(filename), ".")
    cat(stringi::stri_rand_lipsum(12), sep = "\n\n", file = filename)
  }
}
