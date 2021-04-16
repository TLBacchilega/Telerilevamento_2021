# Knitr: reports in R

# R_code_knitr.r
setwd("C:/lab/greenland")
install.packages("knitr") 
library(knitr) # require(knitr)

# https://www.rdocumentation.org/packages/knitr/versions/1.31/topics/stitch

setwd("C:/lab/")  

# stitch("~/Downloads/R_code_temp.r", template=system.file("misc", "knitr-template.Rnw", package="knitr"))

# https://yihui.org/tinytex/r/#debugging
tinytex::install_tinytex()    
tinytex::tlmgr_update()
stitch("R_code_greenland.r.tx", template=system.file("misc", "knitr-template.Rnw", package="knitr")) # documento di testo salvato nella cartella lab: R_code_greenland.r


