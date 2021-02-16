# select
# >> what: choose columns then combine

library("tidyverse")
src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"
df <- read_csv(src,
               col_types=list(UNIT=col_character()),
               col_names=TRUE)

# df <- select(df,
#             FIRENAME,
#             TOTALACRES,
#             YEAR_)

# using select to rename
df <- select(df,
             "FIRE"="FIRENAME",
             "ACRES"="TOTALACRES",
             "YEAR"="YEAR_",
             cotains("DATE"),
             starts_with("TOTAL"))

# helper functions:
# starts_with(), ends_with(), contains(),
# matches(), num_range();

head(df)