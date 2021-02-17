# using geom_violin() to create violin plot

library(tidyverse)
src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"

df <- read_csv(src,
               col_types=list(UNIT=col_character()),
               col_names=TRUE) %>%
  select(ORGANIZATI,STATE,YEAR_,TOTALACRES,CAUSE) %>%
  filter(TOTALACRES>=5000) %>%
  group_by(ORGANIZATI)

# create a basic violin plot;
df %>% ggplot(aes(x=ORGANIZATI, y=log(TOTALACRES))) +
       geom_violin()

# add the individual observations using geom_jitter();
df %>% ggplot(aes(x=ORGANIZATI, y=log(TOTALACRES), color=ORGANIZATI)) +
  geom_violin() +
  geom_jitter(height=0, width=0.1)

# add means using stat_summary();
df %>% ggplot(aes(x=ORGANIZATI, y=log(TOTALACRES), color=ORGANIZATI)) +
  geom_violin() +
  geom_jitter(height=0, width=0.1) +
  stat_summary(fun=mean,geom="point",size=3, color='red')

# using box_plot() to add mean and IQR;
df %>% ggplot(aes(x=ORGANIZATI, y=log(TOTALACRES), color=ORGANIZATI)) +
  geom_violin() +
  geom_boxplot(width=.8)
