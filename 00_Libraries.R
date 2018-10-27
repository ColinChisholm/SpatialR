# Title: Spatial R 
# Section: 00 The Libraries 
# Purposes: Present common libraries used in spatial analysis 



##### Libraries essential for spatial data ####
#List of libraries (thx to Tristan Goodbody for providing me a number of these)
library(dplyr)        #Data Manipulation 
library(tidyr)        #Data Manupulation 
library(ggplot2)      #Graphing 
library(foreign)      #Import Foriegn to R data types.  Generally used to directly read .dbf files (attributes of Shapefiles)

#spatial data specific libraries 
library(sp)           #Essential Spatial Data
library(rgdal)        #GDAL available to R 
library(rgeos)        #for topology operations on geometries
library(geosphere)    #Spherical trigonometry for geographic applications. That is, compute distances and re-lated measures for angular (longitude/latitude) locations
library(raster)       #Raster import and analysis 
library(rts)          #For comparing time rasters in time series

#For Point Cloud Data Analysis.  
library(lidR)         #https://github.com/Jean-Romain/lidR/wiki
library(EBImage)      # Needed for several functions in lidR

#Spatial Visualization
library(viridis)      #Color Palletes for cartography / styling -- also useful to ensure visible to color-blind
library(rasterVis)    #Methods for enhanced visualization and interaction with raster data
library(RColorBrewer) #Creates nice looking color palettes especially for thematic map



