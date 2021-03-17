setwd("C:/lab/")#windows
install.packages("raster")
library(raster)
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
plot(p224r63_2011)
# B1: blue
# B2: green
# B3: red
# B4: NIR
cl <- colorRampPalette(c('black','grey','light grey'))(100) #(100) livelli 
plot(p224r63_2011, col=cl)
#colour change new
cl <- colorRampPalette(c("green","blue","light grey"))(100)
plot(p224r63_2011, col=cl)
