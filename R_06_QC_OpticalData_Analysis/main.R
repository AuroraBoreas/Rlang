fm65 <- read.table(file = "clipboard", sep = "\t", header=TRUE)
fm75 <- read.table(file = "clipboard", sep = "\t", header=TRUE)
fm85 <- read.table(file = "clipboard", sep = "\t", header=TRUE)

# df <- data.frame(fm65, fm75, fm85)

fm_lv_plot <- function(data, pmod_name, ylim) {
  p <- ggplot(data) +
    geom_histogram(aes(Lv), bins=12, fill='blue', alpha=0.5) +
    scale_y_continuous(breaks = seq(0, ylim, 2), 
                       minor_breaks = seq(0, ylim, 2)) +
    scale_x_continuous(breaks = seq(150, 1500, 20), 
                       minor_breaks = seq(150, 1500, 20)) +
    labs(title = gsub(' ', '', 
                      paste(pmod_name,'::Lv (N=', length(data$Lv), ')'))) +
    theme(axis.text.x = element_text(size=11),
          axis.text.y = element_text(size=11))
  
  return(p)
}

fm_lv_plot(fm65, "FM65", 25)
fm_lv_plot(fm75, "FM75", 25)
fm_lv_plot(fm85, "FM85", 25)