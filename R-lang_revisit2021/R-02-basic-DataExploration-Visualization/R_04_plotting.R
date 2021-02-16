library("tidyverse")
src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/Crime_Data.csv"
dfCrime <- read_csv(src)
dfCrime2 <- select(dfCrime,
                  'CrimeDate'='Reported Date',
                  'Category'='Crime Subcategory',
                  'Description'='Primary Offense Description',
                  'Precinct',
                  'Sector',
                  'Beat',
                  'Neighborhood')
dfCrime3 <- filter(dfCrime2,
                  Category=='QUEEN ANNE',
                  Neighborhood=='BURGLARY-RESIDENTIAL')

dfCrime3 <- group_by(dfCrime2, Beat)
dfCrime4 <- summarise(dfCrime3, n=n())
head(dfCrime4)

# plot
ggplot(data=dfCrime4) + geom_col(mapping=aes(x=Beat, y=n), fill='red')
