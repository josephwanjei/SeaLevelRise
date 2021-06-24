library(tidyverse)
library(ggthemes)
library(gganimate)
library(gifski)
library(png)

raw_data <- read_csv("csiro_alt_gmsl_mo_2015.csv", col_types = cols(
  Time = col_date(format = ""),
  GMSL = col_double()
)) %>%
  as_tibble()
write_rds(raw_data, "raw_data")

Sea_Level <- raw_data %>%
  ggplot(mapping = aes(x = Time, y = GMSL)) +
  geom_line() +
  theme_economist() +
  labs(x = "Years", y = "Sea Level (mm)",
       title = "Change in Sea Levels from 1993 to 2015",
       subtitle = "Rise In Sea Levels Indicate Gradual Warming of Earths Climate",
       caption = "Source EPA (2015)") +
  transition_reveal(Time)+
  view_follow(fixed_y = TRUE)
Sea_Level
write_rds(Sea_Level, "Sea-Level-Animation.rds")
