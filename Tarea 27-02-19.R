install.packages("ggplot2")
install.packages("fpp2")
install.packages("forecast")
require (ggplot2)
require (fpp2)
require (forecast)

##VALORES AJUSTADOS EN LA SERIE DE TIEMPO
#Los valores ajustados son valores que estiman con base en los datos de la serie de tiempo
#No siemre los valores ajustados son pron�sticos 
#M�todo de promedio para hacer pron�sticos y^t = c^= serie calculado por todas la series dispoonibles
#Prn�stico de la deriva y^t = yt-1 + c^ c=constante  y estimador


#ANALISIS DE RESIDUALES
#se ocupan para saber qu� tan bueno o malo es el pron�stico. et= yt-y^t
#Los residuos son buenos para ver si el modelo ha capurado adecuadamente la info. en los datos. 
#Un buen m�todo de pron�stico producira residuos con las sig. propiedades:
### 1. Los residuos no deben estar correlacionados y si lo estan cambias la forma de pron�stico
### 2. los residuos tienen media 0 y si es distinto los datos estan sesgado
#Los residuos tienen variaci�n constante y distribuci�n normal 
#*INGENUO: M�todo m�s usados en finanzas

#utilizmos goog200

#EJ:
help("goog200")
pronos <- naive(goog200)
names (pronos)
res1 <- residuals(naive(goog200))
autoplot(goog200)
autoplot(res1) #Gr�fica residuales y buscamos que sea muy cercano a 0 var const media cercano a 0
gghistogram(res1) #Histograma no tiene distribuci�n normal
ggAcf(res1) #Correlograma, ve si los residuales no estan correlacionados cada linea es un resdual y
#las fronteras azules nos indica si alguno d los residuos estan significativamente correlacionado si pasan las rayas tienen autocorrelaci�n

#RUIDO BLANCO
##caso simple de los procesos estoc�sticos, donde los valores son independientes e
#id�nticamente distribuidos a lo largo del tiempo con media cero e igual varianza

#Ejercicio

poblacion <- read.csv("C:/Users/anak-/Downloads/Kareem/POBLACI�N.csv")
poblacionts <- ts (poblacion, start =1910, end=2015)
plot(poblacionts)
pobn <- naive (poblacionts)
names(pobn)
res2 <- residuals(naive(poblacionts))
autoplot(poblacionts)
autoplot(res2)
gghistogram(res2)
ggAcf(res2)

PIB <- read.csv("C:/Users/anak-/Downloads/Kareem/PIB.csv")
PIBts <- ts (PIB, start = 1961, end=2017)
PIBn <- naive (PIBts)
names(PIBn)
res3 <- residuals(naive(PIBts))
autoplot(PIB)
autoplot(res3) #Podemos observar que la gr�fica es Estacional y ciclica
gghistogram(res3) #No se comporta como una distribuci�n normal
ggAcf(res3) #y tenemos una l�nea por debajo del l�miite 


Televisa <- read.csv("C:/Users/anak-/Downloads/Kareem/TELEVISA.csv")
Televisats <- ts (Televisa, start = 2018, end=2019)
Televisan <- naive (Televisats)
names(Televisan)
res4 <- residuals(naive(Televisats))
autoplot(Televisa)
autoplot(res4)
gghistogram(res4)
ggAcf(res4)
#No se puede gr�ficar los precios de televisa