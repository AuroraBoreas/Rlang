#
# >> what:
# >> how:
library(tidyverse)

src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"
df <- read_csv(src, 
               col_types=list(UNIT=col_character()),
               col_names=TRUE) %>%
      select(ORGANIZATI, STATE, YEAR_, TOTALACRES, CAUSE) %>%
      group_by(YEAR_)

sm <- summarize(df, totalacres=sum(TOTALACRES))

sm %>% ggplot() + 
       geom_point(mapping=aes(x=YEAR_, y=totalacres))

sm %>% ggplot() + 
       geom_point(mapping=aes(x=YEAR_, y=log(totalacres)))

# using geom_smooth() or stat_smooth() to control a regression line;
# method=lm, means straight line
# method=loess, means 
# se=TRUE, means adding confidential area around regress line;

sm %>% ggplot(mapping=aes(x=YEAR_, y=log(totalacres))) + 
       geom_point() + 
       geom_smooth(method=lm, se=FALSE)

sm %>% ggplot(mapping=aes(x=YEAR_, y=log(totalacres))) + 
       geom_point() + 
       geom_smooth(method=loess, se=FALSE)

sm %>% ggplot(mapping=aes(x=YEAR_, y=log(totalacres))) + 
       geom_point() + 
       geom_smooth(method=loess, se=TRUE)
