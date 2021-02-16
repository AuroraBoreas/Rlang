# using readr to load src data;
library("readr")
# readr::read_csv() is preferred over builtin functions in R; faster, safer;
src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/StudyArea.csv"
#df <- read_csv(src,
#               col_types=cols(.default='c'),
#               col_names=TRUE)
#df <- read_csv(src,
#               col_names=TRUE)
#View(df)
#problems(df)

df <- read_csv(src,
               col_names=TRUE,
               col_types=list(UNIT=col_character()))

problems(df)
