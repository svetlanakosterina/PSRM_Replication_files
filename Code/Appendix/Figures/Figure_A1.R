## INTIMIDATION
library(foreign)
datINT.dta <- read.dta("./Data/Afrobarometer_data_R4.dta")

datINT.dta$political_intimidation_af_o <- datINT.dta$political_intimidation_af
datINT.dta$political_intimidation_af_o[datINT.dta$political_intimidation_af_o == 9] <- "Don't know"
datINT.dta$political_intimidation_af_mod[datINT.dta$political_intimidation_af_o == 0] <- "Not at all"
datINT.dta$political_intimidation_af_mod[datINT.dta$political_intimidation_af_o == 1] <- "A little bit"
datINT.dta$political_intimidation_af_mod[datINT.dta$political_intimidation_af_o == 2] <- "Somewhat"
datINT.dta$political_intimidation_af_mod[datINT.dta$political_intimidation_af_o == 3] <- "A lot"
datINT.dta$political_intimidation_af_mod[is.na(datINT.dta$political_intimidation_af_mod)] <- "Don't know"
datINT.dta$political_intimidation_af_mod <- as.factor(datINT.dta$political_intimidation_af_mod)
datINT.dta$political_intimidation_af_mod <- ordered(datINT.dta$political_intimidation_af_mod, levels = c("Don't know", "Not at all", "A little bit", "Somewhat", "A lot"))

pdf("Figure_A1.pdf")
intiplot <- table(datINT.dta$eth_akan, datINT.dta$political_intimidation_af_mod)
rownames(intiplot) <- c("Non-Akans", "Akans")

barplot(intiplot, border = "dark blue",
        legend = rownames(intiplot), ylab="Frequency",
xlab = "Fear of political intimidation", ylim = c(0, 600), las = 1)
dev.off()


