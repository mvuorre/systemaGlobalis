# Create entities data

library(tidyverse)

entities_paths <- list.files(
  "data-raw/ddf--gapminder--systema_globalis/",
  pattern = "entities",
  full.names = TRUE
)
entities <- lapply(entities_paths, read_csv)

# Countries only
countries <- entities[[1]]
rm(entities)

# Save to R data file
usethis::use_data(countries, overwrite = TRUE, compress = "xz")
