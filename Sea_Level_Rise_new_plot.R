library(tidyverse)
library(ggthemes)
library(gganimate)
library(gifski)
library(png)
library(ggpubr)

raw_data <- read_csv("csiro_alt_gmsl_mo_2015.csv", col_types = cols(
  Time = col_date(format = ""),
  GMSL = col_double()
)) %>%
  as_tibble()

Sea_Level <- raw_data %>%
  ggplot(mapping = aes(x = Time, y = GMSL)) +
  geom_line() +
  geom_smooth(method = "lm", formula = y ~ x, se = TRUE) +
  theme_economist() +
  labs(x = "Years", y = "Sea Level (mm)",
       title = "Change in Sea Levels from 1993 to 2015",
       subtitle = "Rise In Sea Levels Indicate Gradual Warming of Earths Climate",
       caption = "Source: NOAA (2015)") +
  stat_cor(label.y = 50) +
  stat_regline_equation(label.y = 45) 
Sea_Level
write_rds(Sea_Level, "Sea-Level-Still.rds")
