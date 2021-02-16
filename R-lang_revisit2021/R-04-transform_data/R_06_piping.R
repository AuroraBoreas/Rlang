# piping
# >> what: it is an efficient way to handle intermediate, temporary datasets;
# >> syntax: %>%
# >> why: like chaining intermediate/temporary datasets in pandas using the "." symbol

library("lubridate")

df = read_csv(src,
              col_types=list(UNIT=col_character()),
              col_names=TRUE) %>%
     select(ORGANIZATI, STATE, YEAR_, TOTALACRES, CAUSE) %>%
     filter(TOTALACRES>=1000 & CUASE %in% c("Human", "Natural")) %>%
     mutate(DOY=yday(as.Date(STARTDATED, format="%m/%d/%y%H:%M")))

View(df)
