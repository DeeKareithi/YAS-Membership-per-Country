#YAS Membership per Country
#Dorcas K
#March 20201


#selecting libraries needed
library(flexdashboard)
library(googlesheets4)
library(shiny)
library(ggplot2)
library(plyr)
library(dplyr)
library(RColorBrewer)
library(plotly)
library(leaflet)
library(tidyverse)
library(lubridate)
library(tmap)
library(spData)



#loading data

data <- as.data.frame(read_sheet("https://docs.google.com/spreadsheets/d/134kCLF-VPMInkGKw22ZC9Ox7IQcgHkP1AoEO18_aqFk/edit#gid=0"))


#Data Exploration
str(data)

data<-data[,1:2] 
data<-data[-c(55),]
names(data)<-c("name_long", "YAS Q1")

head(data)
summary(data)


#Plotting the data
#plot(data$number_q1)

africa = world %>% 
  filter(continent == "Africa", !is.na(name_long)) %>%
   left_join(data, by = "name_long")
 


tm_shape(africa) + tm_polygons("YAS Q1", palette = "Blues") + tm_text("name_long", size = 0.53)

#gplot(africa) +
   #geom_sf(aes(geometry = geom, fill = number_q1)) 






