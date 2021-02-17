# using geom_density() to create density plot;

library(tidyverse)
src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"

df <- read_csv(src,
               col_types=list(UNIT=col_character()),
               col_names=TRUE) %>%
  select(ORGANIZATI,STATE,YEAR_,TOTALACRES,CAUSE) %>%
  filter(TOTALACRES>=1000)

df %>% ggplot(aes(TOTALACRES)) +
       geom_density()

df %>% ggplot(aes(log(TOTALACRES))) + 
       geom_density()

# using geom_density_2d() to create 2D plot of data with contour;
df %>% ggplot(aes(x=YEAR_, y=log(TOTALACRES))) +
       geom_point() +
       geom_density_2d()

# using stat_density_2d() to create a 2D surface;
df %>% ggplot(aes(x=YEAR_, y=log(TOTALACRES))) +
       geom_density2d() +
       stat_density2d(geom="raster",aes(fill=..density..), contour=FALSE)
