# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma

# install.packages("raster")
library(raster)

setwd("C:/lab/greenland") # Windows


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
