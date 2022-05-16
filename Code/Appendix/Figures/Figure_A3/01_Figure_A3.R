rm(list = ls())
library('data.table')
library('dotwhisker')
library('broom')
library('dplyr')
library('foreign')

data <- read.csv("./Data/data_figure_A3.csv")

colnames(data) <- paste0("V",1:3)
data[data == "="] <- NA
data <- data[rowSums(is.na(data)) < 1, ]
data <- data[data$V1 != "=Standard errors in second column", ]

data$model <- "Model 1"

data$Akan30 <- seq(0, 1, by = 0.05)
data$term <- "No Interaction"

data$estimate <- as.numeric(as.character(gsub("=", "", data$V2)))
data$std.error <- as.numeric(as.character(gsub("=", "", data$V3)))
data$V1 <- data$V2 <- data$V3 <- NULL
data$low_ci <- data$estimate - qnorm(0.975) * data$std.error
data$upp_ci <- data$estimate + qnorm(0.975) * data$std.error

## ---------------------
## Model 1
## ---------------------

data.1 <- subset(data, model == "Model 1")

pdf(file = "Figure_A3.pdf", width = 6, height = 6)
plot <- ggplot(data.1, aes(x = Akan30, estimate)) + 
    theme_classic() +
    geom_smooth(aes(ymin = low_ci, ymax = upp_ci), stat = "identity") +
    ylim(0, 1)  +     ylab("Predicted Support for the NPP\n") + xlab("\n Share of Akans (30 km radius)") +
    ggtitle("Model 1\n \n") +
    theme(plot.title = element_text(face="bold"), 
          axis.text.y  = element_text(size = 14),
          panel.border = element_rect(colour = "black", fill = NA, size = 1),
          text = element_text(size = 16),
          legend.position = c(0.7, 0.75), 
          legend.direction = "vertical")
print(plot)
dev.off()

