rm(list=ls())
options(scipen=9999)

## library load
library(readxl)
library(dplyr)

## Data load
portland_2021 <- read_excel("Portland_HOLC_CBG_Intersect_2021.xlsx")
oregon_race_2021 <- read_excel("Race_2021.xlsx")
portland_2013 <- read_excel("Portland_HOLC_CBG_Intersect_2013.xlsx")
oregon_socio_2013 <- read_excel("Oregon_2013_SocioDemographics.xlsx")

## Data calculation

### Portland

### 2021
oregon_race_2021$geoid <- as.numeric(oregon_race_2021$geoid)
portland <- portland_2021 %>% inner_join(oregon_race, by = c("Oregon_CBG__geoid" = "geoid"))

portland$cbgpctg <- portland$Area_Intersect/portland$Oregon_CBG_AEA_Area_CBG
portland$holcpctg <- portland$Area_Intersect/portland$Area_HOLC

portland$popcut <- portland$Oregon_CBG__TotalPop*portland$cbgpctg
portland$housecut <- portland$Oregon_CBG__TotalHousing*portland$cbgpctg
portland$whitecut <- portland$White*portland$cbgpctg
portland$blackcut <- portland$Black*portland$cbgpctg
portland$nonwhitecut <- portland$nonwhite*portland$cbgpctg
portland$hispaniccut <- portland$Hispanic*portland$cbgpctg

## Population 
holcpop_por <- aggregate(popcut~area_id, portland, sum)
holcpop_por$popcut <- round(holcpop_por$popcut, 0)

holcpop_por_area <- portland %>% select(area_id, grade, Area_HOLC) %>% distinct() %>% 
  left_join(holcpop_por, by="area_id")
holcpop_por_area <- holcpop_por_area %>% mutate(sq_km = Area_HOLC/10763910.4) # sq feet to sq km
holcpop_por_area <- holcpop_por_area %>% mutate(pop_density = round(popcut/sq_km, 2))

## Housing 
holchouse_por <- aggregate(housecut~area_id, portland, sum)
holchouse_por$housecut <- round(holchouse_por$housecut, 0)

holchouse_por_area <- portland %>% select(area_id, grade, Area_HOLC) %>% distinct() %>% 
  left_join(holchouse_por, by="area_id")
holchouse_por_area <- holchouse_por_area %>% mutate(sq_km = Area_HOLC/10763910.4) # sq feet to sq km
holchouse_por_area <- holchouse_por_area %>% mutate(house_density = round(housecut/sq_km, 2))

write.csv(holchouse_por_area, "Portland_HOLC_house.csv")

## white, black, hispanic
holcwhite_por <- aggregate(whitecut~area_id, portland, sum)
holcwhite_por$whitecut <- round(holcwhite_por$whitecut, 0)

holcblack_por <- aggregate(blackcut~area_id, portland, sum)
holcblack_por$blackcut <- round(holcblack_por$blackcut, 0)

holcnonwhite_por <- aggregate(nonwhitecut~area_id, portland, sum)
holcnonwhite_por$nonwhitecut <- round(holcnonwhite_por$nonwhitecut, 0)

holchispanic_por <- aggregate(hispaniccut~area_id, portland, sum)
holchispanic_por$hispaniccut <- round(holchispanic_por$hispaniccut, 0)

holcpop_por_area <- holcpop_por_area %>% 
  left_join(holcwhite_por, by="area_id")

holcpop_por_area <- holcpop_por_area %>% 
  left_join(holcblack_por, by="area_id")

holcpop_por_area <- holcpop_por_area %>% 
  left_join(holcnonwhite_por, by="area_id")

holcpop_por_area <- holcpop_por_area %>% 
  left_join(holchispanic_por, by="area_id")

holcpop_por_area <- holcpop_por_area %>% mutate(white_percent = round(whitecut/popcut*100, 2),
                                                black_percent = round(blackcut/popcut*100, 2),
                                                nonwhite_percent = round(nonwhitecut/popcut*100, 2),
                                                hispanic_percent = round(hispaniccut/popcut*100, 2))

write.csv(holcpop_por_area, "Portland_HOLC_Pop_race_2021.csv")

#####################################################################################################
#####################################################################################################