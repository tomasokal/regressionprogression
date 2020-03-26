# Packages
library(data.table)
library(ggplot2)
library(ggridges)

# Read data
dt <- fread("games_1990_2019.csv")
df <- as.data.frame(dt[schedule_season > 1999])

# Quick visualization

ggplot(data = df, mapping = aes(x = score_diff, y = as.factor(schedule_season))) +
  geom_density_ridges(alpha = 0.6, bandwidth = 2.5, fill = "blue", from = 0, to = 50, colour = "White") +
  theme_minimal() +
  labs(x = "Difference between score total and Vegas Over/Under",
       y = "Season",
       title = "How well does Vegas predict NFL score totals")

ggplot(data = df, mapping = aes(x = score_diff, y = as.factor(badweather))) +
  geom_density_ridges(alpha = 0.6, bandwidth = 2.5, fill = "blue", from = 0, to = 50, colour = "White") +
  theme_minimal() +
  labs(x = "Difference between score total and Vegas Over/Under",
       y = "Dome",
       title = "How well does Vegas predict NFL score totals")

ggplot(data = df[df$type == "reg", ], mapping = aes(x = score_diff, y = as.factor(as.numeric(schedule_week)))) +
  geom_density_ridges(alpha = 0.6, bandwidth = 2.5, fill = "blue", from = 0, to = 50, colour = "White") +
  theme_minimal() +
  labs(x = "Difference between score total and Vegas Over/Under",
       y = "Week",
       title = "How well does Vegas predict NFL score totals")