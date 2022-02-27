library(rmarkdown)
library(tidyverse)

#------------------------------------------------------------------------------
# mat236
rmarkdown::render("assets/src/1sem2022/mat236.Rmd",
                output_dir = "content/ensino/primeiro-semestre-de-2022/")

#------------------------------------------------------------------------------
# matc65
rmarkdown::render("assets/src/1sem2022/matc65.Rmd",
                output_dir = "content/ensino/primeiro-semestre-de-2022/")
