# Packages 
library(data.table)

# Data
dt <- fread("games_1966_2019.csv")

# Data manipulation
dt_1 <- dt[
  
  i = schedule_season >= 1990
  ,
  j = list(schedule_season,
           schedule_week,
           type = ifelse(schedule_playoff == TRUE, "post", "reg"),
           team_home,
           team_away,
           team_favorite_id,
           score_home,
           score_away,
           spread_score = abs(score_home - score_away),
           spread_favorite = abs(spread_favorite),
           score_total = score_home + score_away,
           over_under_line,
           stadium_neutral,
           dome = ifelse(weather_detail %in% c("DOME"), 1, 0),
           badweather = ifelse(weather_detail %in% c("Fog", "Rain", "Rain | Fog", "Snow", "Snow | Fog | Freezing Rain"), 1, 0),
           weather_detail
           )
  
] 

dt_2 <- dt_1[
  
  ,
  j = .(.SD,
        spread_diff = abs(spread_favorite - spread_score), 
        score_diff = abs(score_total - over_under_line))
  
]

setnames(dt_2, c(names(dt_2)), c(names(dt_1), "spread_diff", "score_diff"))

# Data write
fwrite(dt_2, "games_1990_2019.csv")
