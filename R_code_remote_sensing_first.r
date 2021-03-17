#Il mio primo codice in R per il telerilevamento
#creazione della cartella di riferimento lab sul disco principale C 
setwd("C:/lab/")# sistema operativo windows 
install.packages("raster")# (argomento)
library(raster)
p224r63_2011 <- brick("p224r63_2011_masked.grd")#funzione brick che permette di importare immagini satellitari
p224r63_2011#info sul file
plot(p224r63_2011)#funzione che permette di visualizzare le bande
