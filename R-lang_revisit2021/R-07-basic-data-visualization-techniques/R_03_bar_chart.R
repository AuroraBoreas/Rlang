# using geom_bar() or geom_chart() to create bar charts;
# >> difference: geom_bar() will generate count instead of var;
#           geom_bar() changes statistic that has alrdy been generated for the group;

# using geom_col() to keep the variable alrdy generated for the group;

library(tidyverse)
src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"

df <- read_csv(src,
               col_types=list(UNIT=col_character()),
               col_names=TRUE) %>%
      select(ORGANIZATI,STATE,YEAR_,TOTALACRES,CAUSE) %>%
      filter(STATE="California") %>%
      group_by(YEAR_)

# plot

# notice: geom_bar() auto-generates count per year;
df %>% ggplot(mapping=aes(x=YEAR_)) +
       geom_bar(fill='red')

# compared with geom_col()
df %>% ggplot(mapping=aes(x=YEAR_, y=TOTALACRES)) +
       geom_col(fill='red')
