library(ggplot2)
library(tidyverse)

mtcars

mtcars$gear <- factor(mtcars$gear)
levels(mtcars$gear)

df <- mtcars %>%
  group_by(gear)%>%
  summarize(
    mean_mpg = mean(mpg),
    mean_disp = mean(disp)
  )


ggplot(mtcars, aes(mpg, disp, colour = gear, fill = gear)) +
  geom_point()+
  geom_density_2d(linewidth = 1.2)+
  stat_ellipse(level = .7, geom = "polygon", alpha = 0.5, show.legend = FALSE,
               linewidth = 1.2)+
  scale_color_manual(values = c("red", "dodgerblue", "lightgreen"))+
  scale_fill_manual(values = c("pink", "lightblue","lightyellow"))


