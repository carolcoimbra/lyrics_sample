data <- read.csv("bey.csv", header=TRUE, sep=";", quote="")
x <- data$X.words_unique

#Kolmogorov test:
ks.test(x, "pnorm", mean(data$X.words_unique), sd(data$X.words_unique))
ks.test(x, "pnorm", 120, 70)
ks.test(x, "pnorm", 130, 55)

