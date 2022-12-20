library(rmarkdown)
library(tidyverse)

#------------------------------------------------------------------------------
# mat236
rmarkdown::render("assets/src/1sem2023/mat236.Rmd",
                output_dir = "content/ensino/primeiro-semestre-de-2023/")

#------------------------------------------------------------------------------
# matc65
rmarkdown::render("assets/src/1sem2023/matc65.Rmd",
                output_dir = "content/ensino/primeiro-semestre-de-2023")
