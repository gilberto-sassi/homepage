if (!require(pacman)) {
    install.packages("pacman")
    library(pacman)
}

p_load(glue, quarto)
p_load(tidyverse)

renderizar <- function(input, output_dir) {
    quarto_render(input)
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
# mat020
renderizar("assets/src/2sem2025/mat236.qmd",
       "content/ensino/segundo-semestre-de-2025/")

#------------------------------------------------------------------------------
# mat022
renderizar("assets/src/2sem2025/mata44.qmd",
       "content/ensino/segundo-semestre-de-2025/")
