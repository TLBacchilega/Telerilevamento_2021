## R_code_classification.r

library(raster) # pacchetto gà installato



setwd("C:/lab/") # Windows

# https://www.rdocumentation.org/packages/raster/versions/3.4-5/topics/brick

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so

# Visualize RGB levels

plotRGB(so, 1,2,3, stretch="lin")
plotRGB(so, 2,1,3, stretch="lin")
plotRGB(so, 3,2,1, stretch="lin")

library(RStoolbox) # pacchetto già installato

# Unsupervised Classification

# https://www.rdocumentation.org/packages/RStoolbox/versions/0.2.6/topics/unsuperClass

soc <- unsuperClass(so, nClasses=3) # oggetto soc
plot(soc$map)

# Unsupervised Classification with 20 classes
soc <- unsuperClass(so, nClasses=20)
plot(soc$map)


set.seed(42) #
soc <- unsuperClass(so, nClasses=20)
plot(soc$map)

cl <- colorRampPalette(c('yellow','red','black'))(100)
plot(soc$map,col=cl)

# Unsupervised Classification with 20 classes

soc20 <- unsuperClass(so, nClasses=20)
plot(soc20$map)

# Download an image from:

# https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images


lic <- brick("lic.png.JPG") # immagine Cladonia sp.
lic <- unsuperClass(lic, nClasses=3)
plot(lic$map)

 



