# 
# >> what:
# >> how:

library(tidyverse)

src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"

df <- read_csv(src,
               col_types=list(UNIT=col_character()),
               col_names=TRUE) %>%
  select(STATE,YR=YEAR_,ACRES=TOTALACRES,CAUSE) %>%
  filter(ACRES>=1000) %>%
  group_by(STATE, YR) %>%
  summarise(n=n()) 

View(df)

df %>% ggplot(aes(x=YR,y=n)) +
  geom_point() +
  facet_wrap(~STATE) +
  geom_smooth(method=lm,se=TRUE) +
  ggtitle("Large fires became more Common in the west: 1980-2016") +
  xlab("YEAR") + 
  ylab("Numbers of wildfire")

