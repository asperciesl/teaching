library(tidyverse)
library(ggsignif)

data <- read.table(
  "csv/expression.csv",
  header = TRUE,
  quote = '"',
  stringsAsFactors = FALSE,
  sep = ","
)

data_ttest <- data.frame(Cell.Line  = character(), Protein = character(), p.val = numeric(), stringsAsFactors =  FALSE)
data_ratios <- data.frame(Cell.Line = character(), Protein = character(), Ratio = numeric(), stringsAsFactors = FALSE)
i <- 1
j <- 1
for(Cell.Line in unique(data$Cell.Line)){
  for(Protein in unique(data$Protein)){
    subset <- data[which(data$Cell.Line == Cell.Line & data$Protein == Protein), ]
    subset_EVC <- subset[which(subset$Vector == "EVC"), ]
    subset_PGRMC1 <- subset[which(subset$Vector == "PGRMC1"), ]
    data_ttest[i, "Cell.Line"] <- Cell.Line
    data_ttest[i,  "Protein"] <- Protein
    data_ttest[i, "p.val"] <- t.test(subset_EVC$Expression, subset_PGRMC1$Expression, alternative ="two.sided")$p.val
    i = i+1
    
    j_end <- j+length(subset_PGRMC1[,1])-1
    data_ratios[j:j_end, "Cell.Line"] <- Cell.Line
    data_ratios[j:j_end, "Protein"] <- Protein
    data_ratios[j:j_end, "Ratio"] <- subset_PGRMC1$Expression / mean(subset_EVC$Expression)
    
    j = j_end+1
  }
}
data_ttest$q.val <- p.adjust(data_ttest$p.val, "fdr")

data_ratios$Name <- paste(data_ratios$Protein, data_ratios$Cell.Line, sep="\n")

data_summary <- data %>% group_by(Cell.Line, Protein, Vector) %>% 
  summarize(mean = mean(Expression), sd = sd(Expression))


p <- ggplot(data_ratios, aes(x=Name, y=Ratio))
p <- p + geom_dotplot(binaxis='y', stackdir='center')
p <- p + scale_y_continuous(limits = c(0, 2.5), expand = c(0, 0),
                            labels = scales::percent_format(accuracy = 1))
p <- p + stat_summary(fun=mean, geom="point", shape=18, size=3, color="red")
p <- p + stat_summary(fun.data=mean_sdl, fun.args = list(mult=1), 
                      geom="pointrange", color="red", width=0.5)

source("theme.R")

data_significance <- data.frame("signif_x" = numeric(),
                                "signif_xend" = numeric(),
                                "signif_y" = numeric(),
                                "signif_annotation" = character(),
                                stringsAsFactors = FALSE)

sig_length <- 0.125
data_significance[1, ]<- c(1-sig_length, 1+sig_length, 1.5, '****')
data_significance[2, ]<- c(2-sig_length, 2+sig_length, 2, ' **** ')
data_significance[3, ]<- c(3-sig_length, 3+sig_length, 0.75, '  ****  ')
data_significance[4, ]<- c(4-sig_length, 4+sig_length, 1.35, 'ns')

data_significance$signif_x <- as.numeric(data_significance$signif_x)
data_significance$signif_xend <- as.numeric(data_significance$signif_xend)
data_significance$signif_y <- as.numeric(data_significance$signif_y)

p <- p + geom_signif(xmin = data_significance$signif_x,
                     xmax  = data_significance$signif_xend,
                     y_position = data_significance$signif_y,
                     annotation= data_significance$signif_annotation)


ggsave(
  plot = p,
  width = 15,
  height = 7.5,
  dpi = 300,
  filename = paste('export/dotplot.pdf', sep = ''),
  units = "cm"
)