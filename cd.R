rm(list=ls())
library(here)
library(dplyr)
library(scales)
library(ggplot2)
library(tidyverse)
library(lubridate)
library(hrbrthemes)
library(RColorBrewer)

# dataset --------------------------------------------------------------------------------------------------------------------
dta <- read.csv("dataset/prod.csv",header = TRUE, sep = ",", dec = ".",stringsAsFactors = TRUE)
colnames(dta) <- c("Entity","Code","Year","Production")


# variables ----------------------------------------
Africa = c("Africa","Africa (FAO)")
Eastern_Africa = c("Madagascar","Tanzania")
Af_Zone = c("Eastern Africa (FAO)","Middle Africa (FAO)","Western Africa (FAO)")
Western_Africa = c("Benin","Cote d'Ivoire","Ghana","Liberia","Nigeria","Sierra Leone","Togo")
Middle_Africa = c("Angola","Gabon","Cameroon","Central African Republic","Congo","Democratic Republic of Congo",
                  "Sao Tome and Principe")

America = "Americas (FAO)"
Am_Zone = c("Caribbean (FAO)","Central America (FAO)","North America","South America","South America (FAO)")

Asia = c("Asia","Asia (FAO)")
As_Zone = c("South-eastern Asia (FAO)","Southern Asia (FAO)")

Oceania = c("Oceania","Oceania (FAO)")
Oc_Zone = "Micronesia (FAO)"

Contrie = c("High-income countries","Land Locked Developing Countries (FAO)","Least Developed Countries (FAO)",
            "Low-income countries","Low Income Food Deficit Countries (FAO)","Lower-middle-income countries",
            "Upper-middle-income countries","Net Food Importing Developing Countries (FAO)",
            "Small Island Developing States (FAO)")


# dataset -----------------------------------------
Africas<-dta%>%
  dplyr::filter(Entity=="Africa")%>%
  slice(1:60)

Americas<-dta%>%
  dplyr::filter(Entity %in% America)

Asias<-dta%>%
  dplyr::filter(Entity %in% Asia)

pays <- dta%>%
  filter(!(Entity) %in% Africa, !(Entity) %in% America, !(Entity) %in% Asia, !(Entity) %in% Oceania,!(Entity) %in% Contrie,
         !(Entity) %in% Af_Zone, !(Entity) %in% Am_Zone,!(Entity) %in% As_Zone,!(Entity) %in% Oc_Zone, Entity!="World")

Dta_Afr <- data.frame(
  Zone = c(rep("Eastern Africa (FAO)",2),rep("Western Africa (FAO)",7),rep("Middle Africa (FAO)",7)),
  Entity = c("Madagascar","Tanzania","Benin","Cote d'Ivoire","Ghana","Liberia","Nigeria","Sierra Leone","Togo","Angola",
             "Gabon","Cameroon","Central African Republic","Congo","Democratic Republic of Congo","Sao Tome and Principe"),
  Longitude = c(46.85432800000001,34.88519500000001,2.313137999999981,-5.547099500000002,-1.0318194999999832,
                -9.428598000000022,8.674252499999994,-11.795934499999987,0.8296844999999848,17.88066900000001,
                11.598908999999992,12.343439499999988,20.94175899999999,21.758664,21.75502799999998,6.968272000000013),
  Latitude = c(-18.777192499999998,-6.368216,9.3220475,7.5468545,7.955012,6.452424,9.0845755,8.4648055,8.621697000000001,
               -11.209451000000001,-0.8280970000000001,7.365302,6.614041500000001,-4.038333,-4.0347884999999994,
               0.8630444999999999))





