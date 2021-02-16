library("tidyverse")
src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/Crime_Data.csv"
dfCrime <- read_csv(src, col_names=TRUE)
# View(dfCrime)
dfCrime <- select(dfCrime,
                  'CrimeDate'='Reported Date',
                  'Category'='Crime Subcategory',
                  'Description'='Primary Offense Description',
                  'Precinct',
                  'Sector',
                  'Beat',
                  'Neighborhood')

dfCrime2 <- filter(dfCrime,
                   Category=='BURGLARY-RESIDENTIAL',
                   Neighborhood=='QUEEN ANNE')

# dfCrime3 <- mutate(dfCrime2,
                #    YEAR=year(as.Date(dfCrime2$CrimeDate,
                #                      format='%m/%d/%Y')))
dfCrime3 <- mutate(dfCrime2,
                   MONTH=month(as.Date(dfCrime2$CrimeDate,
                                     format='%m/%d/%Y')))

# dfCrime4 <- group_by(dfCrime3, YEAR)
dfCrime4 <- group_by(dfCrime3, MONTH)
View(dfCrime4)
dfCrime4 <- summarise(dfCrime4, n=n())
# View(dfCrime4)
ggplot(dfCrime4) + geom_col(mapping=aes(x=MONTH, y=n), fill='red')
