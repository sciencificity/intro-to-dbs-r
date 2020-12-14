library(DBI)
library(RSQLite)
library(tidyverse)
library(dbplyr)
library(bakeoff)

# Connect to non-existant database to instantiate
con <- dbConnect(drv = SQLite(), dbname = "great_brit_bakeoff.db")

# Gather all the tables
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

# Write all the tables to the DB via the connection
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

# Let's have a look at one
tbl(con, "seasons")

# Let's look at a few
DBI::dbListTables(con) %>%
  map(.f = function(x) tbl(con, x)) %>%
  set_names(dbListTables(con))

# Disconnect from db
dbDisconnect(con)
