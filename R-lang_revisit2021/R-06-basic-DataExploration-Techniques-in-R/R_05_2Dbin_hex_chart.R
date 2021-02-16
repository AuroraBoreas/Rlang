library(tidyverse)

src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"
df <- read_csv(src, 
               col_types=list(UNIT=col_character()),
               col_names=TRUE)

df %>% ggplot() + geom_bin2d(mapping=aes(x=YEAR_, y=TOTALACRES))

df %>% ggplot() + geom_hex(mapping=aes(x=YEAR_, y=TOTALACRES))
