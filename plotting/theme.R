p <- p + theme_classic()

p <- p + theme(legend.position = "top")
p <- p + theme(text = element_text(size=12, color="black"))
p <- p + theme(axis.text.y = element_text(size=12, color="black"))
p <- p + theme(axis.text.x = element_text(size=12, color="black"))
p <- p + theme(axis.line = element_line(
  colour = "black", size = 1, linetype = "solid", lineend = 'butt'))
p <- p + theme(legend.key.size = unit(0.8,"line"))
p <- p + theme(axis.ticks.x = element_line(color = "black"))
p <- p + theme(axis.ticks.y = element_line(color = "black"))
p <- p + theme(legend.title = element_blank())
p <- p + theme(legend.margin=margin(t = 0, unit='cm'),
               legend.key = element_blank(),
               legend.background=element_blank())