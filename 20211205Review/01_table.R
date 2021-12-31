df <- data.frame('name'=c('zl', 'cy', 'll'),
                 'position'=c('A', 'B', 'C'),
                 'points'=c(2, 1, 2))

table(df$position)

options(digits = 2)
prop.table(table(df$position))

# table of two variables
table(df$position, df$points)
prop.table(table(df$position, df$points))

# table of three variables
table(df$name, df$position, df$points)

plot(prop.table(table(df$position, df$points)))
