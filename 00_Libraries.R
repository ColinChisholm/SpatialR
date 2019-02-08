# Title: Spatial R
# Section: 00 The Libraries
# Purposes: Prepare your R installation with libraries used in spatial analysis
# by Colin Chisholm
# with thanks to Tristan Goodbody for providing a number of these to the list.
# Last updated: Dec. 5, 2018

##### Libraries essential for data manipulatiopn -----------------------------------------------------------------#####
#List of libraries (thx to Tristan Goodbody for providing me a number of these)
#install.packages(c("dplyr" ,"tidyr","ggplot2","foreign", "XLConnect" ))
library(dplyr)        #Data Manipulation
library(tidyr)        #Data Manupulation
library(ggplot2)      #Graphing
library(foreign)      #Import Foriegn to R data types.  Generally used to directly read .dbf files (attributes of Shapefiles)
library(XLConnect)    #Import from MS Excel files and specific woksheets in those files.

#####spatial data specific libraries -----------------------------------------------------------------------------#####
#install.packages(c("sp", "rgdal", "rgeos", "geoshere", "raster", "rts"))
library(sp)           #Essential Spatial Data
library(rgdal)        #GDAL available to R
library(rgeos)        #for topology operations on geometries
library(geosphere)    #Spherical trigonometry for geographic applications. That is, compute distances and re-lated measures for angular (longitude/latitude) locations
library(raster)       #Raster import and analysis
library(rts)          #For comparing time rasters in time series

#####For Point Cloud Data Analysis.  -----------------------------------------------------------------------------#####
#install.packages(c("EBImage", "lidR", "itcSegment"))
library(EBImage)      # Needed for several functions in lidR  -- NOTE: many dependancies will be instaled
library(lidR)         # https://github.com/Jean-Romain/lidR/wiki N. Coops AWARE
library(itcSegment)   # Individual Tree Segmentation -- (Dalponte et al., 2018 -- including E. N�sset )


#####Spatial Visualization ---------------------------------------------------------------------------------------#####
#install.packages(c("viridis", "rasterVis", "RColorBrewer"))
library(viridis)      #Color Palletes for cartography / styling -- also useful to ensure visible to color-blind
library(rasterVis)    #Methods for enhanced visualization and interaction with raster data
library(RColorBrewer) #Creates nice looking color palettes especially for thematic map
