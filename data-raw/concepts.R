# Create concepts data

library(tidyverse)
concepts <- read_csv("data-raw/ddf--gapminder--systema_globalis/ddf--concepts.csv")

# Take measures only
concepts <- filter(concepts, concept_type=="measure")

# Remove columns
concepts <- select(
  concepts,
  -color,
  -concept_type,
  -description_long,
  -domain,
  -drill_up,
  -scales,
  -source,
  -source_long
)
concepts

# Save to R data file
usethis::use_data(concepts, overwrite = TRUE, compress = "xz")
