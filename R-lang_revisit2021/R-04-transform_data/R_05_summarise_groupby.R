# group_by()
# >> what: pivot
# >> how:
library("lubridate")
library("tidyverse")
src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"
df <- read_csv(src,
               col_types=list(UNIT=col_character()),
               col_names=TRUE)

df <- select(df,
             ORGANIZATI,
             STATE,
             YEAR_,
             TOTALACRES,
             CAUSE)

df1k <- filter(df, TOTALACRES>=1000)

df1k <- mutate(df1k, 
               DECADE=ifelse(YEAR_ %in% 1980:1989, "1980-1989",
                             ifelse(YEAR_ %in% 1990:1999, "1990-1999", 
                                    ifelse(YEAR_ %in% 2000:2009, "2000-2009",
                                           ifelse(YEAR_ %in% 2010:2016, "2010-2016", "-99")))))

View(df1k)

grp <- group_by(df1k, DECADE)
sm <- summarise(grp, mean(TOTALACRES))
view(sm)
# rename columns
names(sm) <- c("DECADE", "MEANS_ACRES_BURNT")
# plot
ggplot(sm) + geom_col(mapping=aes(x=DECADE, y=MEANS_ACRES_BURNT), fill='red')
