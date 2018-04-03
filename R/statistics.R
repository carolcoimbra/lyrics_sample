data <- read.csv("bey.csv", header=TRUE, sep=";", quote="")

#Intervals:
min_data <- min(data$X.words_unique)
max_data <- max(data$X.words_unique)
mean_data <- mean(data$X.words_unique)
sd_data <- sd(data$X.words_unique)
