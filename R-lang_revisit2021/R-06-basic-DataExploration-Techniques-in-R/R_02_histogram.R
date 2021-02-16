library(tidyverse)

src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"
df <- read_csv(src, 
               col_types=list(UNIT=col_character()),
               col_names=TRUE) %>%
      select(ORGANIZATI, STATE, YEAR_, TOTALACRES, CAUSE) %>%
      filter(TOTALACRES>=1000)
ggplot(df) + geom_histogram(mapping=aes(x=TOTALACRES), binwidth = 5000, fill='blue')

df %>% count(cut_width(TOTALACRES, 5000))
