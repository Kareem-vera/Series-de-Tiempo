##############################################################################################################################################
###Transformacion Yt
install.packages("readr")
inst all.packages("foreign")
library(readr)
datos <- read.csv("C:/Users/ALUMNO-D29/Documents/salarios.csv")

plot(salarios ~ antiguedad, data = datos, col = "green", pch = 20, cex = 1.5, main = "Salarios en la empresa segun antiguedad")

modelo_lin = lm(salarios ~ antiguedad, data = datos)
summary(modelo_lin)

#Parece que el modelo es significativo, pero ¿cumple con los supuestos?
plot(salarios ~ antiguedad, data = datos, col = "grey", pch = 20, cex = 1.5, main = "Salarios en la empresa segun antiguedad")
abline(modelo_lin, col = "darkorange", lwd = 2)
#Añadiendo la línea ajustada a la grafica

par(mfrow = c(1, 2))

plot(fitted(modelo_lin), resid(modelo_lin), col = "grey", pch = 20,
     xlab = "Estimado", ylab = "Residuos", main = "Estimado versus Residuales")
abline(h = 0, col = "darkorange", lwd = 2)

qqnorm(resid(modelo_lin), main = "Grafico Normal Q-Q", col = "darkgrey")
qqline(resid(modelo_lin), col = "dodgerblue", lwd = 2)  


###Transofrmaciones de varianza
#Sin embargo, a partir de la grafica estimado versus residual, parece que hay una variacion no constante. 
#Especificamente, la varianza aumenta a medida que aumenta el valor estimado.

#Se reajusta el modelo
modelo_lin_log <- lm(log(salarios) ~ antiguedad, data = datos)

plot(log(salarios) ~ antiguedad, data = datos, col = "grey", pch = 20, cex = 1.5,
     main = "Salarios en la empresa segun antiguedad")
abline(modelo_lin_log, col = "darkorange", lwd = 2)

#Al trazar los datos en la escala transformada y agregar la linea ajustada, la relacion vuelve a ser lineal, 
#Es posible ver que la variacion de la linea ajustada parece constante.

plot(salarios ~ antiguedad, data = datos, col = "grey", pch = 20, cex = 1.5,
     main = "Salarios en la empresa segun antiguedad")
curve(exp(modelo_lin_log$coef[1] + modelo_lin_log$coef[2] * x),
      from = 0, to = 30, add = TRUE, col = "darkorange", lwd = 2)
#Al trazar los datos en la escala original y agregar la regresion ajustada, vemos una relacion exponencial. 
#Sin embargo, este sigue siendo un modelo lineal, ya que la nueva respuesta transformada, log (y), 
#sigue siendo una combinacion lineal de los predictores.
par(mfrow = c(1, 2))

plot(fitted(modelo_lin_log), resid(modelo_lin_log), col = "grey", pch = 20,
     xlab = "Fitted", ylab = "Residuals", main = "Estimado versus Residuales")
abline(h = 0, col = "darkorange", lwd = 2)

qqnorm(resid(modelo_lin_log), main = "Grafico Normal Q-Q", col = "darkgrey")
qqline(resid(modelo_lin_log), col = "dodgerblue", lwd = 2)

###############################################################################################################
#BOX COX
#R permite seleccionar rapidamente un valor lambda apropiado. 
#A menudo se elige un valor "agradable" dentro del intervalo de confianza, en lugar del valor de lambda
#que realmente maximiza la probabilidad.
install.packages("faraway")
install.packages("MASS")
library(MASS)
library(faraway)

#Se ajusta un modelo lineal
modelo_lin2 <- lm(sr ~ ., data = savings)
library(readr)
datos <- read.csv("C:/Users/ALUMNO-D29/Documents/savings.csv")
modelo_lin2 <- lm(sr ~ ., data = savings)

#Con la funcion Box Cox es posible determinar el mejor valor de ?? de acuerdo con la maxima verosimilitud
boxcox(modelo_lin2, plotit = TRUE)

#R traza la probabilidad logaritmica en funcion de los posibles valores de lambda. 
#Indica tanto el valor que maximiza la probabilidad, como un intervalo de confianza para el valor de lambda
boxcox(modelo_lin2, plotit = TRUE, lambda = seq(0.5, 1.5, by = 0.1))
#Notar la proximidad de lambda a uno, entonces, esto no es esencialmente una transformación. 
#No cambiaria la variacion ni haria que el modelo se ajustara mejor. Al restar 1 de cada valor, 
#solo cambiaria el intercepto y los errores resultantes serian los mismos. 

plot(fitted(modelo_lin2), resid(modelo_lin2), col = "dodgerblue",
     pch = 20, cex = 1.5, xlab = "Fitted", ylab = "Residuals")
abline(h = 0, lty = 2, col = "darkorange", lwd = 2)


#Al observar una grafica estimado versus residual, se verifica que probablemente no haya problema con las suposiciones 
#Aun asi, verificar con las pruebas de Breusch-Pagan y Shapiro-Wilk.
library(lmtest)
bptest(modelo_lin2)

shapiro.test(resid(modelo_lin2))


########################################################################################################################
###Otro ejemplo de trasnformación Box Cox

gala_model = lm(Species ~ Area + Elevation + Nearest + Scruz + Adjacent, data = gala)

plot(fitted(gala_model), resid(gala_model), col = "dodgerblue",
     pch = 20, cex = 1.5, xlab = "Fitted", ylab = "Residuals")
abline(h = 0, lty = 2, col = "darkorange", lwd = 2)
#Parece que se viola el supuesto de variacion constante.

boxcox(gala_model, lambda = seq(-0.25, 0.75, by = 0.05), plotit = TRUE)

#Usando el método de Box-Cox, parece que lambda = 0.3 esta en el intervalo de confianza, y extremadamente cerca del maximo, 
#lo que sugiere una transformación de la forma: y?? -1 / ?? 

#Entonces se ajusta un modelo con esta transformacion.
gala_model_cox = lm((((Species ^ 0.3) - 1) / 0.3) ~ Area + Elevation + Nearest + Scruz + Adjacent, data = gala)

plot(fitted(gala_model_cox), resid(gala_model_cox), col = "dodgerblue",
     pch = 20, cex = 1.5, xlab = "Fitted", ylab = "Residuals")
abline(h = 0, lty = 2, col = "darkorange", lwd = 2)


###Transformacion de predictores






