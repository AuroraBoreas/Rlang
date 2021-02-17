# using ggmap() to create map from geographic data;
# >> what: geographic map/charts
# >> how: 1, download basemap("map raster");
#         this accompanies with get_map() function;

# install ggmap pkg
# install.packages("ggmap")
# ggmap() got fucked by GFW;
# using REmap() instead;

library(ggmap)
myLocation <- "Shanghai"
myMap <- get_map(myLocation, zoom=6)
