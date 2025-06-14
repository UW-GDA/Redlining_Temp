# Redlining_Temp

## Project Title

Unveiling the Legacy of Redlining: Pathways Linking HOLC Grades, Natural and Built Environments, and Land Surface Temperature

## Project Member
* Hoseok Sa 

## Project Overview
Numerous studies have examined the relationship between redlining policies, heat, and natural environments (or built environments). However, pathways contributing to heat vulnerability in historically redlined neighborhoods within a local context remain underexplored. **To address this gap, this project investigates how the legacy of redlining influences neighborhood land surface temperatures through natural and built environments using path (mediation) analysis, focusing on tree canopy cover and impervious surfaces.** Specifically, it employs geospatial analysis to assess land surface temperatures, natural environments, and built environments and utilizes statistical methods to explore their interrelationships.

## Background
**The Home Owners' Loan Corporation (HOLC)** created maps to classify neighborhoods into four grades: Grade A (green) was considered the most desirable, Grade B (blue) was still favorable, Grade C (yellow) was viewed as declining, and Grade D (red) was deemed the riskiest for investment. This practice, known as **redlining**, assessed neighborhoods based on demographics, infrastructure, housing quality, neighborhood stability, and proximity to amenities or hazards. However, these assessments were racially and ethnically discriminatory (Winling & Minchney, 2021). As a result, redlining has been recognized as a racially discriminatory government policy that denied people access to credit and housing based on their race. Aaronson et al. (2021) emphasized that redlining had lasting effects on the development of urban neighborhoods. Beyond its economic and social consequences, redlining has also contributed to long-term environmental and health disparities - with historically redlined neighborhoods being more vulnerable to extreme heat, natural disasters, and health risks due to systemic disinvestment and inadequate infrastructure (Nowak et al., 2022). 

## Problem Statement, Research Questions, and Objectives
Neighborhoods redlined in the 1930s and 1940s have experienced significantly higher heat exposure risks up to the present than neighborhoods not redlined. Several studies have explored the association between HOLC grades and the proportion of natural and built environments (i.e., tree canopy cover and impervious surfaces). However, existing studies have not thoroughly examined the mechanisms by which past redlining policies influence and mediate current heat exposure. The primary purpose of this study is to examine how the legacy of redlining affects neighborhood land surface temperature using path (mediation) analysis. Specifically, the study aims to answer the following research questions: **1) What is the relationship between the spatial patterns of tree canopies, impervious surfaces, and HOLC grades? Does this relationship remain consistent over time? 2) How are land surface temperatures in neighborhoods with different HOLC grades affected by the spatial distribution of tree canopies and impervious surfaces? 3) Are the mediating effects of the environmental factors on land surface temperature bigger than direct effect of HOLC grades on the land surface temperature?** 

## Study Area & Analysis Unit
* Study Area: Portland, especially focusing on HOLC boundaries in Portland. 
* Spatial Unit: HOLC-graded neighborhoods of the study area

<p align="center">
  <img src="results/portland_holc_map.png" alt="Portland HOLC Map" width="800">
</p>

## Datasets & URL
* **Landsat 8 OLI/TIRS Collection 2 atmospherically corrected surface reflectance**[^1]: Using the Google Earth engine, I applied the approach described below to extract the average land surface temperature for 2021 and 2013. Based on the data source, I calculated the land surface temperature of HOLC-graded neighborhoods for 2021 and 2013. The Landsat 8 satellite has a 16-day repeat cycle. By filtering Landsat 8 satellite observations for Portland using the approach below, average land surface temperatures for 2021 and 2013 were calculated. 
* **NLCD[^2] (National LandCover Database)**: The proportion of tree canopy cover and impervious surfaces was measured using the NLCD datasets for 2021 and 2013. 
* **Mapping Inequality[^3]**: It was used for HOLC-graded neighborhood boundaries.
* **American Community Survey Data[^4]**: Total population and housing units were derived from the NHGIS website. However, they were not used for geospatial analysis. 
* **Microsoft Building Footprints Data[^5]**: This data source was used to calculate the building area and density around HOLC-graded neighborhoods for 2021. 

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
  * Box plots were used to examine whether the median values of land surface temperature, tree canopy cover, and impervious surfaces differ across HOLC grades, alongside Kruskal–Wallis H test results.
  * I created several box plots and performed Kruskal-Wallis tests using R (Uploaded to github).

**4. Geospatial Analysis**
  * Raster Analysis - Reproject/Clip/Zonal Stats
  * Vector Analysis - Intersect/Calculating Area
    
**5. Statistical Analysis**
  * Before running regression models, four HOLC-grades are classified into three categories (High: HOLC grade A, Intermediate: HOLC grade B, and Low: HOLC grades C and D) as grades C and D have similar patterns.  
  * Path Analysis (Mediation Effect Analysis) was conducted only based on the datasets for 2021.  

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

**1-4. Generally, neighborhoods with lower HOLC grades (C and D) are more likely to have higher levels of building density, whereas those with higher grades (A and B) show lower levels of building density.**

<p align="left">
  <img src="results/portland_holc_buildingdensity.png" alt="Comparison for Building Density for 2021" width="800">
</p>

### 2) Regression Results
**2-1. Tree Canopy Cover as a Mediator**
* This model shows that percentage of tree canopy cover in neighborhoods is negatively associated with land surface temperature, which means that neighborhoods with higher proportion of tree canopy cover are more likely to have higher land surface temperatures. 
* The mediating effect of tree canopy proportion on land surface temperature is more substantial than the direct effect of HOLC grades. In this model, the indirect effect of tree canopy cover accounts for 81% of the total effect on land surface temperature.
* Given that the Chi-Square statistic (3.283) is not statistically significant, and the fit indices — CFI (0.996), RMSEA (0.085), and SRMR (0.012)—indicate a good model fit, this model adequately represents the data.

<p align="left">
  <img src="results/regression1_figure.png" alt="Regression figure for tree canopy" width="800">
</p>


**2-2. Impervious Surfaces as a Mediator**
* The model indicates that the proportion of impervious surfaces in a neighborhood is positively associated with land surface temperature, suggesting that neighborhoods with a higher proportion of impervious surfaces tend to have higher land surface temperatures.
* The mediating effect of impervious surfaces on land surface temperature is greater than the direct effect of HOLC grades. In this model, the indirect effect of impervious surfaces accounts for 80% of the total effect on land surface temperature.
* Since the Chi-Square statistic (0.303) is not statistically significant and the fit indices — CFI (1.000), RMSEA (0.000), and SRMR (0.004) — indicate a good model fit, the model provides an adequate representation of the data.
  
<p align="left">
  <img src="results/regression2_figure.png" alt="Regression figure for impervious surfaces
      " width="800">
</p>

## Discussion
* Redlining policies have contributed to environmental disparities, particularly in terms of heat vulnerability and the unequal spatial distribution of tree canopy cover and impervious surfaces as lasting effects of these policies.
* Lower-graded neighborhoods face disproportionate heat exposure due to reduced tree canopy cover and increased impervious surfaces.
* These disparities are not just remnants of the past but continue to shape heat vulnerability today.
* Addressing these issues requires targeted interventions to mitigate heat-related risks in historically disadvantaged areas.

## Conclusion & Future Direction
* Neighborhoods with higher HOLC grades have lower heat vulnerability, whereas those with lower grades are more susceptible to heat.
* The percentage of tree canopy cover in neighborhoods is negatively associated with land surface temperature. Additionally, the mediating effect of tree canopy proportion on land surface temperature is more substantial than the direct effect of HOLC grades.
* Neighborhoods with higher HOLC grades are more likely to have a greater proportion of tree canopy cover, while those with lower grades tend to have a smaller proportion of impervious surfaces.
* Not only is the proportion of impervious surfaces in a neighborhood positively associated with land surface temperature, but the mediating effect of impervious surfaces on land surface temperature is also greater than the direct effect of HOLC grades.
* To enhance robustness, this study may need to incorporate a multi-level structure using both grid-level and neighborhood-level data as a future research direction. Since restricting the analysis to the neighborhood level results in a small sample size for path analysis, a multi-level path analysis approach should be considered.

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
