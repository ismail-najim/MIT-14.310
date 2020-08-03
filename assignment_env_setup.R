
setwd( "C:/xApps/MIT_MicroMaster/C02-14.310x - Data Analysis/14_310x_Intro_to_R")

rm( list=ls() )

varLibz = c("readxl", "swirl")

### --- Install any missing Libraries ---
getLibaries <- function(){
  installz = var_Libz[ ! var_Libz %in% installed.packages()[, "Package"] ]
  print( paste("Packages to install: ", paste(installz, collapse=", ") ) )
  if( length(installz))install.packages(installz)
}


### --- load libraries ---
loadLibraries <- function(){
  dnul = purrr::map(var_Libz, ~print( .x) )
  dnul = lapply(var_Libz, require, character.only = TRUE) #library will fail IMMEDIATELY if not installed
}
