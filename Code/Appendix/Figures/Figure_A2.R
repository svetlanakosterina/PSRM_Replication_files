library(foreign)
dat2.dta <- read.dta("./Data/Afrobarometer_data_R4.dta")

pdf("Figure_A2.pdf")
dat2.dta$careful_o[dat2.dta$careful_o == 9] <- "Don't know"

dat2.dta$careful_mod[dat2.dta$careful_o == 0] <- "Never"
dat2.dta$careful_mod[dat2.dta$careful_o == 1] <- "Rarely"
dat2.dta$careful_mod[dat2.dta$careful_o == 2] <- "Often"
dat2.dta$careful_mod[dat2.dta$careful_o == 3] <- "Always"
dat2.dta$careful_mod[is.na(dat2.dta$careful_o)] <- "Don't know"
dat2.dta$careful_mod <- as.factor(dat2.dta$careful_mod)
dat2.dta$careful_mod <- ordered(dat2.dta$careful_mod, levels = c("Don't know", "Never", "Rarely", "Often", "Always"))

careplot <- table(dat2.dta$eth_akan, dat2.dta$careful_mod)
rownames(careplot) <- c("Non-Akans", "Akans")

barplot(careplot, border = "dark blue",
        legend = rownames(careplot), ylab="Frequency",
xlab = "Careful About Politics", ylim = c(0, 500), las = 1)
dev.off()





