# arrange()
# >> what: ordering columns
# >> how:

library("tidyverse")
src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"
df <- read_csv(src,
               col_types=list(UNIT=col_character()),
               col_names=TRUE)


df1k <- filter(df,
               TOTALACRES>=1000,
               YEAR_==2016)

# sort, asc
df1k_sorted = arrange(df1k, TOTALACRES)
# desc() helper function reverses ordering
df1k_sorted2 <- arrange(df1k, desc(TOTALACRES))

head(df1k_sorted)

View(df1k_sorted)
View(df1k_sorted2)
