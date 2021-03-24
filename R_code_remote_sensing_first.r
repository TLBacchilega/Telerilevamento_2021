#Il mio primo codice in R per il telerilevamento
#creazione della cartella di riferimento lab sul disco principale C 
install.packages("raster")#(argomento)
library(raster)
setwd("C:/lab/")# sistema operativo windows 
p224r63_2011 <- brick("p224r63_2011_masked.grd")#funzione brick permette di importare immagini satellitari
p224r63_2011#info sul file
plot(p224r63_2011)#funzione che permette di visualizzare le bande
