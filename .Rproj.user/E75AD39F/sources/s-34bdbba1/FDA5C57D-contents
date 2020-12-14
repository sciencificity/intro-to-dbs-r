library(DBI)
library(RPostgres)
library(tidyverse)
library(dbplyr)
library(bakeoff)

# Download a PostgreSQL Database engine
# https://www.postgresql.org/

# Open PG Admin using the username + pswd you set-up
# when installing
# Create a new DB called great_brit_bakeoff_pg

# Connect to an existing database 
# to write our data
con <- dbConnect(drv = Postgres(), 
                 host = "localhost", 
                 port = "5432",
                 user = "your_user_name", 
                 password = "your_pswd",
                 dbname = "great_brit_bakeoff_pg")


episodes <- as_tibble(bakeoff::all_episodes)
baker_results <- as_tibble(bakeoff::baker_results)
bakers <- as_tibble(bakeoff::bakers)
bakes <- as_tibble(bakeoff::bakes)
challenge_results <- as_tibble(bakeoff::challenge_results)
challenges <- as_tibble(bakeoff::challenges)
episode_results <- as_tibble(bakeoff::episode_results)
ratings <- as_tibble(bakeoff::ratings)
ratings_seasons <- as_tibble(bakeoff::ratings_seasons)
results <- as_tibble(bakeoff::results)
seasons <- as_tibble(bakeoff::seasons)
series <- as_tibble(bakeoff::series)

DBI::dbWriteTable(conn = con, "episodes", 
                  episodes, overwrite = TRUE)
DBI::dbWriteTable(conn = con, "baker_results", 
                  baker_results, overwrite = TRUE)
DBI::dbWriteTable(conn = con, "bakers", 
                  bakers, overwrite = TRUE)
DBI::dbWriteTable(conn = con, "bakes", 
                  bakes, overwrite = TRUE)
DBI::dbWriteTable(conn = con, "challenge_results", 
                  challenge_results, overwrite = TRUE)
DBI::dbWriteTable(conn = con, "episode_results", 
                  episode_results, overwrite = TRUE)
DBI::dbWriteTable(conn = con, "ratings", 
                  ratings, overwrite = TRUE)
DBI::dbWriteTable(conn = con, "ratings_seasons", 
                  ratings_seasons, overwrite = TRUE)
DBI::dbWriteTable(conn = con, "results", 
                  results, overwrite = TRUE)
DBI::dbWriteTable(conn = con, "challenges", 
                  challenges, overwrite = TRUE)
DBI::dbWriteTable(conn = con, "seasons", 
                  seasons, overwrite = TRUE)
DBI::dbWriteTable(conn = con, "series", 
                  series, overwrite = TRUE)

# Verify Tables were created
DBI::dbListTables(con)

tbl(con, "seasons")

dbDisconnect(con)

# In R Script / Rmd make an odbc connection
# You will need to download the odbc driver
# for Postgres

# con_pg <- dbConnect(
#   odbc::odbc(),
#   Driver = "PostgreSQL ODBC Driver(UNICODE)",
#   Database = "great_brit_bakeoff_pg",
#   Server = "localhost",
#   UID = "your_user_name",
#   PWD = "your_pswd",
#   port = 5432
# )
# 
# dbListTables(con_pg)
# 
# RPostgres::dbGetQuery(conn = con_pg,
#       statement = 'SELECT * FROM bakers LIMIT 10')
# 
# dbDisconnect(con_pg)

# Alternately use the RPostgres package to
# make a connection

# con <- dbConnect(
#     drv = RPostgres::Postgres(),
#     dbname = "great_brit_bakeoff_pg",
#     host = "localhost",
#     user = "your_user_name",
#     password = "your_pwsd",
#     port = "5432"
# )
# 
# odbc::odbcListDrivers()
