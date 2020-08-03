######
##
## 1. Libraries list : load. install if not available.  
## 2. Global properties: e.g. ggplot2 themes
##
######

## packages ‘pandoc’, ‘patchwork’, ‘quanteda.dictionaries’, ‘rgeocodio’ are not available (for R version 3.5.2)

var_env_Libz = c('here', 'pander', 'ProjectTemplate', 'DiagrammeR')

#rio includes jsonlite, xml, foreign, data.table. openxlsx:targeted Excel, glue:util.paste, dataCompareR:dfs compare by row or valu
var_io_Libz = c('rio', 'openxlsx', 'sqldf', 'glue')  

#tidyverse includes dplyr:pipe(magrittr), purrr, tidyr:readr,tibble, ggplot2. janitor:dupes. purrr:map reduce.  splitsstackshape: text to cols, 
var_munging_Libz = c('tidyverse', 'lubridate', 'stringr', 'janitor', 'splitstackshape', 'validate')   

# and other text cleaning 
var_coding_Libz = c('car', 'anonymizer')

#patchwork:grid layouts, viridis:colorscale, esquisse:drag_n_drop. DT:JS tables. patchwork
var_visualize_Libz = c('ggplot2', 'viridis', 'esquisse', 'DT')  

#tidyquant:financials, zoo:tseries, gmodels:better x-tabs
var_basic_analysis_Libz = c('Hmisc', 'gmodels', 'tidyquant', 'xts', 'zoo', 'skimr', 'summarytools') #psych 

#'quanteda.dictionaries' 
var_text_analysis_Libz = c('quanteda', 'hunspell', 'wordcloud2', 'spacyr', 'quanteda.dictionaries', 'quanteda.corpora') 

#mlr:classification, regression, clustering, multi-classification and survival analysis. 
var_analysis_Libz = c('mlr', 'caret', 'gbm', 'modelr') 

#leaflet:JS maps. ggmap+rgeocodio:geocode. 
var_gis_Libz = c('sf', 'leaflet', 'ggmap', 'tmap', 'tmaptools', 'geofacet') 

var_py_Libz = c('reticulate')


var_Libz = c(var_env_Libz, var_io_Libz, var_coding_Libz, var_munging_Libz, 
             var_visualize_Libz, var_basic_analysis_Libz, var_text_analysis_Libz, var_gis_Libz, var_analysis_Libz,
             var_py_Libz)

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


### --- Setup Project Structure ---
setupProjectDir <- function( projName , rootDir, mode='minimal'){
  setwd( rootDir )
  create.project( project.name = projName, merge.strategy = 'allow.non.conflict', template = mode)
}