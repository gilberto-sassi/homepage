library(pacman)

p_load(
  readxl, writexl, janitor, ggthemes, tidyverse
)

dados <- read_excel("dados/brutos/salvador.xlsx")

# mutate cria nova coluna
dados <- dados |> 
  mutate(q006_fct = fct(
    q006,
    levels = c(
      "Nenhuma Renda",
      "Até R$ 1.212,00",
      "De R$ 1.212,01 até R$ 1.818,00.",
      "De R$ 1.818,01 até R$ 2.424,00.",
      "De R$ 2.424,01 até R$ 3.030,00.",
      "De R$ 3.030,01 até R$ 3.636,00.",
      "De R$ 3.636,01 até R$ 4.848,00.",
      "De R$ 4.848,01 até R$ 6.060,00.",
      "De R$ 6.060,01 até R$ 7.272,00.",
      "De R$ 7.272,01 até R$ 8.484,00.",
      "De R$ 8.484,01 até R$ 9.696,00.",
      "De R$ 9.696,01 até R$ 10.908,00.",
      "De R$ 10.908,01 até R$ 12.120,00.",
      "De R$ 12.120,01 até R$ 14.544,00.",
      "De R$ 14.544,01 até R$ 18.180,00.",
      "De R$ 18.180,01 até R$ 24.240,00.",
      "Acima de R$ 24.240,00."
    )
  ))

dados <- dados |> 
  mutate(q006_fct = fct_collapse(
    q006_fct,
    "Renda Baixa" = c("Nenhuma Renda",
                      "Até R$ 1.212,00",
                      "De R$ 1.212,01 até R$ 1.818,00.",
                      "De R$ 1.818,01 até R$ 2.424,00.",
                      "De R$ 2.424,01 até R$ 3.030,00."),
    "Renda Média" = c("De R$ 3.030,01 até R$ 3.636,00.",
                      "De R$ 3.636,01 até R$ 4.848,00.",
                      "De R$ 4.848,01 até R$ 6.060,00.",
                      "De R$ 6.060,01 até R$ 7.272,00.",
                      "De R$ 7.272,01 até R$ 8.484,00.",
                      "De R$ 8.484,01 até R$ 9.696,00.",
                      "De R$ 9.696,01 até R$ 10.908,00."),
    "Renda Alta" = c("De R$ 10.908,01 até R$ 12.120,00.",
                     "De R$ 12.120,01 até R$ 14.544,00.",
                     "De R$ 14.544,01 até R$ 18.180,00.",
                     "De R$ 18.180,01 até R$ 24.240,00.",
                     "Acima de R$ 24.240,00.")
  ))

tabela <- tabyl(dados, q006_fct) |> 
  adorn_totals() |> 
  adorn_pct_formatting(digits = 2) |> 
  rename(
    "Renda" = "q006_fct",
    "Frequência (absoluta)" = "n",
    "Porcentagem" = "percent"
  )
tabela

ggplot(dados) +
  geom_bar(aes(x = q006, y = after_stat(100 * count / sum(count)))) +
  labs(x = "Renda", y = "Porcentagem", title = "Renda - Salvador - ENEM 2022") +
  coord_flip() +
  theme_dark()
ggsave("figuras/renda.png", width = 10, height = 10, units = "cm")

k <- floor(1 + log2(nrow(dados)))
ggplot(dados) +
  geom_histogram(aes(x = nu_nota_mt, y = after_stat(density)), bins = k,
                 fill = "red") +
  theme_dark()

# mudando os fatores

dados <- dados |> 
  mutate(q006_fct = fct_recode(
    q006_fct,
    "Classe A" = "Renda Alta",
    "Classe B" = "Renda Média",
    "Classe C" = "Renda Baixa"
  )) |> 
  mutate(q006_fct = fct_relevel( # mudar a orden dos níveis
    q006_fct, "Classe A", "Classe B", "Classe C"
  ))
tabyl(dados, q006_fct)
