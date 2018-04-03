data <- read.csv("bey.csv", header=TRUE, sep=";", quote="")

max_hist = 500
x <- seq(0, max_hist, by=0.1)
y <- dnorm(x, mean(data$X.words_unique), sd(data$X.words_unique))
y1 <- dnorm(x, 120, 70)
y2 <- dnorm(x, 130, 55)

par(mfrow=c(1,2))

#Histogram words_unique (density) and N(mean, sd):
hist(data$X.words_unique, breaks=max_hist, xlim=c(0,max_hist), prob="T", xlab="x", ylab="p(x)")
lines(x, y, col="red", lwd=2)
lines(x, y1, col="blue", lwd=2)
lines(x, y2, col="green", lwd=2)

#Histogram words_unique (density) grouped and N(mean, sd):
hist(data$X.words_unique, xlim=c(0,max_hist), prob="T", xlab="x", ylab="p(x)")
lines(x, y, col="red", lwd=2)
lines(x, y1, col="blue", lwd=2)
lines(x, y2, col="green", lwd=2)

#Legend
legend(x=185, y=0.008, ncol=1, legend=c("N(m,s)","N(120,70)","N(130,55)"), col=c("red","blue","green"), lty=1, cex=0.8)