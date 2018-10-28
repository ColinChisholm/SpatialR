# Spatial R: A Quick(ish) Introduction
Author: Colin Chisholm

Initiated: Oct. 27, 2018

Last Update:

## Purpose
To create a series of R scripts starting with basic spatial data imports and analysis.  This project is not intended to create original or new material for the R community but to be used for self training and to be provided as a resource for others.  Additionally, my goal is not (at least to start) worry about cartography in R but to focus on data extraction and manipulation.  

## Introducing R
The purpose of this project is not to introduce people to the basic functionality of R.  Readers are encouraged to visit sites like such as
   - [Data Camp Intro R](https://www.datacamp.com/courses/free-introduction-to-r) provides a free intro to R course
   - [Data Camp -- Cleaning Data in R](https://www.datacamp.com/courses/cleaning-data-in-r) is a free courses or at least the first modules are free.  This course focuses on dataframe manipulations, sorting and organizing your data.
   - [R-Bloggers](https://www.r-bloggers.com/) covers numerous topics on R.  The posts range from the simple to complex issues and usually include detailed descriptions of how to do things.  There are also many links on this site
   - Google Search: "R `packagename`"

The only two tips I will suggest here are: First and most importantly, to add lots and lots of `#comments_` as these will assist you in the learning process and help you reconstruct what you were doing after you leave some of your coding for a period of time. Second, there is no shame is taking snippets of other peoples code on the web ... just comment where you found it including a description of what it is used for.

## Introduction to Spatial Data in R
To some extent I am reinventing the wheel here.  There are other sources to find this information.  However, they can at time be too thorough.  Here I am expecting that readers have a decent understanding of GIS data types (e.g. from ESRI Arcmap, Global Mapper, of QGIS experience) and simply want to start using some of the tools, repeatable script processing that R provides.  The National Ecological Observatory Network (NEON) provides some excellent and thorough tutorials:

  - [NEON's Introduction to Vector Data in R](https://www.neonscience.org/vector-data-series)
  - [NEON's Raster Data in R -- the Basics](https://www.neonscience.org/raster-data-r)

## Project Outline / Map
This project will include the sections listed below.  Starting with basic vector and raster import, display, and data manipulation. These will be followed by integration of raster and vector data sets.  Currently, Random Forest Modeling is planned as this is a major component of ongoing research projects I am involved with (PEM Project).

  - [00] Libraries  
  - [10] Vector data
  - [30] Raster data
  - [50] Integration of Raster and Vector data
  - [90] Random Forest Modeling

## 00. Libraries
For those new to R or scripting in general it is important to realize that the base scripting/programing language is expanded using additional libraries.  _Note other languages call these packages (e.g. Python)_. In the files/scripts provided in here the additional libraries are listed at the top of the file with a short description. The intent will be to list all of the libraries used throughout this entire package set.  However, unless they are explicitly needed in the current script they will be commented out.

## Vector Layers
### 10. Vector Data - Working with Single Layers
This script walks through how to import vector data, explore the data types and attributes, and plot the data based on the attributes.  Examples include Line, Polygon, and Point datatypes.  

### 11. Vector Data - Working with Multiple Layers
This script, again following the NEON tutorials, demonstrates how to work with multiple layers.  
Adding additional layers to a plot is a simple process of using the additional flag of  `add = TRUE` in a `plot()` call.  The greater tricks are related to how to build legends.
