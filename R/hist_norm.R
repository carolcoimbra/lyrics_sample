data <- read.csv("bey.csv", header=TRUE, sep=";", quote="")

max_hist = 500
x <- seq(0, max_hist, by=0.1)
y<-dnorm(x, mean(data$X.words_unique), sd(data$X.words_unique))
par(mfrow=c(1,2))

#Histogram words_unique (density) and N(mean, sd):
hist(data$X.words_unique, breaks=max_hist, xlim=c(0,max_hist), prob="T", xlab="x", ylab="p(x)")
lines(x, y, col="red", lwd=2)

#Histogram words_unique (density) grouped and N(mean, sd):
hist(data$X.words_unique, xlim=c(0,max_hist), prob="T", xlab="x", ylab="p(x)")
lines(x, y, col="red", lwd=2)