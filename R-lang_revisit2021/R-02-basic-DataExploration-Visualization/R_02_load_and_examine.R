# install.packages("tidyverse")
library("tidyverse")
# src file
src_file <- "/Users/zhangliang/Desktop/R-00-exercise/Data/Crime_Data.csv"
# load
dfCrime <- read_csv(src_file)
# nrow
nrow(dfCrime)
# View
View(dfCrime)

# select
sdfCrime = select(dfCrime, 
                  'Reported Date', 'Crime Subcategory', 
                  'Primary Offense Description',
                  'Precinct',
                  'Sector',
                  'Beat',
                  'Neighborhood')

# View again
View(sdfCrime)

# rename columns to friendly names
rsdfCrime = select(dfCrime,
                   'CrimeDate'='Reported Date', 
                   'Category'='Crime Subcategory', 
                   'Description'='Primary Offense Description',
                   'Precinct',
                   'Sector',
                   'Beat',
                   'Neighborhood')
# View again
View(rsdfCrime)

# filter
dfCrime1 = filter(dfCrime, Neighborhood=='QUEEN ANNE')
# View
View(dfCrime1)
# nrow
nrow(dfCrime1)

# filter
dfCrime2 = filter(rsdfCrime,
                  Neighborhood=='QUEEN ANNE', 
                  Category=='BURGLARY-RESIDENTIAL')
# View
View(dfCrime2)
