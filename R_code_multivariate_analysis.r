# R_code_multivariate_analysis.r

 

library(raster) # pacchetto gìà installato
library(RStoolbox) # paccetto gìà installato


setwd("C:/lab/") # Windows

p224r63_2011 <- brick("p224r63_2011_masked.grd") # funzione brick per sette livelli

p224r63_2011_masked.grd
p224r63_2011

plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)

https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/pairs

pairs(p224r63_2011) # le variabili sono le bande

