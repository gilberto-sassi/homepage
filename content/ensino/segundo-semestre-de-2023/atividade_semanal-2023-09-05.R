library(pacman)

p_load(
  readxl, writexl, janitor, ggthemes, tidyverse
)


# exercício 1 -------------------------------------------------------------

dados_exe1 <- read_excel("dados/brutos/dados_exe1.xlsx")

dados_exe1 <- dados_exe1 |> 
  mutate(intervalo = cut(
    x,
    breaks = seq(from = 0, to = 1000, by = 100),
    include.lowest = TRUE,
    right = FALSE
  ))
tabela <- tabyl(dados_exe1, intervalo)
write_xlsx(tabela, "output/tabela_exe1.xlsx")


# exercício 2 -------------------------------------------------------------

tam <- 100
frequencia <- c(10, 3, 5, 4, 7, 3)
sum(frequencia) * 100 / tam

# exercício 3 -------------------------------------------------------------

dados_exe3 <- read_excel("dados/brutos/dados_exe3.xlsx")
tab_exe3 <- tabyl(dados_exe3, x) |> 
  mutate(p = percent * 100)
write_xlsx(tab_exe3, "output/tab_exe3.xlsx")
