pib <- read.csv("C:/Users/ALUMNO-D29/Documents/PIB.csv")
plot(pib)
pibts <- ts (pib, start = 1961, end = 2017, frequency = 1)
plot.ts(pibts)
mod1 <- ses(pibts, alpha =0.1, initial ="simple",h=8)
#a=.1,Suavisado simple con 8 pronósticos
mod2 <- ses(pibts, alpha = 0.3, initial = "simple", h=8)
mod3 <- ses(pibts, alpha = 0.9, h=8) ##Nos quedamos con este modelo porque es el que más se parece a los datos reales en la gráfica 
plot(mod1, ylab = "PIB", xlab ="año", main ="pib", type ="o")
#Grafica los datos reales del mod1 (S.T. PIB), etiqueta eje "y", etiqueta eje"x", 0, como se llama mi gráfica y que tipo de gráfica
lines(fitted(mod1),col="blue", type= "o")
#Agrega linea de los valores ajustados(fitted) del mod1 en color azul
lines(fitted(mod2),col="red", type= "o")
lines(fitted(mod3),col="green", type= "o")
legend("topleft", lty = 1, col=c(1,"blue", "red", "green"), c("data", expression(alpha==0.1), expression(alpha==0.3), expression(alpha==0.9)),pch = 1)
#leyenda del cuadro que sale en la gráfica "topleft=de lado superior izquierdo"
names(mod1)
##################EJERCICIO#######################
#Con la fn de windows separen la serie del PIB
# en datos de entrenamiento y datos de prueba (20%)
# y gráfiquen los modelos solo en lo que corresponde a los datos de prueba


entrenamiento <- window(pibts, start=1961, end=2005, frequency=1)
prueba <- window(pibts, start=2005, end=2017, frequency=1)
mod4 <- ses(prueba, alpha =0.9, initial ="simple",h=8)
plot(mod4, ylab = "PIB", xlab ="año", main ="pib", type ="o")
plot(entrenamiento)
