library('data.table')
library('dotwhisker')
library('broom')
library('dplyr')
library('foreign')

data <- read.csv("./Data/data_figure_1.csv")
colnames(data) <- paste0("V",1:3)
data[data == "="] <- NA
data <- data[rowSums(is.na(data)) < 1, ]
data <- data[data$V1 != "=Standard errors in second column", ]

data$Akan30 <- c("Low", "High", 
                 rep("Low", 4), rep("High", 4), 
                 rep("Low", 4), rep("High", 4), 
                 rep(c("Low", "High"), 4))
data$model <- c(rep("Model 1", 2), 
                 rep("Model 2", 8), 
                 rep("Model 3", 8), 
                 rep("Model 4", 8))
data$term <- c("No Interactions", "No Interactions",
               "Not at all", "A little bit", "Somewhat", "A lot",
               "Not at all", "A little bit", "Somewhat", "A lot",
               "Never", "Rarely", "Often", "Always",
               "Never", "Rarely", "Often", "Always",
               "Not at all, Never", "Not at all, Never",
               "Not at all, Always", "Not at all, Always",
               "A lot, Never", "A lot, Never",
               "A lot, Always", "A lot, Always")

data$estimate <- as.numeric(as.character(gsub("=", "", data$V2)))
data$std.error <- as.numeric(as.character(gsub("=", "", data$V3)))
data$V1 <- data$V2 <- data$V3 <- NULL

data <- data[order(data$model, data$term), ]    

data$Akan30 <- as.factor(data$Akan30)
data$Akan30 <- ordered(data$Akan30, levels = c("Low", "High"))

## ---------------------
data.1 <- data.table(subset(data, model == "Model 1"))
row1 <- data.table(rbind(c("Low", "Model 1", "Y", NA, NA),
                        c("High","Model 1", "Y", NA, NA)))
row3 <- data.table(rbind(c("Low", "Model 1", "YY", NA, NA),
                        c("High","Model 1", "YY", NA, NA)))
row4 <- data.table(rbind(c("Low", "Model 1", "YYY", NA, NA),
                        c("High","Model 1", "YYY", NA, NA)))
colnames(row1) <- colnames(row3) <- colnames(row4) <- c("Akan30", "model", "term", "estimate", "std.error")
data.1 <- rbind(row1, data.1, row3, row4)
data.1$model <- NULL
data.1$term <- gsub("Y", " ", data.1$term)
data.1$term <- as.factor(data.1$term)
data.1$term <- ordered(data.1$term, levels = c("No Interactions", " ", "  ", "   "))
data.1$estimate <- as.numeric(as.character(data.1$estimate))
data.1$std.error <- as.numeric(as.character(data.1$std.error))

pdf(file = "./Figure_1_Model1.pdf", width = 8, height = 4)
plot1a <- ggplot(data.1, aes(term, estimate)) + 
    theme_classic() +
    geom_col(aes(fill = Akan30), position = position_dodge(0.8), width = 0.7) + 
    scale_fill_manual(name = "Share of Akans\n (30 km radius)", values = c("#0000ff33", "#0000ff94")) + 
    ylim(0, 0.80) + 
    xlab("\n ") + 
    ylab("Predicted Support for the NPP\n") + 
    ggtitle("Model 1\n") +
    theme(plot.title = element_text(face="bold"), 
          axis.text.y  = element_text(size = 14),
          axis.ticks.x = element_blank(),
          panel.border = element_rect(colour = "black", fill = NA, size = 1),
          text = element_text(size = 16),
          legend.position = c(0.7, 0.75), 
          legend.direction = "vertical") +
    geom_errorbar(
        aes(ymin = estimate - 1.96 * std.error, ymax = estimate + 1.96 * std.error, group = Akan30),
        width = 0.2, position = position_dodge(0.8)
    )
print(plot1a)
dev.off()

## ---------------------
data$Akan30 <- as.factor(data$Akan30)
data$Akan30 <- ordered(data$Akan30, levels = c("Low", "High"))

data.1 <- subset(data, model == "Model 2")
data.1$model <- NULL
data.1$term <- as.factor(data.1$term)
data.1$term <- ordered(data.1$term, levels = c("Not at all", "A little bit", "Somewhat", "A lot"))

pdf(file = "./Figure_1_Model2.pdf", width = 8, height = 4)
plot1b <- ggplot(data.1, aes(term, estimate)) +
    theme_classic() +
    geom_col(aes(fill = Akan30), position = position_dodge(0.8), width = 0.7) + 
    scale_fill_manual(values = c("#0000ff33", "#0000ff94")) + 
    ylim(0, 0.80) + 
    xlab("\nFear of Political Intimidation") + 
    ylab("\n ") + 
    ggtitle("Model 2\n") +
    theme(plot.title = element_text(face="bold"), 
          axis.text.x  = element_text(size = 14),
          axis.text.y  = element_text(size = 14),
          panel.border = element_rect(colour = "black", fill = NA, size = 1),
          text = element_text(size = 16),
          legend.position = "none") +
    geom_errorbar(
        aes(ymin = estimate - 1.96 * std.error, ymax = estimate + 1.96 * std.error, group = Akan30),
        width = 0.2, position = position_dodge(0.8)
    )
print(plot1b)
dev.off()

## ---------------------
data$Akan30 <- as.factor(data$Akan30)
data$Akan30 <- ordered(data$Akan30, levels = c("Low", "High"))

data.1 <- subset(data, model == "Model 3")
data.1$model <- NULL
data.1$term <- as.factor(data.1$term)
data.1$term <- ordered(data.1$term, levels = c("Never", "Rarely", "Often", "Always"))

pdf(file = "./Figure_1_Model3.pdf", width = 8, height = 4)
plot1c <- ggplot(data.1, aes(term, estimate)) +
    theme_classic() +
    geom_col(aes(fill = Akan30), position = position_dodge(0.8), width = 0.7) + 
    scale_fill_manual(values = c("#0000ff33", "#0000ff94")) + 
    ylim(0, 0.80) + 
    xlab("\nCareful about Politics") + 
    ylab("Predicted Support for the NPP\n") + 
    ggtitle("Model 3\n") +
    theme(plot.title = element_text(face="bold"), 
          axis.text.x  = element_text(size = 14),
          axis.text.y  = element_text(size = 14),
          panel.border = element_rect(colour = "black", fill = NA, size = 1),
          text = element_text(size = 16),
          legend.position = "none") +
    geom_errorbar(
        aes(ymin = estimate - 1.96 * std.error, ymax = estimate + 1.96 * std.error, group = Akan30),
        width = 0.2, position = position_dodge(0.8)
    )
print(plot1c)
dev.off()

## ---------------------
data$Akan30 <- as.factor(data$Akan30)
data$Akan30 <- ordered(data$Akan30, levels = c("Low", "High"))

data.1 <- subset(data, model == "Model 4")
data.1$model <- NULL
data.1$term <- as.factor(data.1$term)
data.1$term <- ordered(data.1$term, levels = c("Not at all, Never", 
                                               "Not at all, Always", 
                                               "A lot, Never", 
                                               "A lot, Always"))

pdf(file = "./Figure_1_Model4.pdf", width = 8, height = 4)
plot1d <- ggplot(data.1, aes(term, estimate)) +
    theme_classic() +
    geom_col(aes(fill = Akan30), position = position_dodge(0.8), width = 0.7) + 
    scale_fill_manual(values = c("#0000ff33", "#0000ff94")) + 
    ylim(0, 0.80) + 
    xlab("\nIntimidation, Careful") + 
    ylab("\n ") + 
    ggtitle("Model 4\n") +
    theme(plot.title = element_text(face="bold"), 
          axis.text.x  = element_text(size = 14),
          axis.text.y  = element_text(size = 14),
          panel.border = element_rect(colour = "black", fill = NA, size = 1),
          text = element_text(size = 16),
          legend.position = "none") +
    geom_errorbar(
        aes(ymin = estimate - 1.96 * std.error, ymax = estimate + 1.96 * std.error, group = Akan30),
        width = 0.2, position = position_dodge(0.8)
    )
print(plot1d)
dev.off()
