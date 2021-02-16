# spread
# >> what: opposite against gather
# >> how:

# get sample data
# install.packages("devtools")
# library("devtools")
# devtools::install_github("garrettgman/DSR")
library(DSR)
library("tidyr")
View(table2)

table2b <- spread(table2, key=type, value=count)

View(table2b)
