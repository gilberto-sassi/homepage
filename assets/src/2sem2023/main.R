library(rmarkdown)
library(tidyverse)

#------------------------------------------------------------------------------
# mat223
rmarkdown::render("assets/src/2sem2023/mat223.Rmd",
                output_dir = "content/ensino/segundo-semestre-de-2023")

#------------------------------------------------------------------------------
# matd39
rmarkdown::render("assets/src/2sem2023/matd39.Rmd",
                output_dir = "content/ensino/segundo-semestre-de-2023")
