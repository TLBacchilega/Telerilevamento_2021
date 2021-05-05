# R_code_vegetation_indices.r
# Indici di Vegetazione: il caso della foresta amazzonica (dati preprocessati, Landsat 30m)

library(raster) # pacchetto già installato

setwd("C:/lab/") # Windows

defor1<-brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

# b1 = NIR, b2 = red, b3 = green

par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

library(raster) # require(raster)


# https://cran.r-project.org/web/packages/rasterdiv/index.html

install.packages("rasterdiv") # for the worldwide NDVI
library(rasterdiv)

install.packages("rasterVis")
library(rasterVis)

setwd("C:/lab/") # Windows

defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

defor1 # è il dataset

# difference vegetation index
# time1

dvi1 <- defor1$defor1.1 - defor1$defor1.2

# dev.off()
plot(dvi1)

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme

plot(dvi1, col=cl, main="DVI at time 1")


# time2

dvi2 <- defor2$defor2.1 - defor2$defor2.2

plot(dvi2, col=cl, main="DVI at time 2")


par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")

difdvi <- dvi1 - dvi2


# dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(difdvi, col=cld)


#ndvi
# (NIR-RED)/(NIR+RED)
ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)
plot(ndvi1, col=cl)

# ndvi1 <- dvi1 / (defor1$defor1.1 + defor1$defor1.2)
# plot(ndvi1, col=cl)

ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)
plot(ndvi2, col=cl)

# ndvi1 <- dvi2 / (defor2$defor2.1 + defor1$defor2.2)
# plot(ndvi2, col=cl)

difndvi <- ndvi1 - ndvi2

 
# dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)


# https://cran.r-project.org/web/packages/RStoolbox/index.html
# RStoolbox::spectralIndices

library(RStoolbox) # for vegetation indices calculation

# RStoolbox::spectralIndices
vi <- spectralIndices(defor1, green = 3, red = 2, nir = 1) # non solo indici di vegetazione es. NDWI
plot(vi, col=cl)

vi2 <- spectralIndices(defor2, green = 3, red = 2, nir = 1)
plot(vi2, col=cl)





library(rasterdiv)
# worldwide NDVI
plot(copNDVI)


# Pixels with values 253, 254 and 255 (water) will be set as NA’s.
copNDVI <- reclassify(copNDVI, cbind(253:255, NA)) # per eliminare l'acqua dalla mappa (NDVI a scala globale)
plot(copNDVI)

library(rasterVis) # pacchetto già installato

# https://www.rdocumentation.org/packages/lattice/versions/0.10-10/topics/levelplot

# rasterVis package needed:
levelplot(copNDVI) # valori medi dal 1999 fino al 2017 (valori più alti foresta amazzonica, foreste del centro africa, Borneo...)


 
 
