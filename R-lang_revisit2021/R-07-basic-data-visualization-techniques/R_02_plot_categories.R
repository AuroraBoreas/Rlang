# using geom_text() or geom_label() to adjust labels

library(tidyverse)

src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"
df <- read_csv(src, 
               col_types=list(UNIT=col_character()),
               col_names=TRUE) %>%
      select(ORGANIZATI, STATE, YEAR_, TOTALACRES, CAUSE) %>%
      group_by(STATE, YEAR_)

sm <- summarize(df, totalacres=sum(TOTALACRES))

sm %>% ggplot(aes(x=YEAR_,y=totalacres, color=STATE)) + 
       geom_point(aes(color=STATE)) + 
       stat_smooth(method=lm, se=FALSE)

sm %>% ggplot(aes(x=YEAR_,y=log(totalacres))) + 
       geom_point() + 
       geom_smooth(method=loess, se=TRUE) + 
       geom_text(aes(label=STATE), size=3)

# using check_overlap=TRUE parameter to remove any overlapping labels; 
sm %>% ggplot(aes(x=YEAR_,y=log(totalacres))) + 
       geom_point() + 
       geom_smooth(method=loess, se=TRUE) + 
       geom_text(aes(label=STATE), size=3, check_overlap=TRUE)

sm %>% ggplot(aes(x=YEAR_,y=log(totalacres))) + 
       geom_point() + 
       geom_smooth(method=loess, se=TRUE) + 
       geom_text(aes(label=STATE), size=2, check_overlap=TRUE)

# using nudge_x, nudge_y to move the labels relative to points

sm %>% ggplot(aes(x=YEAR_,y=log(totalacres))) + 
       geom_point() + 
       geom_smooth(method=loess, se=TRUE) + 
       geom_text(aes(label=STATE), size=2, check_overlap=TRUE, nudge_x=1.0)

# adding color to labels
sm %>% ggplot(aes(x=YEAR_,y=log(totalacres))) + 
       geom_point() + 
       geom_smooth(method=loess, se=TRUE) + 
       geom_text(aes(label=STATE, color=STATE), size=2, check_overlap=TRUE, nudge_x=1.0)

# using labs() to add subtitle and caption
sm %>% ggplot(aes(x=YEAR_,y=log(totalacres))) + 
       geom_point() + 
       geom_smooth(method=loess, se=TRUE) + 
       labs(title=paste("Acreage burned by wildfires has increased in last decades"),
            subtitle=paste("1980-2016"),
            caption="From USGS")

# using scale_x_continuous() and scale_y_continuous() to label x, y axis;
sm %>% ggplot(aes(x=YEAR_,y=log(totalacres))) + 
       geom_point() + 
       geom_smooth(method=loess, se=TRUE) + 
       labs(title=paste("Acreage burned by wildfires has increased in last decades"),
            subtitle=paste("1980-2016"),
            caption="From USGS") +
       scale_x_continuous(name="Log of total acres burnt") +
       scale_y_continuous(name="Burnt year")

# using theme() to control the location of legend, legend.position controls position;
# using guides() to provide additional control, like number of rows, size of symbols;
sm %>% ggplot(aes(x=YEAR_,y=log(totalacres),color=STATE)) + 
       geom_point() + 
       labs(title=paste("Acreage burned by wildfires has increased in last decades"),
            subtitle=paste("1980-2016"),
            caption="From USGS") +
       scale_x_continuous(name="Log of total acres burnt") +
       scale_y_continuous(name="Burnt year") +
       theme(legend.position="bottom")

# setting legend.position="none" to remove legend;
sm %>% ggplot(aes(x=YEAR_,y=log(totalacres),color=STATE)) + 
       geom_point() + 
       labs(title=paste("Acreage burned by wildfires has increased in last decades"),
            subtitle=paste("1980-2016"),
            caption="From USGS") +
       scale_x_continuous(name="Log of total acres burnt") +
       scale_y_continuous(name="Burnt year") +
       theme(legend.position="nono")

# using guides() to change number of rows, symbol size of legend 
sm %>% ggplot(aes(x=YEAR_,y=log(totalacres),color=STATE)) + 
  geom_point() + 
  labs(title=paste("Acreage burned by wildfires has increased in last decades"),
       subtitle=paste("1980-2016"),
       caption="From USGS") +
  scale_x_continuous(name="Log of total acres burnt") +
  scale_y_continuous(name="Burnt year") +
  theme(legend.position="bottom") +
  guides(color=guide_legend(nrow=2,override.aes=list(size=4)))

# using facet_wrap() and facet_grid() to split categorical variables into subsets("facet");

sm %>% ggplot(aes(x=YEAR_,y=log(totalacres),color=STATE)) + 
  geom_point() + 
  facet_wrap(~STATE) +
  geom_smooth(method=loess, se=TRUE)

# using them_xxx() function to style non-data elements in the plot
# theme_bw()
# theme_classic()
# theme_dark()
# theme_gray()
# theme_light()
# theme_linedraw()
# theme_minimal()
# theme_void()

sm %>% ggplot(aes(x=YEAR_,y=log(totalacres),color=STATE)) + 
  geom_point() + 
  facet_wrap(~STATE) +
  geom_smooth(method=loess, se=TRUE) +
  theme_dark()
