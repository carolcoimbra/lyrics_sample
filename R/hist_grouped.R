data <- read.csv("bey.csv", header=TRUE, sep=";", quote="")

#Histogram words_unique (frequency and density) grouped:
max_hist = 500
par(mfrow=c(1,2))
hist(data$X.words_unique, xlim=c(0,max_hist), xlab="x", ylab="frequency")
hist(data$X.words_unique, xlim=c(0,max_hist), prob="T", xlab="x", ylab="p(x)")