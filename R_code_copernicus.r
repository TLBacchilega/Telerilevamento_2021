# R_code_copernicus.r
# Visualizing Copernicus data

# Come scaricare dati Copernicus
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

library(raster)
install.packages("ncdf4")
library(ncdf4)

setwd("C:/lab/") # Windows


albedo <- raster("c_gls_ALBH_202006130000_GLOBE_PROBAV_V1.5.1.nc") # funzione raster per caricare un singolo layer; mantenere estensione.nc

cl <- colorRampPalette(c('light blue','green','red','yellow'))(100) # 
plot(albed0, col=cl)

# resampling
albedores <- aggregate(albedo, fact=100)
plot(albedores, col=cl)
