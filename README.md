# Redlining_Temp

## Project Title

Unveiling the Legacy of Redlining: Pathways Linking HOLC Grades, Natural and Built Environments, and Land Surface Temperature

## Project Member
* Hoseok Sa 

## Project Overview
Numerous studies have examined the relationship between redlining policies, heat, and natural environments (or built environments). However, pathways contributing to heat vulnerability in historically redlined neighborhoods within a local context remain underexplored. **To address this gap, this project investigates how the legacy of redlining influences neighborhood land surface temperatures through natural and built environments using path (mediation) analysis, focusing on tree canopy cover and impervious surfaces.** Specifically, it employs geospatial analysis to assess land surface temperatures, natural environments, and built environments and utilizes statistical methods to explore their interrelationships.

## Background
**The Home Owners' Loan Corporation (HOLC)** created maps to classify neighborhoods into four grades: Grade A (green) was considered the most desirable, Grade B (blue) was still favorable, Grade C (yellow) was viewed as declining, and Grade D (red) was deemed the riskiest for investment. This practice, known as **redlining**, assessed neighborhoods based on demographics, infrastructure, housing quality, neighborhood stability, and proximity to amenities or hazards. However, these assessments were racially and ethnically discriminatory (Winling & Minchney, 2021). As a result, redlining has been recognized as a racially discriminatory government policy that denied people access to credit and housing based on their race. Aaronson et al. (2021) emphasized that redlining had lasting effects on the development of urban neighborhoods. Beyond its economic and social consequences, redlining has also contributed to long-term environmental and health disparities - with historically redlined neighborhoods being more vulnerable to extreme heat, natural disasters, and health risks due to systemic disinvestment and inadequate infrastructure (Nowak et al., 2022). 

## Problem Statement, Questions, and Objectives
Neighborhoods redlined in the 1930s and 1940s have experienced significantly higher heat exposure risks up to the present than neighborhoods not redlined. Several studies have explored the association between HOLC grades and the proportion of natural and built environments (i.e., tree canopy cover and impervious surfaces). However, existing studies have not thoroughly examined the mechanisms by which past redlining policies influence and mediate current heat exposure. The primary purpose of this study is to examine how the legacy of redlining affects neighborhood land surface temperature using path (mediation) analysis. Specifically, the study aims to answer the following research questions: **1) What is the relationship between the spatial patterns of tree canopies, impervious surfaces, and HOLC grades? Does this relationship remain consistent over time? 2) How are land surface temperatures in neighborhoods with different HOLC grades affected by the spatial distribution of tree canopies and impervious surfaces? 3) Are the mediating effects of the environmental factors on land surface temperature bigger than direct effect of HOLC grades on the land surface temperature?** 

## Study Area & Analysis Unit
* Study Area: Portland, especially focusing on HOLC boundaries in Portland. 
* Spatial Unit: HOLC-graded neighborhoods of the study area

<p align="center">
  <img src="results/portland_holc_map.png" alt="Portland HOLC Map" width="800">
</p>

## Datasets & URL
* **Landsat Collection 2 U.S. Analysis Ready Data (ARD) Level-2 Surface Temperature Science Project**[^1]: I calculated HOLC-graded neighborhoods' land surface temperature for 2021, 2017, and 2013, based on the data source. 
* **NLCD[^2] (National LandCover Database)**: The proportion of tree canopy cover and impervious surfaces was measured based on the dataset. 
* **Mapping Inequality[^3]**: It was used for HOLC-graded neighborhood boundaries.
* **American Community Survey Data[^4]**: Total population, housing units, the proportion of several races were derived from the NHGIS website. However, they were not used for geospatial analysis. 
* **Microsoft Building Footprints Data[^5]**: This data source was used to calculate the building area and density around HOLC-graded neighborhoods. 

## Methodology/Approach
**1. Data Collection for Land Surface Temperature data**
  * Less than 10% cloud cover above the city
  * No scan line errors present
  * No precipitation in the past 24-hour
  * Data will be captured from June to August for 2021 and 2013
    
**2. Data Collection for Tree Canopy Cover, Impervious Surfaces, Building Footprints**
  * Tree canopy cover and impervious surface datasets from 2021 and 2013 were processed.
  * However, due to data limitations, only the 2021 dataset was available for building footprints.

**3. Descriptive Statistics**
  * The descriptive statistics for the ACS datasets were calculated based on the area intersected with HOLC-graded neighborhoods.
  * Box plots were used to examine whether the median values of land surface temperature, tree canopy cover, and impervious surfaces differ across HOLC grades, alongside Kruskal–Wallis H test results.

**4. Geospatial Analysis**
  * Raster Analysis - Reproject/Clip/Zonal Stats
  * Vector Analysis - Intersect/Calculating Area
    
**5. Statistical Analysis**
  * Before running regression models, four HOLC-grades are classified into three categories (High: HOLC grade A, Intermediate: HOLC grade B, and Low: HOLC grades C and D) as grades C and D have similar patterns.  
  * Path Analysis (Mediation Effect Analysis)  

## Tool/packages
* Loading data: rioxarray [^6]
* Zonal stat: rasterstats [^7]
* Raster clip: rasterio [^8]
* Raster reproject: rasterio 
* Intersect: geopandas [^9]

## Conceptual Framework
This study presents path analysis results based on the following conceptual frameworks. Since tree canopy cover and impervious surfaces are highly correlated, two separate models were developed to address multicollinearity concerns. The first framework focuses on **tree canopy cover**, incorporating two regression models: one estimating tree canopy cover proportion of HOLC-graded neighborhoods and the other estimating land surface temperature of HOLC-graded neighborhoods. Based on these regression results, this study assesses the mediating effect of tree canopy cover on the relationship between redlining grades and land surface temperature.

<p align="left">
  <img src="results/Framework1.png" alt="Conceptual Framework for Tree Canopy Cover" width="800">
</p>

The second conceptual framework represents the conceptual model for **impervious surfaces**. This framework also incorporates two models: one estimating impervious surface proportion of HOLC-graded neighborhoods and the other estimating land surface temperature of HOLC-graded neighborhoods. Using these results, this research evaluates the mediating effect of impervious surfaces on the relationship between redlining grades and land surface temperature.
 
<p align="left">
  <img src="results/Framework2.png" alt="Conceptual Framework for Impervious Surfaces" width="800">
</p>

## Analysis Results

### 1) Geospatial Analysis & Descriptive Results
**1-1. In general, neighborhoods with lower HOLC grades (C and D) tend to have higher land surface temperatures, while those with higher grades (A and B) typically experience lower land surface temperatures. This pattern is observed in both 2013 and 2021. The box plots concerning the land surface temperature indicate that the median temperature for HOLC grade A (year 2013: 30.5°C, year 2021: 30.7°C) is the lowest, whereas the land surface temperature for grade D (year 2013: 39.4°C, year 2021: 39.3°C) is the highest. Kruskal-Wallis tests indicate that the median land surface temperatures significantly differ among the four HOLC grades in both 2013 and 2021 (2013: χ² = 31.009, df = 3, p < 0.001; 2021: χ² = 26.933, df = 3, p < 0.001).** 

<p align="left">
  <img src="results/portland_holc_temp2021.png" alt="Comparison for LST between 2013 and 2021" width="800">
</p>

<p align="left">
  <img src="results/boxplot_HOLC_lst.png" alt="Comparison for LST between HOLC grades" width="800">
</p>

**1-2. On average, neighborhoods with higher HOLC grades tend to have a higher proportion of tree canopy covers, whereas those with lower grades show a lower proportion. This pattern is captured in both 2013 and 2021. The box plots regarding the tree canopy proportion indicate that the average tree canopy percentage for HOLC grade A is the highest (year 2013: 54.4%, year 2021: 53.3%), while the percentage for HOLC grade D is the lowest (year 2013: 23.3%, year 2021: 20.6%). Kruskal-Wallis tests show that the median values of the average tree canopy percentage are different among the four HOLC grades in both 2013 and 2021 (2013: χ² = 37.766, df = 3, p < 0.001; 2021: χ² = 38.073, df = 3, p < 0.001).**

<p align="left">
  <img src="results/portland_holc_treecanopy.png" alt="Comparison for Tree Canopy Cover between 2013 and 2021" width="800">
</p>

<p align="left">
  <img src="results/boxplot_HOLC_TC.png" alt="Comparison for TC between HOLC grades" width="800">
</p>

**1-3. Neighborhoods with lower HOLC grades (C and D) tend to have higher percentages of impervious surfaces, while those with higher grades (A and B) typically show lower impervious surfaces. The common pattern is observed in both 2013 and 2021. The box plots concerning the proportion of impervious surfaces indicate that the average impervious surface percentage for HOLC grade A (year 2013: 26.5%, year 2021: 25.6%) is the lowest, whereas the percentage for grade D (year 2013: 69.7%, year 2021: 68.3%) is the highest. Kruskal-Wallis tests indicate that the median values of the average impervious surfaces percentage significantly differ among the four HOLC grades in both 2013 and 2021 (2013: χ² = 38.87, df = 3, p < 0.001; 2021: χ² = 38.33, df = 3, p < 0.001).***

<p align="left">
  <img src="results/portland_holc_impervsurface.png" alt="Comparison for Impervious Surfaces between 2013 and 2021" width="800">
</p>

<p align="left">
  <img src="results/boxplot_HOLC_imperv.png" alt="Comparison for Impervious Surfaces between HOLC grades" width="800">
</p>

**1-4.**


* Neighborhoods with higher HOLC grades are less vulnerable to heat exposure, whereas those with lower grades are more susceptible. Additionally, neighborhoods with more urban forests and fewer impervious surfaces tend to have lower land surface temperatures.

### 2) Regression Results
* The mediating effect of urban forests on land surface temperatures is more substantial in cities with lower population density. In contrast, the mediating effect of impervious surfaces on land surface temperatures is weaker in cities with higher population density.


## Discussion
* 

## Conclusion
* This study showed that 


## References
* Aaronson, D., Hartley, D., & Mazumder, B. (2021). The Effects of the 1930s HOLC "Redlining" Maps. *American Economic Journal: Economic Policy*, 13(4), 355-392.
* Nowak, D. J., Ellis, A., & Greenfield, E. J. (2022). The disparity in tree cover and ecosystem service values among redlining classes in the United States. *Landscape and Urban Planning*, 221, 104370.
* Winling, L. C., & Michney, T. M. (2021). The roots of redlining: Academic, governmental, and professional networks in the making of the new deal lending regime. *Journal of American History*, 108(1), 42-69.

[^1]: https://earthengine.google.com/
[^2]: https://www.mrlc.gov/
[^3]: https://dsl.richmond.edu/panorama/redlining/data
[^4]: https://www.nhgis.org/
[^5]: https://github.com/microsoft/USBuildingFootprints
[^6]: https://corteva.github.io/rioxarray/stable/
[^7]: https://pythonhosted.org/rasterstats/
[^8]: https://rasterio.readthedocs.io/en/stable/
[^9]: https://geopandas.org/en/stable/
