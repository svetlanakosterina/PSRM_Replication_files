library('foreign')

data <- read.csv("./Data/data_figure_2.csv")
colnames(data) <- paste0("V",1:3)
data[data == "="] <- NA
data <- data[rowSums(is.na(data)) < 1, ]
data <- data[data$V1 != "=Standard errors in second column", ]

data$estimate <- as.numeric(as.character(gsub("=", "", data$V2)))
data$std.error <- as.numeric(as.character(gsub("=", "", data$V3)))
data$V1 <- data$V2 <- data$V3 <- NULL

# PUBLIC GOODS: SCHOOLS
pdf(file = "Figure_2.pdf", width = 10, height = 6)

mat2 <- matrix(rep(NA),nrow=2,ncol=2)
mat2[1,1] <- data[1, 1]
mat2[2,1] <- data[1, 2]
mat2[1,2] <- data[2, 1]
mat2[2,2] <- data[2, 2]
### Visualization of the main table (marginal effects):
# get ci's:
mat2.ci <- matrix(rep(NA),nrow=2,ncol=2)
rownames(mat2.ci) <- c("ci.low","ci.high")
# ci.low:
mat2.ci[1,] <- mat2[1,] - mat2[2,]*qnorm(0.975)
# ci.high:
mat2.ci[2,] <- mat2[1,] + mat2[2,]*qnorm(0.975)

par(mfrow=c(1,3),  mar=c(11,6,14,2)) 
	# coefficient without interaction:
plot(.9,mat2[1,1],ylim=c(-0.4,0.37), xlim=c(0.8,1.2), pch=16,xlab="(a) Without Schools (Left) and\n with Schools (Right)",
ylab="Marginal Effect of Akan 30km on NPP Vote\n", xaxt='n', las = 1, 
cex = 1.5, cex.lab=1.5, cex.axis=1.5)
lines(c(.9,.9),mat2.ci[,1], cex = 1.5)
	# coefficient on interaction:
points(1.1,mat2[1,2],pch=16, cex = 1.5)
lines(c(1.1,1.1),mat2.ci[,2], cex = 1.5)
abline(h=0,lty=2, col="red")

# PUBLIC GOODS: ROADS

mat2 <- matrix(rep(NA),nrow=2,ncol=2)
mat2[1,1] <- data[3, 1]
mat2[2,1] <- data[3, 2]
mat2[1,2] <- data[4, 1]
mat2[2,2] <- data[4, 2]
### Visualization of the main table (marginal effects):
# get ci's:
mat2.ci <- matrix(rep(NA),nrow=2,ncol=2)
rownames(mat2.ci) <- c("ci.low","ci.high")
# ci.low:
mat2.ci[1,] <- mat2[1,] - mat2[2,]*qnorm(0.975)
# ci.high:
mat2.ci[2,] <- mat2[1,] + mat2[2,]*qnorm(0.975)

	# coefficient without interaction:
plot(.9,mat2[1,1],ylim=c(-0.4,0.37), xlim=c(0.8,1.2), pch=16,xlab="(b) Without Roads (Left) and\n with Roads (Right)",
ylab="", xaxt='n', las = 1,
cex = 1.5, cex.lab=1.5, cex.axis=1.5)
lines(c(.9,.9),mat2.ci[,1], cex = 1.5)
	# coefficient on interaction:
points(1.1,mat2[1,2],pch=16, cex = 1.5)
lines(c(1.1,1.1),mat2.ci[,2], cex = 1.5)
abline(h=0,lty=2, col="red")


# PUBLIC GOODS: HEALTH CLINICS

mat2 <- matrix(rep(NA),nrow=2,ncol=2)
mat2[1,1] <- data[5, 1]
mat2[2,1] <- data[5, 2]
mat2[1,2] <- data[6, 1]
mat2[2,2] <- data[6, 2]
### Visualization of the main table (marginal effects):
# get ci's:
mat2.ci <- matrix(rep(NA),nrow=2,ncol=2)
rownames(mat2.ci) <- c("ci.low","ci.high")
# ci.low:
mat2.ci[1,] <- mat2[1,] - mat2[2,] * round(qnorm(0.975), 2)
# ci.high:
mat2.ci[2,] <- mat2[1,] + mat2[2,] * round(qnorm(0.975), 2)

	# coefficient without interaction:
plot(.9,mat2[1,1],ylim=c(-0.4,0.4), xlim=c(0.8,1.2), pch=16,xlab="(c) Without Health Clinics (Left) and\n with Health Clinics (Right)",
ylab="", xaxt='n', las = 1, cex = 1.5, cex.lab=1.5, cex.axis=1.5)
lines(c(.9,.9),mat2.ci[,1], cex = 1.5)
	# coefficient on interaction:
points(1.1,mat2[1,2],pch=16, cex = 1.5)
lines(c(1.1,1.1),mat2.ci[,2], cex = 1.5)
abline(h=0,lty=2, col="red")
dev.off()

