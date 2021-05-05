# R_code_land_cover.r
# Generazione di mappe di land cover e cambiamento del paesaggio (dati preprocessati, Landsat 30m)

# R code analisi multitemporale di variazione della land cover

library(raster)
library(RStoolbox) # classification



### https://ggplot2-book.org/


install.packages("ggplot2") # per la produzione di grafici
library(ggplot2)

# https://cran.r-project.org/web/packages/egg/vignettes/Ecosystem.html
install.packages("gridExtra")
library(gridExtra)


setwd("C:/lab/") # Windows

defor1
# names: defor1_.1, defor1_.2, defor1_.3 
# defor1_.1 = NIR
# defor1_.2 = red
# defor1_.3 = green

# NIR 1, RED 2, GREEN 3

defor1 <- brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin") # plot grezzo, con poche informazioni

# https://www.rdocumentation.org/packages/RStoolbox/versions/0.2.6/topics/ggR
# https://www.rdocumentation.org/packages/RStoolbox/versions/0.2.6/topics/ggRGB

ggRGB(defor1, r=1, g=2, b=3, stretch="lin")

defor2 <- brick("defor2.jpg") # seconda immagine
plotRGB(defor2, r=1, g=2, b=3, stretch="lin") 
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# multiframe with ggplot2 and gridExtra
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

library(gridExtra)

# https://www.rdocumentation.org/packages/pdp/versions/0.7.0/topics/grid.arrange
grid.arrange(p1, p2, nrow=2) # this needs gridExtra
