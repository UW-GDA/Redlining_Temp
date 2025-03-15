rm(list=ls())
options(scipen=9999)

## library load
library(readxl)
library(ggplot2)
library(FSA)
library(lavaan)
library(semPlot)
library(car)
library(dplyr)

## Data load
data <- read.csv("portland_holc_final_.csv")
lst_boxplot <- read_excel("data_lst_boxplot.xlsx")
TC_boxplot <- read_excel("data_TC_boxplot.xlsx")
imperv_boxplot <- read_excel("data_Imperv_boxplot.xlsx")
popden_boxplot <- read_excel("data_popden_boxplot.xlsx")
houseden_boxplot <- read_excel("data_houseden_boxplot.xlsx")

## Box plots

### LST
lst_boxplot$Year <- as.factor(lst_boxplot$Year)
lst_boxplot$HOLC_grade <- as.factor(lst_boxplot$HOLC_grade)
lst_boxplot$LST <- as.numeric(lst_boxplot$LST)

lst_boxplot %>% 
  filter(Year==2013 & HOLC_grade == "A") %>% 
  summarize(median_LST = median(LST, na.rm = TRUE))

lst_boxplot %>% 
  filter(Year==2021 & HOLC_grade == "A") %>% 
  summarize(median_LST = median(LST, na.rm = TRUE))

lst_boxplot %>% 
  filter(Year==2013 & HOLC_grade == "B") %>% 
  summarize(median_LST = median(LST, na.rm = TRUE))

lst_boxplot %>% 
  filter(Year==2021 & HOLC_grade == "B") %>% 
  summarize(median_LST = median(LST, na.rm = TRUE))

lst_boxplot %>% 
  filter(Year==2013 & HOLC_grade == "C") %>% 
  summarize(median_LST = median(LST, na.rm = TRUE))

lst_boxplot %>% 
  filter(Year==2021 & HOLC_grade == "C") %>% 
  summarize(median_LST = median(LST, na.rm = TRUE))

lst_boxplot %>% 
  filter(Year==2013 & HOLC_grade == "D") %>% 
  summarize(median_LST = median(LST, na.rm = TRUE))

lst_boxplot %>% 
  filter(Year==2021 & HOLC_grade == "D") %>% 
  summarize(median_LST = median(LST, na.rm = TRUE))

boxplot_HOLC_lst <- ggplot(lst_boxplot, aes(x = HOLC_grade, y = LST, fill = Year)) +
  geom_boxplot(
    outlier.shape = "|",    # Vertical line shape for outliers
    outlier.size = 0.5,     # Thickness of the outlier lines
    outlier.alpha = 0.7,    # Transparency
    outlier.color = "gray10"  # Change outlier color to gray
  ) +
  scale_fill_manual(values = c("2013" = "steelblue", "2021" = "goldenrod")) +
  theme_bw() +
  labs(x = "HOLC Grade", y = "Land Surface Temperature (°C)", fill = "Year") +
  coord_cartesian(ylim = c(25, 45)) +
  theme(
    text = element_text(size = 14),
    legend.position = "bottom",
    panel.grid = element_blank(),
    panel.border = element_blank(),
    axis.line = element_line(color = "black")
  )

width <- 7
ggsave("boxplot_HOLC_lst.pdf",
       width=width,
       height=width/1.618)

ggsave("boxplot_HOLC_lst.png",
       width=width,
       height=width/1.618)

kruskal.test(LST ~ HOLC_grade, data = subset(lst_boxplot, Year=="2013"))
kruskal.test(LST ~ HOLC_grade, data = subset(lst_boxplot, Year=="2021"))

dunnTest(LST ~ HOLC_grade, data = subset(lst_boxplot, Year == "2013"), method = "bonferroni")
dunnTest(LST ~ HOLC_grade, data = subset(lst_boxplot, Year == "2021"), method = "bonferroni")


### Tree Canopy

TC_boxplot$Year <- as.factor(TC_boxplot$Year)
TC_boxplot$HOLC_grade <- as.factor(TC_boxplot$HOLC_grade)
TC_boxplot$TC <- as.numeric(TC_boxplot$TC)

TC_boxplot %>% 
  filter(Year==2013 & HOLC_grade == "A") %>% 
  summarize(median_TC = median(TC, na.rm = TRUE))

TC_boxplot %>% 
  filter(Year==2021 & HOLC_grade == "A") %>% 
  summarize(median_TC = median(TC, na.rm = TRUE))

TC_boxplot %>% 
  filter(Year==2013 & HOLC_grade == "B") %>% 
  summarize(median_TC = median(TC, na.rm = TRUE))

TC_boxplot %>% 
  filter(Year==2021 & HOLC_grade == "B") %>% 
  summarize(median_TC = median(TC, na.rm = TRUE))

TC_boxplot %>% 
  filter(Year==2013 & HOLC_grade == "C") %>% 
  summarize(median_TC = median(TC, na.rm = TRUE))

TC_boxplot %>% 
  filter(Year==2021 & HOLC_grade == "C") %>% 
  summarize(median_TC = median(TC, na.rm = TRUE))

TC_boxplot %>% 
  filter(Year==2013 & HOLC_grade == "D") %>% 
  summarize(median_TC = median(TC, na.rm = TRUE))

TC_boxplot %>% 
  filter(Year==2021 & HOLC_grade == "D") %>% 
  summarize(median_TC = median(TC, na.rm = TRUE))

boxplot_HOLC_TC <- ggplot(TC_boxplot, aes(x = HOLC_grade, y = TC, fill = Year)) +
  geom_boxplot(
    outlier.shape = "|",    # Vertical line shape for outliers
    outlier.size = 0.5,     # Thickness of the outlier lines
    outlier.alpha = 0.7,    # Transparency
    outlier.color = "gray10"  # Change outlier color to gray
  ) +
  scale_fill_manual(values = c("2013" = "steelblue", "2021" = "goldenrod")) +
  theme_bw() +
  labs(x = "HOLC Grade", y = "Tree Canopy Cover (%)", fill = "Year") +
  theme(
    text = element_text(size = 14),
    legend.position = "bottom",
    panel.grid = element_blank(),
    panel.border = element_blank(),
    axis.line = element_line(color = "black")
  )

width <- 7
ggsave("boxplot_HOLC_TC.pdf",
       width=width,
       height=width/1.618)

ggsave("boxplot_HOLC_TC.png",
       width=width,
       height=width/1.618)

kruskal.test(TC ~ HOLC_grade, data = subset(TC_boxplot, Year=="2013"))
kruskal.test(TC ~ HOLC_grade, data = subset(TC_boxplot, Year=="2021"))

dunnTest(TC ~ HOLC_grade, data = subset(TC_boxplot, Year == "2013"), method = "bonferroni")
dunnTest(TC ~ HOLC_grade, data = subset(TC_boxplot, Year == "2021"), method = "bonferroni")

### Impervious Surfaces

imperv_boxplot$Year <- as.factor(imperv_boxplot$Year)
imperv_boxplot$HOLC_grade <- as.factor(imperv_boxplot$HOLC_grade)
imperv_boxplot$Imperv <- as.numeric(imperv_boxplot$Imperv)

imperv_boxplot %>% 
  filter(Year==2013 & HOLC_grade == "A") %>% 
  summarize(median_imperv = median(Imperv, na.rm = TRUE))

imperv_boxplot %>% 
  filter(Year==2021 & HOLC_grade == "A") %>% 
  summarize(median_imperv = median(Imperv, na.rm = TRUE))

imperv_boxplot %>% 
  filter(Year==2013 & HOLC_grade == "B") %>% 
  summarize(median_imperv = median(Imperv, na.rm = TRUE))

imperv_boxplot %>% 
  filter(Year==2021 & HOLC_grade == "B") %>% 
  summarize(median_imperv = median(Imperv, na.rm = TRUE))

imperv_boxplot %>% 
  filter(Year==2013 & HOLC_grade == "C") %>% 
  summarize(median_imperv = median(Imperv, na.rm = TRUE))

imperv_boxplot %>% 
  filter(Year==2021 & HOLC_grade == "C") %>% 
  summarize(median_imperv = median(Imperv, na.rm = TRUE))

imperv_boxplot %>% 
  filter(Year==2013 & HOLC_grade == "D") %>% 
  summarize(median_imperv = median(Imperv, na.rm = TRUE))

imperv_boxplot %>% 
  filter(Year==2021 & HOLC_grade == "D") %>% 
  summarize(median_imperv = median(Imperv, na.rm = TRUE))


boxplot_HOLC_imperv <- ggplot(imperv_boxplot, aes(x = HOLC_grade, y = Imperv, fill = Year)) +
  geom_boxplot(
    outlier.shape = "|",    # Vertical line shape for outliers
    outlier.size = 0.5,     # Thickness of the outlier lines
    outlier.alpha = 0.7,    # Transparency
    outlier.color = "gray10"  # Change outlier color to gray
  ) +
  scale_fill_manual(values = c("2013" = "steelblue", "2021" = "goldenrod")) +
  theme_bw() +
  labs(x = "HOLC Grade", y = "Impervious Surfaces (%)", fill = "Year") +
  theme(
    text = element_text(size = 14),
    legend.position = "bottom",
    panel.grid = element_blank(),
    panel.border = element_blank(),
    axis.line = element_line(color = "black")
  )

width <- 7
ggsave("boxplot_HOLC_imperv.pdf",
       width=width,
       height=width/1.618)

ggsave("boxplot_HOLC_imperv.png",
       width=width,
       height=width/1.618)

kruskal.test(Imperv ~ HOLC_grade, data = subset(imperv_boxplot, Year=="2013"))
kruskal.test(Imperv ~ HOLC_grade, data = subset(imperv_boxplot, Year=="2021"))

dunnTest(Imperv ~ HOLC_grade, data = subset(imperv_boxplot, Year == "2013"), method = "bonferroni")
dunnTest(Imperv ~ HOLC_grade, data = subset(imperv_boxplot, Year == "2021"), method = "bonferroni")


########################################################################################################
########################################################################################################


data <- data %>% 
  mutate(
    grade_high = case_when(
      grade == "A" ~ 1,
      grade %in% c("B", "C", "D") ~ 0  # Use %in% instead of ==
    ), 
    grade_int = case_when(
      grade == "B" ~ 1,
      grade %in% c("A", "C", "D") ~ 0  # Use %in% instead of ==
    ),
    grade_low = case_when(
      grade %in% c("C", "D") ~ 1,      # Use %in% for multiple values
      grade %in% c("A", "B") ~ 0
    )
  )

data <- data %>% 
  mutate(
    grade_high2 = case_when(
      grade == "A" ~ 1,
      grade %in% c("B", "C", "D") ~ 0  
    ), 
    grade_low2 = case_when(
      grade %in% c("B", "C", "D") ~ 1,      
      grade %in% c("A") ~ 0
    )
  )

## standardization
data <- data %>% mutate(temp2013_mean = temp2013_mean/sd(temp2013_mean))
data <- data %>% mutate(tree2013_mean = tree2013_mean/sd(tree2013_mean))
data <- data %>% mutate(imperv2013_mean = imperv2013_mean/sd(imperv2013_mean))
data <- data %>% mutate(house_density_2013 = house_density_2013/sd(house_density_2013))
data <- data %>% mutate(pop_density_2013 = pop_density_2013/sd(pop_density_2013))

data <- data %>% mutate(temp2021_mean = temp2021_mean/sd(temp2021_mean))
data <- data %>% mutate(tree2021_mean = tree2021_mean/sd(tree2021_mean))
data <- data %>% mutate(imperv2021_mean = imperv2021_mean/sd(imperv2021_mean))
data <- data %>% mutate(house_density_2021= house_density_2021/sd(house_density_2021))
data <- data %>% mutate(pop_density_2021 = pop_density_2021/sd(pop_density_2021))
data <- data %>% mutate(building_density_2021 = building_density_2021/sd(building_density_2021))
data <- data %>% mutate(building_area_2021 = building_area_2021/sd(building_area_2021))

## Regression

## 2021

cor_matrix_2021 <- cor(data[, c("temp2021_mean", "tree2021_mean", "imperv2021_mean", "house_density_2021", "pop_density_2021",
                                       "building_density_2021", "building_area_2021")])
cor_matrix_2021

lm_lst_2021 <- lm(temp2021_mean ~ grade_int + grade_low + tree2021_mean + house_density_2021 , data=data)
summary(lm_lst_2021)
vif(lm_lst_2021)

lm_tc_2021 <- lm(tree2021_mean ~ grade_int + grade_low + imperv2021_mean , data=data)
summary(lm_tc_2021)
vif(lm_tc_2021)

mod_lavann_2021_v1 <- 'temp2021_mean ~ A*tree2021_mean + E*grade_int + F*grade_low + building_area_2021
                       tree2021_mean ~ G*grade_int + H*grade_low + imperv2021_mean 
                       
                       indirect  := G * A + H * A
                       direct    := E + F
                       total     := indirect + direct'


run_2021_v1 <- sem(mod_lavann_2021_v1, data=data, se = "bootstrap", bootstrap = 5000)
summary(run_2021_v1, fit.measures=TRUE, standardized=TRUE) # Model for Tree Cover
round(fitMeasures(run_2021_v1, "cfi"), 4)

semPaths(run_2021_v1, "model", "est", edge.color="Black", layout="tree2", label.cex=1.5, edge.label.cex=0.8, 
         edge.label.position = 0.6)

mod_lavann_2021_v2 <- 'temp2021_mean ~ A*tree2021_mean + E*grade_int + F*grade_low + house_density_2021
                       tree2021_mean ~ G*grade_int + H*grade_low + imperv2021_mean 
                       
                       indirect  := G * A + H * A
                       direct    := E + F
                       total     := indirect + direct'


run_2021_v2 <- sem(mod_lavann_2021_v2, data=data, se = "bootstrap", bootstrap = 1000)
summary(run_2021_v2, fit.measures=TRUE, standardized=TRUE)
round(fitMeasures(run_2021_v2, "cfi"), 10)

semPaths(run_2021_v2, "model", "est", edge.color="Black", layout="tree2", label.cex=1.5, edge.label.cex=0.8, 
         edge.label.position = 0.6)

mod_lavann_2021_v3 <- 'temp2021_mean ~ A*imperv2021_mean + E*grade_int + F*grade_low + pop_density_2021
                       imperv2021_mean ~ G*grade_int + H*grade_low + building_density_2021  # Model for Impervious Surfaces
                       
                       # Indirect effects
                       indirect_imper := G*A + H*A 
                        
                       # Direct effect
                       direct := E + F
                        
                       # Total effects
                       total := G*A + H*A + E + F'

run_2021_v3 <- sem(mod_lavann_2021_v3, data=data, se = "bootstrap", bootstrap = 5000)
summary(run_2021_v3, fit.measures=TRUE, standardized=TRUE)
round(fitMeasures(run_2021_v3, "cfi"), 4)

mod_lavann_2021_v4 <- 'temp2021_mean ~ A*imperv2021_mean + E*grade_int + F*grade_low +building_area_2021
                       imperv2021_mean ~ G*grade_int + H*grade_low + house_density_2021
                       
                       # Indirect effects
                       indirect_imper := G*A + H*A 
                        
                       # Direct effect
                       direct := E + F
                        
                       # Total effects
                       total := G*A + H*A + E + F'

run_2021_v4 <- sem(mod_lavann_2021_v4, data=data)
summary(run_2021_v4, fit.measures=TRUE, standardized=TRUE)
