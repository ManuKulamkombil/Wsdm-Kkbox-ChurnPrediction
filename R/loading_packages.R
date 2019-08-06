options(max.print = 1000, scipen = 999, width = 100)
library(RevoScaleR)
rxOptions(reportProgress = 3) # reduces the amount of output RevoScaleR produces
library(dplyr)
options(dplyr.print_max = 200)
options(dplyr.width = Inf) # shows all columns of a tbl_df object
library(stringr)
library(lubridate)
library(rgeos) # spatial package
library(sp) # spatial package
library(maptools) # spatial package
library(ggmap)
library(ggplot2)
library(gridExtra) # for putting plots side by side
library(ggrepel) # avoid text overlap in plots
library(tidyr)
library(seriation) # package for reordering a distance matrix
library(nycflights13)
library(pracma)

