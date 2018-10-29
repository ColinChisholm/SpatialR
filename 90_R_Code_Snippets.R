# TITLE: Code Snippets for Spatial Data Types 
# Author: Colin Chisholm 
# Started: Oct. 28, 2018

# Below are created by the author unless otherwise stated.

##### F(n) Calculate Extent Area ######################################################################################
  ExtentArea <- function(Layer){
    ha <- 10000  #10,000 m2 in a hectare
    x <- as(extent(Layer), "SpatialPolygons")
    print(round((area(x)/ha), digits = 1))
  }
  
  