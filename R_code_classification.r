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


soc20 <- unsuperClass(so, nClasses=20)
plot(soe20$map,col=cl)

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soc20$map,col=cl)


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



# Grand Canyon
# https://landsat.visibleearth.nasa.gov/view.php?id=80948

# When John Wesley Powell led an expedition down the Colorado River and through the Grand Canyon in 1869, he was confronted with a daunting landscape. At its highest point, the serpentine gorge plunged 1,829 meters (6,000 feet) from rim to river bottom, making it one of the deepest canyons in the United States. In just 6 million years, water had carved through rock layers that collectively represented more than 2 billion years of geological history, nearly half of the time Earth has existed.

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")

plotRGB(gc, r=1, g=2, b=3, stretch="lin")
plotRGB(gc, r=1, g=2, b=3, stretch="hist")


# https://cran.r-project.org/web/packages/RStoolbox/RStoolbox.pdf


gcc2 <- unsuperClass(gc, nClasses=2) # nClass argomento fondamentale
gcc2
plot(gcc2$map)

gcc4 <- unsuperClass(gc, nClasses=4) # gc nome immagine originale
plot(gcc4$map)


 



