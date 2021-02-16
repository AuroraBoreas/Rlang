library(tidyverse)

src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"
df <- read_csv(src, 
               col_types=list(UNIT=col_character()),
               col_names=TRUE) %>%
      filter(TOTALACRES >= 5000 & TOTALACRES <=10000) %>%
      group_by(ORGANIZATI)
View(df)


df %>% ggplot(mapping=aes(x=ORGANIZATI, y=TOTALACRES)) + geom_boxplot()
