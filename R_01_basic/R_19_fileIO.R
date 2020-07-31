# read data from file ----
data <- read.csv(file=file.choose())
head(data)
tail(data)
summary(data)
plot(data)

# write data into file ----
data <- strsplit("hello world, this is data from R.", " ")
fp <- "hello.csv"
write.csv(data, fp)