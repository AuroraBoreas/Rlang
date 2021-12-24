### SSVE Pmod White Balance Trial 
### Effectiveness confirmation
### by ZL, 20211222

#require(reticulate)
require(ggplot2)
require(patchwork)
### create clean data
#reticulate::use_python('D:/DevEnv/WPy32-3741/python-3.7.4/python.exe')
#reticulate::install_miniconda()
#reticulate::py_run_file('main.py')

### premise
calc.du <- function(jnd, angle, du.target){
  return(jnd * cos(angle * pi / 180) + du.target)
}

calc.dv <- function(jnd, angle, dv.target){
  return(jnd * sin(angle * pi / 180) + dv.target)
}

jnd.ellips <- function(jnd, cTT.u, cTT.v){
  du <- c()
  dv <- c()
  for(i in 0:360){
    du <- c(du, calc.du(jnd, i, cTT.u))
    dv <- c(dv, calc.dv(jnd, i, cTT.v))
  }
  df <- data.frame(du, dv)
  colnames(df) <- c("du", "dv")
  return(df)
}

cool.jnd1 <- jnd.ellips(0.003, 0.1881, 0.4357)
cool.jnd2 <- jnd.ellips(0.006, 0.1881, 0.4357)
cool.jnd3 <- jnd.ellips(0.010, 0.1881, 0.4357)
cool.breaks.x <- seq(0.1771, 0.1991, 0.001)
cool.breaks.y <- seq(0.4247, 0.4467, 0.001)
cool.minor.x <- seq(0.1771, 0.1991, 0.0002)
cool.minor.y <- seq(0.4247, 0.4467, 0.0002)

neutral.jnd1 <- jnd.ellips(0.003, 0.1901, 0.4467)
neutral.jnd2 <- jnd.ellips(0.006, 0.1901, 0.4467)
neutral.jnd3 <- jnd.ellips(0.010, 0.1901, 0.4467)
neutral.breaks.x <- seq(0.1791, 0.2011, 0.001)
neutral.breaks.y <- seq(0.4357, 0.4577, 0.001)
neutral.minor.x <- seq(0.1791, 0.2011, 0.0002)
neutral.minor.y <- seq(0.4357, 0.4577, 0.0002)

warm.jnd1 <- jnd.ellips(0.003, 0.1939, 0.4549)
warm.jnd2 <- jnd.ellips(0.006, 0.1939, 0.4549)
warm.jnd3 <- jnd.ellips(0.010, 0.1939, 0.4549)
warm.breaks.x <- seq(0.1829, 0.2049, 0.001)
warm.breaks.y <- seq(0.4439, 0.4659, 0.001)
warm.minor.x <- seq(0.1829, 0.2049, 0.0002)
warm.minor.y <- seq(0.4439, 0.4659, 0.0002)

expert1.jnd1 <- jnd.ellips(0.003, 0.1978, 0.469)
expert1.jnd2 <- jnd.ellips(0.006, 0.1978, 0.469)
expert1.jnd3 <- jnd.ellips(0.010, 0.1978, 0.469)
expert1.breaks.x <- seq(0.1868, 0.2088, 0.001)
expert1.breaks.y <- seq(0.4580, 0.4800, 0.001)
expert1.minor.x <- seq(0.1868, 0.2088, 0.0002)
expert1.minor.y <- seq(0.4580, 0.4800, 0.0002)

### read white balance data
df.cool <- read.csv("./src/COOL.csv")
df.neutral <- read.csv("./src/NEUTRAL.csv")
df.warm <- read.csv("./src/WARM.csv")
df.expert1 <- read.csv("./src/EXPERT1.csv")
#View(df)

### plot
plot.wb <- function(df.temp, temp,
                    temp.breaks.x, temp.breaks.y,
                    temp.minor.x, temp.minor.y, 
                    temp.jnd1, temp.jnd2, temp.jnd3) {
  
  p <- ggplot(df.temp) +
    geom_point(aes(x=u,
                   y=v),
               colour="purple",
               shape=21,
               fill='white',
               stroke=.5,
               alpha=.8,
               size=2) +
  #  coord_cartesian(xlim=c(0.1771, 0.1991),
  #                  ylim=c(0.4247, 0.4467)) +
    scale_x_continuous(breaks = temp.breaks.x,
                       minor_breaks = temp.minor.x) +
    scale_y_continuous(breaks = temp.breaks.y,
                       minor_breaks = temp.minor.y) +
    labs(title=gsub(' ', '', paste('WB::', temp)),
         x="u\'",
         y="v\'") +
    theme(plot.title = element_text(size=8),
          #panel.grid.major.x = element_blank(),
          #panel.grid.major.y = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.minor.y = element_blank(),
          axis.title.x = element_text(size=8),
          axis.title.y = element_text(angle=0, size=8, vjust=0.5),
          axis.text.x = element_text(angle=90, size=5),
          axis.text.y = element_text(size=5)) +
    geom_path(data=temp.jnd1,
               aes(x=du,
                   y=dv),
               size = 0.2,
               color = 'blue'
               ) +
    geom_path(data=temp.jnd2,
               aes(x=du,
                   y=dv),
               size = 0.2,
               color = 'blue'
    ) +
    geom_path(data=temp.jnd3,
               aes(x=du,
                   y=dv),
               size = 0.2,
               color = 'red'
    )
#  dev.print(file = gsub(' ', '',paste('Rplot_', temp, '.png')),
#            device = png,
#            width = 800,
#            height = 800)
  return(p)
}

plot.save <- function(dstPath) {
  ggsave(dstPath,
        width = 10,
        height = 10,
        device = 'tiff',
        dpi = 400)
}

wb.save.cool <- './report/Rplot_A_cool.tiff'
wb.save.neutral <- './report/Rplot_B_neutral.tiff'
wb.save.warm <- './report/Rplot_C_warm.tiff'
wb.save.expert1 <- './report/Rplot_D_expert1.tiff'
wb.save.all <- './report/Rplot_wb.tiff'

### plot WB cool
p1 <- plot.wb(df.cool,
        'Cool',
        cool.breaks.x,
        cool.breaks.y,
        cool.minor.x,
        cool.minor.y, 
        cool.jnd1,
        cool.jnd2,
        cool.jnd3)

plot.save(wb.save.cool)

### plot WB neutral
p2 <- plot.wb(df.neutral,
        'Neutral',
        neutral.breaks.x,
        neutral.breaks.y,
        neutral.minor.x,
        neutral.minor.y, 
        neutral.jnd1,
        neutral.jnd2,
        neutral.jnd3)

plot.save(wb.save.neutral)


### plot WB warm
p3 <- plot.wb(df.warm,
        'Warm',
        warm.breaks.x,
        warm.breaks.y,
        warm.minor.x,
        warm.minor.y, 
        warm.jnd1,
        warm.jnd2,
        warm.jnd3)

plot.save(wb.save.warm)

### plot WB expert1
p4 <- plot.wb(df.expert1,
        'Expert1',
        expert1.breaks.x,
        expert1.breaks.y,
        expert1.minor.x,
        expert1.minor.y, 
        expert1.jnd1,
        expert1.jnd2,
        expert1.jnd3)

plot.save(wb.save.expert1)

### layout 01
p1 + p2
p3 + p4

### layout 02
(p1 | p2) /
  (p3 | p4) +
  plot_annotation(
    title = '[SSVE Pmod/SET] White Balance Confirmation',
    subtitle = '規格: u\'v\', 0.010 (3JND)',
    caption = 'Disclaimer: Non of these plots are insightful @ZL',
    tag_levels = 'A'
  )

plot.save(wb.save.all)
