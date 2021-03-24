# My frst code in R for remote sensing
# creazione della cartella di riferimento lab sul disco principale C 
install.packages("raster")# (argomento)
library(raster)
setwd("C:/lab/")# sistema operativo windows 
p224r63_2011 <- brick("p224r63_2011_masked.grd")# funzione brick permette di importare immagini satellitari
p224r63_2011#info sul file
plot(p224r63_2011)# funzione che permette di visualizzare le bande

#### Day2

# colour change
cl <- colorRampPalette(c('black','grey','light grey'))(100) #(100) livelli 
plot(p224r63_2011, col=cl)
# colour change -> new
cl <- colorRampPalette(c("green","blue","light grey"))(100)
plot(p224r63_2011, col=cl)

# Day3

## Bande Landsat
# B1: blue
# B2: green
# B3: red
# B4: NIR (infrarosso vicino)
# B5:(infrarosso medio)
# B6:(infrarosso termico)
# B7:(infrarosso medio)
# colour change

# dev.off will clean the current graph
dev.off()

plot(p224r63_2011$B1_sre)

cls <- colorRampPalette(c("red","pink","orange","purple")) (200)
plot(p224r63_2011$B1_sre, col=cls)

dev.off()


plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 1 row, 2 columns
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 2 row, 1 columns
par(mfrow=c(2,1)) # if you are using columns first: par(mfcol....)
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# plot the first four bands of Landsat
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# a quadrat of bands...:
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# a quadrat of bands...:
par(mfrow=c(2,2))

clb <- colorRampPalette(c("dark blue","blue","light blue")) (100)
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c("dark green","green","light green")) (100)
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c("dark red","red","pink")) (100)
plot(p224r63_2011$B3_sre, col=clr)

clnir <- colorRampPalette(c("red","orange","yellow")) (100)
plot(p224r63_2011$B4_sre, col=clnir)
