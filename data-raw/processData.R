## Load libraries
library(sf)
library(tibble)

## Read and process regions of Chad
regions <- sf::st_read(dsn = "data-raw/tcd_admbnda_adm1_ocha",
                      layer = "tcd_admbnda_adm1_ocha")

usethis::use_data(regions, overwrite = TRUE, compress = "xz")

## Read and process departments of Chad
departments <- sf::st_read(dsn = "data-raw/tcd_admbnda_adm2_ocha_20170615",
                           layer = "tcd_admbnda_adm2_ocha_20170615")

usethis::use_data(departments, overwrite = TRUE, compress = "xz")

## Read and process prefectures of Chad
prefectures <- sf::st_read(dsn = "data-raw/tcd_a_admbnd_adm3_ocha",
                           layer = "tcd_a_admbnd_adm3_ocha")

usethis::use_data(prefectures, overwrite = TRUE, compress = "xz")


## Read villages/settlements
settlements <- read.csv("data-raw/TD/TD.csv", header = FALSE)
settlements <- subset(settlements, V8 == "PPL")
names(settlements) <- c("id", "name1", "name2", "name3",
                        "latitude", "longitude",
                        "featureClass", "featureCode",
                        "countryCode1", "countryCode2",
                        "adm1Code", "adm2Code",
                        "adm3Code", "adm4Code",
                        "population", "elevation",
                        "dem", "timezone", "modDate")
settlements <- tibble::tibble(settlements)

usethis::use_data(settlements, overwrite = TRUE, compress = "xz")


villages <- sf::st_read(dsn = "data-raw/villages/CHAD_Village_1_m_ocha",
                        layer = "CHAD_Village_1_m_ocha")

usethis::use_data(villages, overwrite = TRUE, compress = "xz")
