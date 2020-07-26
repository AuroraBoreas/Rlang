# what is list in R? ---- it contains any object in R, and also no coercion. perfect!
song_list <- list("Rsome times", 190, 5)
song_list
is.list(song_list)

# naming
names(song_list) <- c("title", "duration", "track")
song_list

# retrieve element(s)
str(song_list)
length(song_list)
song_list$title
song_list$duration
song_list$track

# loop through a list. just like loop in C++. straightforward
for(i in song_list)
{
  print(i)
}

# subset and extend lists ----
similar_song <- list(title="R you on time?", duration=230)
song <- list(title="Rsome times",
             duration=190,
             track=5,
             similar=similar_song)
song
# retrieve info from subset by names. easy way
song[["title"]]
song$similar$duration
# but with index... some_list[index] returns a list(subset), some_list[[index]] returns a single pristine data
song[1]
is.list(song[1])
song[[1]]
is.list(song[[1]])
typeof(song[[1]])
# add an element into a list
song$friends <- c("ZL", "Helloworld", "Python", "C++", "VB")
str(song)
# or 
song[["sent"]] <- list("nihao", "hello", "konichiha", "bonjour")
song
# remove an element from a list
song$duration <- NULL
song
str(song)
