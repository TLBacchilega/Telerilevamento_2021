# My first code in R for remote sensing

# codice R per analisi di immagini satellitari
# Visualizzazione dei dati satellitari in R (Dati Landsat, 30m)


# creazione della cartella di riferimento lab sul disco principale C 
# packages: raster
install.packages("raster") # (argomento)
# con library() richiamiamo il pacchetto
library(raster)
# Loading required package: sp

setwd("C:/lab/") # sistema operativo windows 
p224r63_2011 <- brick("p224r63_2011_masked.grd") # funzione brick permette di importare immagini satellitari
p224r63_2011 #info sull'immagine
plot(p224r63_2011) # funzione che permette di visualizzare le bande

## Day2

# colour change
cl <- colorRampPalette(c('black','grey','light grey'))(100) #(100) livelli 
plot(p224r63_2011, col=cl)
# colour change -> new
cl <- colorRampPalette(c("green","blue","light grey"))(100)
plot(p224r63_2011, col=cl)

### Day3

## Bande Landsat
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio
# colour change

# dev.off will clean the current graph
# dev.off ripulisce la finestra grafica (le impostazioni ripartono da zero)
dev.off()

plot(p224r63_2011$B1_sre) # simbolo $dollaro per legare due blocchi (es. immagine satellitare totale p224r63_2011 alla propria banda B1)

#plot band 1 with a predefined color RampPalette
cls <- colorRampPalette(c("red","pink","orange","purple")) (200)
plot(p224r63_2011$B1_sre, col=cls)

dev.off()


plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 1 row, 2 columns
par(mfrow=c(1,2)) # par serve a stabilire come si vuole fare il plottaggio, a definire come si vogliono mettere le immagini nel software; mf= multiframe
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

#### Day4

## Visualizing data by RGB plotting
# 3 componenti: RGB
# 3 bande: R= banda del rosso, G= banda del verde, B= banda del blu


# Bande Landsat
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# Exercise: mount a 2x2 multiframe
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# https://www.rdocumentation.org/packages/grDevices/versions/3.6.2/topics/pdf
pdf("il_mio_primo_pdf_con_R.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
dev.off()


plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")


# par natural colours, flase colours, and false colours with histogram stretching
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

#####Day5

#1988 image
# Multitemporal set
p224r63_1988 <- brick("p224r63_1988_masked.grd")
p224r63_1988

# Bande Landsat
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

plot(p224r63_1988)
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")

# hist
pdf("multitemp.pdf")
# creare un multiframe con par e poi inserire le due immagini 1988 e 2011
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
dev.off()













plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")


# par natural colours, flase colours, and false colours with histogram stretching
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")


