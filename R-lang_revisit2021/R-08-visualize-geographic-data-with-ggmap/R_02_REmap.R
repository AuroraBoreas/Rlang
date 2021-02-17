# using REmap pkg to plot geographic map;
# >> it has the following functions;
#      remap();
#      remapB();
#      remapC();
#      remapH();

# install.packages("devtools")
# library(devtools)
# devtools::install_github("lchiffon/REmap")

library(REmap)
library(arulesViz)
# remap()
set.seed(125)
out <- remap(demoC,title = "REmap",subtitle = "theme:Dark")
plot(out)

# remapB()
geoData <- get_geo_position(unique(demoC[demoC==demoC]))
remapB(markLineData = demoC,geoData = geoData)

# remapC()
data <- data.frame(country = mapNames("world"),
                  value = 5*sample(178)+200)
out <- remapC(data,maptype = "world",color = 'skyblue')
plot(out)