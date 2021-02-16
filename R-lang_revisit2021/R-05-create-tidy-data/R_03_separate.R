# separate
# >> what: just like split()
# >> how:
library(DSR)
library(readr)
library(tidyr)
View(table3)
# separate
table3b <- separate(table3, rate, into=c("cases", "population"), sep="/")

View(table3b)

src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/usco2005.csv"
df <- read_csv(src, col_names = TRUE) %>%
  separate("State-County Name", into=c("StateAbbrev", "CountryName"), sep="-")

View(df)