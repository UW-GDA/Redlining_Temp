# Redlining_Temp

## Project Team
* Hoseok Sa 

## Project Overview
Numerous studies have examined the relationship between redlining policies, heat, and natural environments (or built environments). However, differential pathways contributing to heat vulnerability in historically redlined neighborhoods within the local contexts remain underexplored. **To address this gap, this project investigates how the legacy of redlining influences neighborhood land surface temperatures through natural and built environments using mediation analysis.** Specifically, it employs geospatial analysis to assess land surface temperatures, natural environments, and built environments and utilizes statistical methods to explore their interrelationships.

## Background
**The Home Owners' Loan Corporation (HOLC)** created maps to classify neighborhoods into four grades: Grade A (green) was considered the most desirable, Grade B (blue) was still favorable, Grade C (yellow) was viewed as declining, and Grade D (red) was deemed the riskiest for investment. This practice, known as **redlining**, assessed neighborhoods based on demographics, infrastructure, housing quality, neighborhood stability, and proximity to amenities or hazards. However, these assessments were racially and ethnically discriminatory (Winling & Minchney, 2021). As a result, redlining has been recognized as a racially discriminatory government policy that denied people access to credit and housing based on their race. Aaronson et al. (2021) emphasized that redlining had lasting effects on the development of urban neighborhoods. Beyond its economic and social consequences, redlining has also contributed to long-term environmental and health disparities - with historically redlined neighborhoods being more vulnerable to extreme heat, natural disasters, and health risks due to systemic disinvestment and inadequate infrastructure (Nowak et al., 2022). 

## Problem Statement, Questions, and Objectives
Neighborhoods redlined in the 1930s and 1940s have experienced significantly higher heat exposure risks up to the present than neighborhoods not redlined. Several studies have explored the association between HOLC grades and the proportion of natural and built environments (i.e., urban forests and impervious surfaces). However, existing studies have not thoroughly examined the mechanisms by which past redlining policies influence and mediate current heat exposure. The primary purpose of this study is to examine how the legacy of redlining affects neighborhood land surface temperature using mediation analysis. Specifically, the study aims to answer the following research questions: 1) What is the relationship between the spatial patterns of urban forests (or tree canopies), impervious surfaces, and HOLC grades? Does this relationship remain consistent over time? 2) How do HOLC grades impact neighborhood land surface temperatures? How are land surface temperatures in neighborhoods with different HOLC grades affected by the spatial distribution of urban forests (or tree canopies) and impervious surfaces? 3) Do the mediating effects of environmental factors vary between different cities? 

## Study Area & Analysis Unit
* Criteria: 1) A Metropolitan city with Heat exposure, 2) Population Density, and 3) Different climate conditions
* Portland, New York City – Although New York City and Portland are metropolitan cities facing heat exposure issues, New York City's higher population density results in more impervious surfaces. Additionally, they experience different climatic conditions (Given the time constraints of the quarter, the study area may need to be limited to a single location).
* Spatial Unit: HOLC-graded neighborhoods of the study area

## Datasets & URL
* **Landsat Collection 2 U.S. Analysis Ready Data (ARD) Level-2 Surface Temperature Science Project**[^1]: I will calculate HOLC-graded neighborhoods' average land surface temperature based on the data source. 
* **NLCD[^2] (National LandCover Database)**: The proportion of urban forests and impervious surfaces will be measured based on the dataset. 
* **Mapping Inequality[^3]**: It will be used for HOLC-graded neighborhood boundaries. 

## Planned Methodology/Approach
* Data Collection for Land Surface Temperature data
  * Less than 10% cloud cover above the city
  * No scan line errors present
  * No precipitation in the past 24-hour
  * Data will be captured from June to August  
* Geospatial Analysis
  * Zonal Statistics  
* Statistical Analysis
  * Path Analysis (Mediation Effect Analysis)  

## Tool/packages I will use
* Zonal stat: rasterstats
*
*

## Expected Outcomes
* Neighborhoods with higher HOLC grades tend to have a more significant proportion of urban forests (or tree canopies) and a smaller proportion of impervious surfaces in each city, and this pattern has remained consistent over time.
* Neighborhoods with higher HOLC grades are less vulnerable to heat exposure, whereas those with lower grades are more susceptible. Additionally, neighborhoods with more urban forests and fewer impervious surfaces tend to have lower land surface temperatures.
* The mediating effect of urban forests on land surface temperatures is more substantial in cities with lower population density. In contrast, the mediating effect of impervious surfaces on land surface temperatures is weaker in cities with higher population density.

## References
* Aaronson, D., Hartley, D., & Mazumder, B. (2021). The Effects of the 1930s HOLC "Redlining" Maps. *American Economic Journal: Economic Policy*, 13(4), 355-392.
* Nowak, D. J., Ellis, A., & Greenfield, E. J. (2022). The disparity in tree cover and ecosystem service values among redlining classes in the United States. *Landscape and Urban Planning*, 221, 104370.
* Winling, L. C., & Michney, T. M. (2021). The roots of redlining: Academic, governmental, and professional networks in the making of the new deal lending regime. *Journal of American History*, 108(1), 42-69.

[^1]: https://earthexplorer.usgs.gov/
[^2]: https://www.mrlc.gov/
[^3]: https://dsl.richmond.edu/panorama/redlining/data
