library("basedosdados")
setwd("~/Documents/clean_RAIS/RAIS/raw data")

# Defina o seu projeto no Google Cloud
set_billing_id("brazil-rais-data")

# Para carregar o dado direto no R
query <- bdplyr("br_me_rais.microdados_estabelecimentos") %>% 
  dplyr::filter(ano > 1999)

query %>% 
  dplyr::glimpse()

Y1df <- bd_write_csv(query, "~/Documents/clean_RAIS/RAIS/raw data/raw.csv", overwrite = T)

tempdir()

unlink(tempdir(), recursive = T)
