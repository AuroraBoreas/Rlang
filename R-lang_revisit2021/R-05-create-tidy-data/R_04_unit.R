# unit
# >> what: combine()
# >> how:

library(readr)
library(tidyr)
src<-"/Users/zhangliang/Desktop/R-00-exercise/Data/usco2005.csv"
df<-read_csv(src,col_names = TRUE) %>%
    separate("State-County Name", into=c("StateAbbrev", "CountryName"), sep="-")
View(df)

df_unite<-unite(df, State_Country_Name, "StateAbbrev", "CountryName")
View(df_unite)
