#####################
#Diferenciacion
install.packages("readxl")
install.packages("tseries")
library(tseries)
library(readxl)

differences <- read_excel("C:/Users/ALUMNO-D29/Documents/differences.xlsx")
diferencias.ts <- ts(differences)
par(mfrow=c(1,3))

plot(diferencias.ts, ylab="Proceso", xlab="Periodo", col="navy")

plot(log(diferencias.ts),ylab="Log Primeras diferencias", xlab="Periodo", col="red")

plot(diff(log(diferencias.ts), 12),ylab="Log primeras Diferencias Estacionales", xlab="Periodo", col="green")

acf(diff(log(diferencias.ts), 12))


###
diferencias2 <- read_excel("C:/Users/ALUMNO-D29/Documents/differences2.xlsx")

diferencias.ts2 <- ts(diferencias2)

par(mfrow=c(1,4))

plot(diferencias.ts2, ylab="Primeras diferencias", xlab="Periodo", col="navy")

plot(log(diferencias.ts2), ylab="Primeras diferencias", xlab="Periodo", col="red")

plot(diff(log(diferencias.ts2),12), ylab="Log primeras Diferencias", xlab="Periodo", col="green")

plot(diff(diff(log(diferencias.ts2), 12), 1),ylab="Log Segundas Diferencias Estacionales", xlab="Periodo", col="purple")

require(tseries)

adf.test(diff(diff(log(diferencias.ts2), 12))
acf(diff(diff(log(diferencias.ts2), 12)))

adf.test(diff(log(diferencias.ts2), 12))
adf.test(diff(diff(log(diferencias.ts2), 12)))

