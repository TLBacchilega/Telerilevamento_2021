# R_code_multivariate_analysis.r

 

library(raster) # pacchetto gìà installato
library(RStoolbox) # pacchetto gìà installato


setwd("C:/lab/") # Windows

p224r63_2011 <- brick("p224r63_2011_masked.grd") # funzione brick per sette livelli

p224r63_2011_masked.grd
p224r63_2011

plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)

https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/pairs

pairs(p224r63_2011) # le variabili sono le bande

library(raster)
library(RStoolbox)

setwd("C:/lab/") # Windows

p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011 # info
pairs(p224r63_2011)

# aggregate cells: resampling

# https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/aggregate

p224r63_2011res <- aggregate(p224r63_2011, fact=10) # fattore di ricampionamento

par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")

# https://www.rdocumentation.org/packages/RStoolbox/versions/0.2.6/topics/rasterPCA

# PCA delle immagini originali
p224r63_2011res_pca <- rasterPCA(p224r63_2011res) # contiene immagine, mappa, modello

# https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/summary
summary(p224r63_2011res_pca$model)
plot(p224r63_2011res_pca$map) # PC1, prima componente è quella che spiega più variabilità
p224r63_2011res_pca

dev.off()
plotRGB(p224r63_2011res_pca$map, r=1, g=2, b=3, stretch="lin")


# https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/str
str(p224r63_2011res_pca) # per visualizzare in modo compatto la struttura di un oggetto







 
