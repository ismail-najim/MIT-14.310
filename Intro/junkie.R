
var_Libz <- c("swirl")


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
