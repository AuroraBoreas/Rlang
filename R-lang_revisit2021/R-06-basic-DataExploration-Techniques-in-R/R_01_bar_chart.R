#
# >> what:
# >> how:
# install.packages("tidyverse")
library("tidyverse")

src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"
df <- read_csv(src, 
               col_types=list(UNIT=col_character()),
               col_names=TRUE) %>%
      filter(TOTALACRES>=1000 & YEAR_ %in% 2010:2016)
ggplot(df) + geom_bar(mapping=aes(x=YEAR_), fill='green')

View(count(df, YEAR_))
