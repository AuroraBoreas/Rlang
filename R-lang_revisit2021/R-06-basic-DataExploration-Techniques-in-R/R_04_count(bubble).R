library(tidyverse)

src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"
df <- read_csv(src, 
               col_types=list(UNIT=col_character()),
               col_names=TRUE) %>%
      filter(CAUSE=="Human" | CAUSE=="Natural") %>%
      group_by(ORGANIZATI)
View(df)

df %>% ggplot() + geom_count(mapping=aes(x=ORGANIZATI, y=CAUSE))

df %>% count(ORGANIZATI, CAUSE)
