# Title: Spatial R 
# Section: 21 Raster data: Import and Crop
# Author: Colin Chisholm
# Date:   Oct. 28, 2018
# Purposes: review importing raster data.  Includes croping data.

##### Libraries essential for spatial data ####
# #List of libraries (thx to Tristan Goodbody for providing me a number of these)
# library(dplyr)        #Data Manipulation 
# library(tidyr)        #Data Manupulation 
# library(ggplot2)      #Graphing 
# library(foreign)      #Import Foriegn to R data types.  Generally used to directly read .dbf files (attributes of Shapefiles)
# 
# #spatial data specific libraries 
library(sp)           #Essential Spatial Data
library(rgdal)        #GDAL available to R 
# library(rgeos)        #for topology operations on geometries
# library(geosphere)    #Spherical trigonometry for geographic applications. That is, compute distances and re-lated measures for angular (longitude/latitude) locations
library(raster)       #Raster import and analysis 
# library(rts)          #For comparing time rasters in time series
# 
# #For Point Cloud Data Analysis.  
# library(lidR)         #https://github.com/Jean-Romain/lidR/wiki
#   library(EBImage)      #Needed for several functions in lidR
# 
# #Spatial Visualization
# library(viridis)      #Color Palletes for cartography / styling -- also useful to ensure visible to color-blind
# library(rasterVis)    #Methods for enhanced visualization and interaction with raster data
# library(RColorBrewer) #Creates nice looking color palettes especially for thematic map

##### DATA IMPORT #####################################################################################################
# Scripting generated following the instructions from the NEON turorial 
# A1. Set working environment
setwd("E:/workspace/SpatialR/SpatialR/data/NEON_Vector")

# A2. Import Spatial Vector Data -- here I am Using the NEON example dataset 
  AOI <- readOGR("HARV", "HarClip_UTMZ18")
  Roads <- readOGR("HARV", "HARV_roads")
  Tower <- readOGR("HARV", "HARVtower_UTM18N" )
  SoilPlots <- readOGR("HARV", "PlotLocations_HARV")
  
  CHM <- raster("E:/workspace/SpatialR/rasterData/HARV/CHM/HARV_chmCrop.tif")   #Import Raster Data
  
##### Crop data to extent #############################################################################################
# Desire is to crop the Raster to the largest extent ... but which one is largest
# B1. Determine Extent to crop to 
  # Function -- to calculate the area of layer extent (in hectares)  
  myArea <- function(Layer){
    ha <- 10000  #10,000 m2 in a hectare
    x <- as(extent(Layer), "SpatialPolygons")
    print(round((area(x)/ha), digits = 1))
  }
  
  myArea(Roads)
  myArea(AOI)  
  myArea(SoilPlots)
  
# B2. Crop to the extent of interest 
  CHM_crop <- crop(CHM, SoilPlots)
  
    
##### Plot the Data ###################################################################################################
  plot(extent(CHM),
       lwd=4,col="springgreen",
       main="LiDAR CHM - Cropped\nNEON Harvard Forest Field Site",
       xlab="easting", ylab="northing")                                    #note the addition of x and y labels
  
  plot(CHM_crop,
       add=TRUE)
  plot(SoilPlots, add = TRUE)  
  