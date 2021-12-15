options <- data.frame(
  "text_color" = character(),
  "text_size" = numeric(),
  "x_axis_name" = character(),
  "y_axis_name" = character(),
  "legend_name" = character(),
  "plot_title" = character(),
  "plot_width" = numeric(),
  "plot_height" = numeric(),
  "text_size_x_ticks" = numeric()
)
options[1,] = NA
options$text_color <- 'black'
options$text_size <- 6

theme_custom <- function (p, options){

  p <- p + theme_classic()
  p <- p + theme(legend.position = "top")
  p <- p + theme(
    text = element_text(size=options$text_size, color=options$text_color)
    )
  p <- p + theme(
    axis.text.y = element_text(size=options$text_size, color=options$text_color)
    )
  
  if(!is.na(options$text_size_x_ticks) & options$text_size_x_ticks != ""){
    p <- p + theme(axis.text.x = element_text(
      size=options$text_size_x_ticks,
      color=options$text_color
      ))
  }else{
    p <- p + theme(axis.text.x = element_text(
      size=options$text_size, color=options$text_color)
      )
  }
  
  p <- p + theme(axis.ticks.x = element_line(color = options$text_color))
  p <- p + theme(axis.ticks.y = element_line(color = options$text_color))
  p <- p + theme(axis.line = element_line(
    colour = "black", size = 1, linetype = "solid", lineend = 'butt'
      ))
  
  p <- p + theme(legend.key.size = unit(0.8,"line"))
  
  if(!is.na(options$x_axis_name) & options$x_axis_name != ''){
    p <- p + theme(axis.title.x = element_text(
      color=text_color, size=options$text_size
    ))
    p <- p + xlab(options$x_axis_name)
  }else{
    p <- p + theme(axis.title.x = element_blank())
  }
  
  if(!is.na(options$y_axis_name) & options$y_axis_name != ''){
    p <- p + theme(axis.title.y = element_text(
      color=options$text_color, size=options$text_size
    ))
    p <- p + ylab(options$y_axis_name)
  }else{
    p <- p + theme(axis.title.y = element_blank())
  }
  
  if(!is.na(options$legend_name) & options$legend_name != ''){
    p <- p + labs(fill = options$legend_name)
  }else{
    p <- p + theme(legend.title = element_blank())
  }
  
  if(!is.na(options$plot_title) & options$plot_title != ""){
    p <- p + ggtitle(options$plot_title)
    p <- p + theme(plot.title = element_text(hjust = 0.5))
  }
  
  p <- p + theme(legend.margin=margin(t = 0, unit='cm'),
                 legend.key = element_blank(),
                 legend.background=element_blank())
  return(p)
}
