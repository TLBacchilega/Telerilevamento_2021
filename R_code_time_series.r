# Time series analysis: lo scioglimento dei ghiacci in Groenlandia (dati programma Copernicus); Come scaricare dati Copernicus

# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma

# install.packages("raster")
library(raster)

setwd("C:/lab/greenland") # Windows

install.packages("rasterVis")
library(rasterVis)


lst_2000 <- raster("lst_2000.tif")
plot(lst_2000)
lst_2005 <- raster("lst_2005.tif")
plot(lst_2005) 
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

# par
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# list of files
# https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/list.files
rlist <- list.files(pattern="lst")
rlist
# https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/lapply

import <- lapply(rlist,raster)
import

# https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/stack
TGr <- stack(import) # da singolo a unico file
plot(TGr)

plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")

install.packages("rgdal")
library(rgdal)

levelplot(TGr)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
levelplot(TGr, col.regions=cl)

levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

# https://www.rdocumentation.org/packages/lattice/versions/0.15-3/topics/levelplot

levelplot(TGr,col.regions=cl, main="LST variation in time",
          names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

# Melt
meltlist <- list.files(pattern="melt")
melt_import <- lapply(meltlist,raster)
melt <- stack(melt_import)
melt

levelplot(melt)

# Ice sheet difference 2007 - 1979
melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt

clb <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount, col=clb)

levelplot(melt_amount, col.regions=clb)


install.packages("knitr") 
library(knitr)
