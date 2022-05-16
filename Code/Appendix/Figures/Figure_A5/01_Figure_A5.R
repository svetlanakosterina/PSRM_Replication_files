rm(list = ls())
library('data.table')
library('dotwhisker')
library('broom')
library('dplyr')

data <- read.csv("./Data/data_figure_A5.csv")

colnames(data) <- paste0("V",1:3)
data[data == "="] <- NA
data <- data[rowSums(is.na(data)) < 1, ]
data <- data[data$V1 != "=Standard errors in second column", ]

data$model <- "Model 3"

data$Akan30 <- rep(seq(0, 1, by = 0.05), 2)
data$term <- c(rep("Never", 21), rep("Always", 21))

data$estimate <- as.numeric(as.character(gsub("=", "", data$V2)))
data$std.error <- as.numeric(as.character(gsub("=", "", data$V3)))
data$V1 <- data$V2 <- data$V3 <- NULL
data$low_ci <- data$estimate - qnorm(0.975) * data$std.error
data$upp_ci <- data$estimate + qnorm(0.975) * data$std.error

## ---------------------
## Model 3
## ---------------------

data.1 <- subset(data, model == "Model 3" & term == "Never")

pdf(file = "Figure_A5_Left.pdf", width = 6, height = 6)
plot1 <- ggplot(data.1, aes(x = Akan30, estimate)) + 
    theme_classic() +
    geom_smooth(aes(ymin = low_ci, ymax = upp_ci), stat = "identity") +
    ylim(0, 1)  +     ylab("Predicted Support for the NPP\n") + xlab("\n Share of Akans (30 km radius)") +
    ggtitle("Model 3:\nCareful = Never \n") +
    theme(plot.title = element_text(face="bold"), 
          axis.text.y  = element_text(size = 14),
          panel.border = element_rect(colour = "black", fill = NA, size = 1),
          text = element_text(size = 16),
          legend.position = c(0.7, 0.75), 
          legend.direction = "vertical")
print(plot1)
dev.off()

## ---------------------
## Model 3
## ---------------------

data.1 <- subset(data, model == "Model 3" & term == "Always")

pdf(file = "Figure_A5_Right.pdf", width = 6, height = 6)
plot2 <- ggplot(data.1, aes(x = Akan30, estimate)) + 
    theme_classic() +
    geom_smooth(aes(ymin = low_ci, ymax = upp_ci), stat = "identity") +
    ylim(0, 1)  +  ylab("\n\n") + xlab("\n Share of Akans (30 km radius)") +
    ggtitle("Model 3:\nCareful = Always \n") +
    theme(plot.title = element_text(face="bold"), 
          axis.text.y  = element_text(size = 14),
          panel.border = element_rect(colour = "black", fill = NA, size = 1),
          text = element_text(size = 16),
          legend.position = c(0.7, 0.75), 
          legend.direction = "vertical")
print(plot2)
dev.off()
