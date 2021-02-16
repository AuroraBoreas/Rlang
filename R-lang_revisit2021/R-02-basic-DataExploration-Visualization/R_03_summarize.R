# library
library("tidyverse")
# src
src <- "/Users/zhangliang/Desktop/R-00-exercise/Data/Crime_Data.csv"
# load
dfCrime = read_csv(src)
# View
View(dfCrime)
# rename
dfCrime1 = select(dfCrime,
                  'CrimeDate'='Reported Date', 
                  'Category'='Crime Subcategory', 
                  'Description'='Primary Offense Description',
                  'Precinct',
                  'Sector',
                  'Beat',
                  'Neighborhood')
View(dfCrime1)

# group_by
dfCrime2 = group_by(dfCrime1, Beat)
dfCrime3 = summarise(dfCrime2, n=n())
# head
head(dfCrime3)
