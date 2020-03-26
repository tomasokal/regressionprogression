# Packages
library(data.table)

# Loading data

## Regular season
reg_2009 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/regular_season/reg_games_2009.csv")
reg_2010 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/regular_season/reg_games_2010.csv")
reg_2011 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/regular_season/reg_games_2011.csv")
reg_2012 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/regular_season/reg_games_2012.csv")
reg_2013 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/regular_season/reg_games_2013.csv")
reg_2014 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/regular_season/reg_games_2014.csv")
reg_2015 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/regular_season/reg_games_2015.csv")
reg_2016 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/regular_season/reg_games_2016.csv")
reg_2017 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/regular_season/reg_games_2017.csv")
reg_2018 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/regular_season/reg_games_2018.csv")
reg_2019 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/regular_season/reg_games_2019.csv")

## Post season
post_2009 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/post_season/post_games_2009.csv")
post_2010 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/post_season/post_games_2010.csv")
post_2011 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/post_season/post_games_2011.csv")
post_2012 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/post_season/post_games_2012.csv")
post_2013 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/post_season/post_games_2013.csv")
post_2014 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/post_season/post_games_2014.csv")
post_2015 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/post_season/post_games_2015.csv")
post_2016 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/post_season/post_games_2016.csv")
post_2017 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/post_season/post_games_2017.csv")
post_2018 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/post_season/post_games_2018.csv")
post_2019 <- fread("https://raw.githubusercontent.com/ryurko/nflscrapR-data/master/games_data/post_season/post_games_2019.csv")

### Removing extra row in post_2019
post_2019 <- post_2019[, -1]

# Combining data
reg <- list(reg_2009, reg_2010, reg_2011, reg_2012, reg_2013, reg_2014, reg_2015, reg_2016, reg_2017, reg_2018, reg_2019)
post <- list(post_2009, post_2010, post_2011, post_2012, post_2013, post_2014, post_2015, post_2016, post_2017, post_2018, post_2019)
reg_dt <- rbindlist(reg)
post_dt <- rbindlist(post)
games <- rbindlist(list(reg_dt, post_dt))

# Manipulate data
games_dt <- setDT(games)

games_dt <- games_dt[
  
  i = 
  ,
  
  j = list(season,
           week,
           type,
           home_team,
           away_team,
           home_score,
           away_score,
           total = home_score + away_score,
           game_id)
  
]

setorder(games_dt, season, week)

# Export data
fwrite(games_dt, "games_2009_2019.csv")
