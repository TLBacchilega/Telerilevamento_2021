# R_code_land_cover.r
# Generazione di mappe di land cover e cambiamento del paesaggio (dati preprocessati, Landsat 30m)
# Restituzione grafica: ggplot2

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

defor1 <- brick("defor1.jpg") # brick function can import all the layer bands of my file/image. 
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

# unsupervised classification
# https://www.rdocumentation.org/packages/RStoolbox/versions/0.2.6/topics/unsuperClass
d1c <- unsuperClass(defor1, nClasses=2)
plot(d1c$map)
# class 1: forest
# class 2: agriculture

# set.seed() would allow you to attain the same results ...

d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)
# class 1: agriculture
# class 2: forest

# classificazione con 3 classi
d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map)

# frequencies
freq(d1c$map)                     
#   value  count                #   value  count                
# [1,]     1 306583             # [1,]     1  34560
# [2,]     2 34709              # [2,]      2  306732 

s1 <- 306583 + 34709

prop1 <- freq(d1c$map) / s1
# prop forest: 0.8983012
# prop agriculture: 0.1016988

s2 <- 342726
prop2 <- freq(d2c$map) / s2
# prop forest: 0.5206958 # class2
# prop agriculture: 0.4793042 # class1

# build a dataframe 
# https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/data.frame
cover <- c("Forest","Agriculture") # prima variabile cover composta da  2 componenti forest ed agriculture
percent_1992 <- c(89.83, 10.16)
percent_2006 <- c(52.06, 47.93)

percentages <- data.frame(cover, percent_1992, percent_2006)
percentages # information about percentages (tabella con tre colonne)

# let's plot them!

# https://www.rdocumentation.org/packages/ggplot2/versions/3.3.3
library(ggplot2)
# ggplot(mpg è il dataset all'interno del pacchetto, aes(displ, hwy, colour = class)) + tipo di classe
# geom_point() tipo di grafico es geom_bar
# https://www.rdocumentation.org/packages/ggplot2/versions/3.3.3/topics/geom_bar

ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

grid.arrange(p1, p2, nrow=1)

