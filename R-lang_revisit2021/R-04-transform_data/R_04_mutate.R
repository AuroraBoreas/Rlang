# mutate
# >> what: add new columns based on a given column
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
             CAUSE,
             STARTDATED)

df <- filter(df,
             TOTALACRES>=1000 & CAUSE %in% c("Human", "Natural"))

# lubridate::yday() returns the day of the year
df <- mutate(df,
             DOY=yday(as.Date(df$STARTDATED, format="%m/%d/%y%H:%M")))

View(df)