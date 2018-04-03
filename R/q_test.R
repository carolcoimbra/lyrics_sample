h <- hist(data$X.words_unique)
breaks <- h$breaks
freq_data <- h$counts
prob_data = freq_data/sum(freq_data)

#Analisando os vetores é possível construir vetores com os intervalos considerados e as distribuições de probabilidade associadas aos intervalos:
breaks_new = c(0,50,100,150,200,250,300,350,400)
freq_data_new = c(5, 49, 106, 47, 19, 8, 7, 3, 3)
prob_data_new = freq_data_new/sum(freq_data_new)

#Assumindo que o modelo candidato para explicar os dados observados é uma normal, podemos calcular as probabilidades da distribuição normal com média 148 e desvio-padrão 74 para cada um dos intervalos definidos acima:
prob_norm = prob_data_new
for (i in 2:length(breaks_new)){
  prob_norm[i-1] = pnorm(breaks_new[i], 148, 74) - pnorm(breaks_new[i-1], 148, 74)
}
prob_norm[length(breaks_new)] = 1 - pnorm(breaks_new[length(breaks_new)], 148, 74)

#Ao realizar o teste qui-quadrado é possível chega-se ao valor de X² igual a 0.69
x <- sum((prob_data_new-prob_norm)**2/prob_norm)
x
