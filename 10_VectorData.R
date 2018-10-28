# Title: Spatial R 
# Section: 10 Vector Data 
# Purposes: Present Basic Vector Data usage including: 
#           - Data Import
#           - Examination of data structure and attributes
#           - Basic Visualization (Lines, Polygons, Points)

##### Libraries essential for spatial data ####
# #List of libraries (thx to Tristan Goodbody for providing me a number of these)
# library(dplyr)        #Data Manipulation 
# library(tidyr)        #Data Manupulation 
# library(ggplot2)      #Graphing 
# library(foreign)      #Import Foriegn to R data types.  Generally used to directly read .dbf files (attributes of Shapefiles)
# 
# #spatial data specific libraries 
# library(sp)           #Essential Spatial Data
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
# A. Set working environment
  setwd("E:/workspace/SpatialR/SpatialR/data/NEON_Vector")

##### Importing and Exploring Data ####################################################################################
# B1. Import Spatial Vector Data -- here I am Using the NEON example dataset 
  AOI <- readOGR("HARV", "HarClip_UTMZ18")
  #      readOGR("PATH", "LayerFile")                          #For your own data specify the PATH then the LayerName
  
  # Adding some more layers:
  Roads <- readOGR("HARV", "HARV_roads")         #Sample data contains line features
  Tower <- readOGR("HARV", "HARVtower_UTM18N")   #Sample data contains point feature
  
# B2. Explore the data  
  summary(AOI) # summary provides meta-data on the file. 
  head(Roads)  # displays the first ten entries in the attribute table 
  class(AOI)   # Type of vector data -- in this case a polygon for to be more precise a: SpatialPolygonDataFrame
  length(Roads)# How many features are in the data.  As with Other dataframes returns the length of the attribute table 
  crs(Tower)   # Projection information
  extent(AOI)  # Spatial extent of the data: (xmin, xmax, ymin, ymax)
  Tower        # Calling the variable directly will display the meta-data
  names(Tower) # Lists all the attribute fields
  Roads$TYPE   # Lists all of the entries under the attribute (LAYER$Attribute)
       table(Roads$TYPE) # provides a list of all the unique entries under the field and lists how many there are of each
  
  #Subset a feature based on an attribute here I save it to a new variable 
    footpaths <- Roads[Roads$TYPE == "footpath",] # alternate: subset(Roads, TYPE == "footpath")
    length(footpaths)
  

# B3. Set projection ... if needed -- initial spatial data is declared
  # Todo 
 

##### Plot a Single Layer (Line Data) #################################################################################
# C1. Plot a single variable 
    plot(footpaths,                                            #Layer
          col = c("red", "blue"),                               #Color of the lines (2 features here and 2 colors)
          lwd = 6,                                              #Line Weight
          main = "NEON Harvard Forest Field Site \n Footpaths"  #Title 
          )  
  
# C2. Plot a Single layer based on the attribute type.  Note the attributes need to be loaded as factors (this should happen by default)
    # syntax for coloring by factor: col = c("colorOne", "colorTwo","colorThree")[object$factor]
    class(Roads$TYPE)                                           #Returns that this is a factor type variable
    levels(Roads$TYPE)                                          #Returns the order of the factors 
                                                                          #"boardwalk"  "footpath"   "stone wall" "woods road"  
    
    roadPalette <- c("blue","green","grey","purple")            #Create a color pallete for the roads (this is a new variable)
    roadWidths  <- c(2,4,3,8)                                   
    plot(Roads, 
         lwd = roadWidths,
         col = roadPalette[Roads$TYPE],
         main = "Harvard Lines")
    
# C3. Add a Legend 
    legend("bottomright",                                       #Position 
           legend = levels(Roads$TYPE),                         #Specify the entries 
           fill = roadPalette)                                  #Specifies the color -- uses the color variable from C2
    

    
    
    
##### Plot Polygon Data ###############################################################################################
    States <- readOGR("US-Boundary-Layers", "US-State-Boundaries-Census-2014")      #Load the data 
    length(States)                                              #List number of attributes
    levels(States$region)                                       #Lists unique attributes (also confirms this is a factor)
    
    colStates <- c("purple", "green", "yellow", "red", "grey")  #Create a color pallete 
    
    plot(States,                                                #Plot State
         col = colStates[States$region],                        #Color using the pallete above and the 'region' attreibute as a factor
         main = "Regions of the United States")                 #Title
    
    legend("bottom",                                            #Add Legend
           legend = levels(States$region),                      #Legend Text
           fill = colStates)                                    #Legend colors 

##### Plot Point Data #################################################################################################
    Plots <- readOGR("HARV", "PlotLocations_HARV")              #Load the data
    names(Plots)                                                #List all the attributes (field names)
    table(Plots$soilTypeOr)                                     #Lists the levels and number in each
    x <- length(levels(Plots$soilTypeOr))                       #X receives the length of the number of levels 
    
    #soilCol <- palette(terrain.colors(x))                      #palette() specifies the colors based x
    soilCol <- palette(rainbow(x))                              #Alternate Color Palette
    symLeg <- c(15,17)                                          #2 symbols used to represent the legend entry
    symbols <- c(symLeg)[Plots$soilTypeOr]                      #This will be the symbol types used google image: "R pch" for a summary of each
  
    
    plot(Plots,
         col = soilCol[Plots$soilTypeOr], 
         pch = symbols,
         main = "Soils Plots at Harvard")
    
    legend("bottomright",
           legend = levels(Plots$soilTypeOr),        
           pch = symLeg,
           col = soilCol, 
           bty = "n",                                           #No box around legend
           cex = 2                                              #Magnify the text 
           )
    
    
    
