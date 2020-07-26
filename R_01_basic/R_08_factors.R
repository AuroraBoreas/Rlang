# what is Factor in R? the concept is similar with pandas dataframe categorical ----
blood <- c("B", "AB", "O", "A", "O", "O", "A", "B")
blood
# it behaves like pivot table in pandas or excel
blood_factor <- factor(blood)
blood_factor
str(blood_factor)
# by default, factor() is nominal. comparison results in error/warning
blood_factor[1] < blood_factor[2]
# changes nominal to ordinal. yeah, just like enum type in C++, VB or Python
blood_factor <- factor(blood, ordered=TRUE,
                       levels=c("A", "B", "AB", "O"))
blood_factor[1] < blood_factor[2]
