# filter
# >> what:E F M A
# >> how:

# rant: & represents "and" relationship, wtf?

library("tidyverse")
src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"
df <- read_csv(src,
               col_types=list(UNIT=col_character()),
               col_names=TRUE)
View(df)
# filter
# df25k <- filter(df, TOTALACRES>=25000, YEAR_==2016)
# OR
df25k <- filter(df, TOTALACRES>=25000 & YEAR_==2016)
View(df25k)
getwd()
