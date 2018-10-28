# Title: Spatial R 
# Author: Colin Chisholm
# Section: 13 Vector Data 
# Purposes: Importing CSV Data 

##### Libraries essential for spatial data ####
# Only thoses used in the script below have the comment cleared off
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
library(viridis)      #Color Palletes for cartography / styling -- also useful to ensure visible to color-blind
# library(rasterVis)    #Methods for enhanced visualization and interaction with raster data
# library(RColorBrewer) #Creates nice looking color palettes especially for thematic map

##### DATA IMPORT #####################################################################################################
# Scripting generated following the instructions from the NEON turorial 
# A1. Set working environment
  setwd("E:/workspace/SpatialR/SpatialR/data/NEON_Vector")

# A2. Bringing in CSV data 
  dataPoints <- read.csv("HARV/HARV_PlotLocations.csv", 
                         stringsAsFactors = FALSE)              #This Stops R from manipulating the data into factors

##### Determine Projection information ################################################################################
# B1. Examing the Data for spatial information including projection
  str(dataPoints)                                               #Structure reveals that the fields easting and northing contain utm coordinates
     #UTM easting and northings recorded 
     #Datum is stored as WGS84 
     #Zone is stored as  18N
  
# B2. Set CRS infomation
  #One option to set the CRS is to find the CRS string on a website such as: http://www.spatialreference.org/ref/epsg/wgs-84-utm-zone-18n/
  #OR EASIER -- In this Case we have the CRS info in an exisitng layer
  Tower <- readOGR("HARV", "HARVtower_UTM18N")
  ProjectCRS <- crs(Tower)
  
##### Convert to a Spatial Object #####################################################################################
# C1. convert data to spatial data 
  dataPoints <- SpatialPointsDataFrame(dataPoints[,1:2],        #The x y coordinates
                                       dataPoints,              #The Data to assign
                                       proj4string = ProjectCRS #Assign the CRS
                                       )
  class(dataPoints)   
  plot(dataPoints)  
  extent(dataPoints)

  
##### Export the Shapefile ############################################################################################  
  writeOGR(dataPoints, "E:/workspace/SpatialR/exports", "PlotData", driver = "ESRI Shapefile")
  
  
##### Working with Extents -- Updating the Plot Extent if to small ####################################################
  