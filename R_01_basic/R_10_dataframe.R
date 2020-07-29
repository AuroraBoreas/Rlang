# what is data.frame? it's similar with pandas dataframe. ----
# simply saying, it is combination of lists
# normally dont create data.frame() to create practical dataframe, import from source data
name <- c("Anne", "Pete", "Frank", "Julia", "Cath")
age <- c(28, 30, 21, 39, 35)
child <- c(FALSE, TRUE, TRUE, FALSE, TRUE)
df <- data.frame(name, age, child)
str(df)
df

# nameing
names(df) <- c("Name", "Age", "Child")
df
# or
df <- data.frame(Name=name, Age=age, Child=child)
df
# characters or strings are stored in dataframe as vector
is.vector(df$Name)
is.vector(df$Age)
is.vector(df$Child)

# retrieve data from dataframe, just like matrix
df$Name[1]
df[2, 3]
df[, "Child"]
# but differs with matrix, a single index will... give a subset(dataframe)
df[2]
is.data.frame(df[2])
df["Age"]
is.data.frame(df["Age"])
# add column
df$Height <- c(163, 177, 163, 163, 157)
df
# remove column
df["Height"] <- NULL
df
# add row. rbind(), cbind() behave like reference type.
rbind(df, data.frame(Name="Tom", Age=37, Child=FALSE))
df
# nrow() returns row numbers of a dataframe, likewise ncol() return columns of a dataframe
nrow(df)
ncol(df)
# remove row
df <- df[-nrow(df),]
df
# sort or order
sort(df$Age)
ranks <- order(df$Age)
ranks
df$Age
