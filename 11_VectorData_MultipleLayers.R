# Title: Spatial R 
# Author: Colin Chisholm
# Section:  11 Vector Data -- Using Multiple Layers
# Purposes: Build from 10 Vectors


# ##### Libraries essential for spatial data ####
# #List of libraries (thx to Tristan Goodbody for providing me a number of these)
# library(dplyr)        #Data Manipulation 
# library(tidyr)        #Data Manupulation 
# library(ggplot2)      #Graphing 
# library(foreign)      #Import Foriegn to R data types.  Generally used to directly read .dbf files (attributes of Shapefiles)
# 
# #spatial data specific libraries 
#library(sp)             #Essential Spatial Data
library(rgdal)          #GDAL available to R 
# library(rgeos)        #for topology operations on geometries
# library(geosphere)    #Spherical trigonometry for geographic applications. That is, compute distances and re-lated measures for angular (longitude/latitude) locations
library(raster)       #Raster import and analysis 
# library(rts)          #For comparing time rasters in time series
# 
# #For Point Cloud Data Analysis.  
# library(lidR)         #https://github.com/Jean-Romain/lidR/wiki
# library(EBImage)      # Needed for several functions in lidR
# 
# #Spatial Visualization
# library(viridis)      #Color Palletes for cartography / styling -- also useful to ensure visible to color-blind
# library(rasterVis)    #Methods for enhanced visualization and interaction with raster data
# library(RColorBrewer) #Creates nice looking color palettes especially for thematic map

##### A. Data Import ##################################################################################################
# A1. Set Working Directory
  setwd("e:/workspace/SpatialR/SpatialR/data/NEON_Vector")

# A2. Load data 
  AOI <- readOGR("HARV", "HarClip_UTMZ18")
  Roads <- readOGR("HARV", "HARV_roads")
  Tower <- readOGR("HARV", "HARVtower_UTM18N")

##### B. Explore the Data #############################################################################################
  # Goal here is to decide how to represent it as a plotted map 
    table(Roads$TYPE)                                           #styling will be by TYPE
    Roads.col <- c("green", "brown", "red", "black")[Roads$TYPE]#for ploting the colors 
    Roads.pal <- c("green", "brown", "red", "black")            #for plotting the legend     
    lwd.Roads <- c(2, 1, 4, 6)[Roads$TYPE]                      #line widths in the Plot
    
  # the Tower only has one attibute as such styles do not need to be declared 

    
##### C. Plot multiplle  layers #######################################################################################
  # C1. Plot Multiple Layers
  # By simply including the add flag
    plot(AOI, col = "grey", main = "Harvard Forest Field Sites")  #AOI polygon
    plot(Roads,                                                   #Roads lines
       lwd = lwd.Roads, col = Roads.col, add = TRUE)
    plot(Tower, col = "purple", pch = 16, add = TRUE)             #Tower point
    
    Map <- recordPlot()                                           #records the ploting above so that it can be called in a single line
    Map
    
  # C2. Build the legend 
  # Create an obect with all the labels
    labels <- c("AOI", "Tower", levels(Roads$TYPE))               #Summary of Labels
    leg.Colors <- c("grey", "purple", Roads.pal)
    leg.lty <- c(NA,NA,1,1,1,1)                                   #Labels that receive line symbols
    leg.pch <- c(15, 16, NA,NA,NA,NA)                             #Special symbols 
    
    
    legend("bottomright", legend = labels,                        #Adds Legend
         lty = leg.lty,                                           #Which items are lines
         pch = leg.pch,                                           #Special Symbols
         col = leg.Colors,                                        #Color each symbol 
         bty = "n", cex = 0.8                                     #No box, magnify plot
  )
  