# Create datapoints data

library(tidyverse)

# Import all datapoints files from gapminder into a list
datapoints_paths <- list.files(
  "data-raw/ddf--gapminder--systema_globalis/",
  pattern = "datapoints",
  full.names = TRUE
)
datapoints <- lapply(datapoints_paths, read_csv)

# Reduce list to a data frame
datapoints < reduce(datapoints, full_join, by = c("geo", "time"))

# Arrange
datapoints <- arrange(datapoints, geo, time)

# Save to R data file
usethis::use_data(datapoints, overwrite = TRUE, compress = "xz")
