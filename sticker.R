library(hexSticker)
library(ggplot2)
library(showtext)
library(ggridges)
library(wesanderson)
library(tidyverse)

## Loading Google fonts (http://www.google.com/fonts)
font_add_google("Anton", "anton")

## Automatically use showtext to render text for future devices
showtext_auto()

p <- ggplot(mtcars, aes(x = mpg, y = factor(cyl), fill = factor(cyl))) +
  scale_fill_manual(values = wes_palette("Zissou1", 3)) +
  geom_density_ridges(scale = 5, alpha = 0.5) +
  theme_void() + theme_transparent() +
  theme(legend.position = "none")

s <- sticker(p, package = "R MUSers",
        p_size = 30,
        s_x = 1, s_y = 0.75, s_width = 1, s_height = 1,
        p_family = "anton",
        p_color = "gold",
        h_fill="#000000",
        h_color="gold")

case_when(
  Sys.info()["sysname"] == "Darwin" ~ quartz(),
  Sys.info()["sysname"] == "Windows" ~ window(),
  Sys.info()["sysname"] == "linux-gnu" ~ X11()
)

print(s)
