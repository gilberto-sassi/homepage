library(quarto)
library(tidyverse)

renderizar <- function(input, output_dir) {
    quarto::quarto_render(input)
    name <- str_replace(input, ".qmd", "") |>
        str_split_1("/") |>
        last()
    dir_input <- str_replace(input, paste0(name, ".qmd"), "")
    file.remove(paste0(output_dir, name, ".html"))
    file.copy(
        from = paste0(dir_input, name, ".html"),
        to = paste0(output_dir, name, ".html")
    )
    file.remove(paste0(dir_input, name, ".html"))
}

#------------------------------------------------------------------------------
# mat223
renderizar("assets/src/2sem2023/mat223.qmd", "content/ensino/segundo-semestre-de-2023/")

#------------------------------------------------------------------------------
# matd39
renderizar("assets/src/2sem2023/matd39.qmd",
               "content/ensino/segundo-semestre-de-2023/")
