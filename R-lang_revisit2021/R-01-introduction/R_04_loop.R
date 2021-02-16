# loop
# >> looping statements are NOT used as much in R;
# >> because R has builtin support for "vectorization";
# >> what is "vectorization"?
# >> just like apply() in pandas

# for-loop
a <- c(1, 2, 3, 4, 5)
for(i in a)
{
    print(i)
}

# while-loop
i = 1
while(i < length(a) + 1)
{
    if (i == 3) { next }
    print(a[i])
    i = i + 1
}

# repeat-loop
i = 1
repeat
{
    print(a[i])
    i = i + 1
    if(i > 3) { break }
}


