library(datasets)

datasets::iris

str(datasets::iris)

# detach(datasets::iris, unload=T)

# data : global 
# mapping : global
ggplot(data=faithful,
       mapping = aes(x=eruptions,
                     y=waiting)) +
geom_point()

# data : global
# mapping : layer
ggplot(data=faithful) +
  geom_point(mapping=aes(x=eruptions, y=waiting))

# global data : null
# mapping : layer
ggplot() +
  geom_point(mapping = aes(x=eruptions,
                           y=waiting),
             data=faithful)

# mapping : colour=eruptions<3 
ggplot(faithful) +
  geom_point(mapping = aes(x=eruptions,
                           y=waiting,
                           col=eruptions<3))
# setting color
ggplot(faithful) +
  geom_point(mapping = aes(x=eruptions,
                           y=waiting),
             col = 'steelblue')

# takeaway: take something from data, then put it inside aes(); set something, then outside

# hist
ggplot(faithful) +
  geom_histogram(mapping = aes(x=eruptions))

# layers are stacked in the order of code appearance

ggplot(faithful,
       aes(x=eruptions, y=waiting)) +
  geom_density2d() +
  geom_point()

# statistics :  linked to geometries
# default stat(istic);
# a layer can be created with a call to 
# stat_*() or geom_*(), but community has coalesced around geom_*()

# exercises

ggplot(faithful) +
  geom_point(mapping = aes(x=eruptions,
                           y=waiting),
             shape = 'square',
             alpha = .5)

# color
ggplot(faithful) +
  geom_histogram(mapping = aes(x=eruptions,
                               fill=eruptions<3))

#
ggplot(faithful) + 
  geom_histogram(mapping = aes(x=eruptions,
                               fill=waiting<60), position = 'identity', alpha=.5)

# geom_abline

ggplot(faithful) +
  geom_point(mapping = aes(x=eruptions,
                           y=waiting)) +
  geom_abline(slope = -40, intercept = 200)

# [ statistics ]
?mpg
# geom_bar using stat_count() by default
ggplot(mpg) +
  geom_bar(mapping = aes(x=class))

library(dplyr)
mpg_counted <- mpg %>%
  count(class, name='count')
mpg_counted

ggplot(mpg_counted) +
  geom_bar(mapping = aes(x=class,
                         y=count),
           stat = 'identity')

# shortcut
ggplot(mpg_counted) +
  geom_col(mapping = aes(x=class,
                         y=count))

# using after_stat() to modify mapping from stats (here we calculate %)
head(mpg)
ggplot(mpg) +
  geom_bar(
    mapping = aes(x=class,
                  y=after_stat(count/sum(count)*100))
  ) + 
  ylab("fuck cy percentage(%)")


# density
ggplot(mpg) +
  geom_density(mapping = aes(x=hwy))
head(mpg)
tail(mpg)
str(mpg)


ggplot(mpg) +
  geom_density(mapping = aes(x=hwy,
                             y=after_stat(scaled)))
?ggplot2::after_stat

ggplot(mpg) +
  stat_count(aes(x=class), geom = 'point')

head(mpg)
class(mpg)
str(mpg)

ggplot(mpg) +
  geom_jitter(aes(x=class, y=hwy), width = .2) +
  stat_summary(aes(x=class, y=hwy), fun = mean, geom = 'point', colour='red', size=2)

# scales
# scale_<aesthetic>_<type>()
# <type> can either be a generic or specific

ggplot(mpg) +
  geom_point(aes(x=displ,
                 y=hwy,
                 colour=class)) +
  scale_color_brewer(type='qual')

# bubble
ggplot(mpg) +
  geom_point(aes(x=displ,
                 y=hwy,
                 colour=class,
                 size=cyl)) +
  scale_color_brewer(type='qual') +
  scale_size_area(breaks=c(4,5,6,8))


ggplot(mpg) +
  geom_point(aes(x=displ,
                 y=hwy,
                 colour=class,
                 size=cyl)) +
  scale_size(breaks=c(4,5,6,8))

ggplot(mpg) +
  geom_point(aes(x=displ,
                 y=hwy,
                 colour=cty,
                 size=cty))

# guides, merges legend w/ the exact same name
ggplot(mpg) +
  geom_point(aes(x=displ,
                 y=hwy,
                 color=cty,
                 size=cty)) +
  guides(colour='legend')

# facets
ggplot(mpg) +
  geom_point(aes(x=displ,
                 y=hwy)) +
  facet_wrap(~class)

# graphic pivot
ggplot(mpg) + 
  geom_point(aes(x=displ,
                 y=hwy)) +
  facet_grid(year ~ drv)
