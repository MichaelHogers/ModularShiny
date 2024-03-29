library(ggplot2)
library(bslib)
library(shiny)
install.packages("palmerpenguins")
data(penguins, package = "palmerpenguins")

means <- colMeans(
  penguins[c("bill_length_mm", "bill_depth_mm", "body_mass_g")],
  na.rm = TRUE
)
