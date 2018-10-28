# Title: Spatial R 
# Author: Colin Chisholm
# Section: 12 Vector Data 
# Purposes: Review Projections and managing data withh different projections.

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

##### Examples ########################################################################################################
# B1. Example 1 -- Data with like CRS
  States <- readOGR("US-Boundary-Layers", "US-State-Boundaries-Census-2014")
      #Rough Plot of States -- just to take a quick visual look at the data 
      pal <- viridis(length(States))                                #Set colors to be used.  Note above that the viridis palette was added
      plot(States, col = pal)                                       #display

  USBoundary <- readOGR("US-Boundary-Layers", "US-Boundary-Dissolved-States")
      plot(USBoundary, lwd = 4, add = TRUE)                         #add the boundary to the plot

  #The plot above looks nice ... the layers seem to match well. 
  #Compare crs
  crs(States)      
  crs(USBoundary)
      # Both return the same value CRS -- projections are the same
      # CRS arguments:
      #   +proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0 

# B2. Adding Miss-matching data
  Tower <- readOGR("HARV", "HARVtower_UTM18N")
  plot(Tower, pch = 19, col = "red", add = TRUE)                   
  #Although we know that the Tower exists it does not show on this map. 
  crs(Tower) #Tower is recorded as UTM where the States were in Lat/Long
      # CRS arguments:
      #   +proj=utm +zone=18 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0 
  
##### Transform the Data ##############################################################################################
  # Transform Tower to the State CRS
  ProjectCRS <- crs(States)
  Tower <- spTransform(Tower, ProjectCRS)
  plot(Tower, pch = 19, col = "red", add = TRUE)    
  