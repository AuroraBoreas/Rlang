# tidy data
# >> what: 1, each var has its own column;
#          2, each observation has its own row;
#          3, each value has its own cell;

# >> how: gathering %>% spreading %>% separating %>% uniting

library("readr")
library("tidyr")
src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/CountryPopulation.csv"

df <- read_csv(src, col_names=TRUE) %>%
      gather('2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017',
             key='YEAR', value='POPULATION')

View(df)
