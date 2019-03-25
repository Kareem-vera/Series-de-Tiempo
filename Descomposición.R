########################################################################################################################}

#Ejemplos
install.packages("foreign")
require(foreign)
ventas <- read.csv("C:/Users/ALUMNO-D29/Documents/ejemplo.csv")

ventas.ts <- ts(ventas, start=c(2012,1), frequency=6)
plot(ventas.ts, xlab="Periodo de tiempo", ylab="Ventas en millones", main="Ventas en millones de euros", col="blue")

ventas.descom <- decompose(ventas.ts, "additive")

cycle(ventas.ts)
#Detectando el comportamiento de las "ventas" en cada bimestre. R agrupa los bimestres y por eso encontrarán 6 diagramas de caja,
#correspondientes a los 6 bimestres de cada año. 
boxplot(ventas.ts ~ cycle(ventas.ts))

#graficamos los componentes de acuerdo con la función decompose
plot(as.ts(ventas.descom$seasonal))
plot(as.ts(ventas.descom$trend))
plot(as.ts(ventas.descom$random))
plot(ventas.descom)

#Graficamos la funcion de acuerdo con las variables que obtuvimos de la funcion decompose. En primer termino le indicamos a R que forme 
#un vector de una fila por tres columnas.
par(mfrow= c(1,3))
plot(ventas.descom$seasonal)
plot(ventas.descom$trend)
plot(ventas.descom$random)

#Extraer tendencia (Tt) con el metodo loess, funcion(stl)
#Estamos diciéndole a R que "ventas" es un vector de 24 filas [1:24,1]
ventas1.ts <- ts(ventas [1:24, 1], frequency=6, start=c(2012,1))
class(ventas1.ts)
View(ventas1.ts)

#Investigar qué es "s.window", "t.window" en CRAN
ventas.stl <- stl(ventas1.ts, s.window= "periodic")
names (ventas.stl)
ventas.stl

#Pedimos "traer" la columna 2 del objeto ventas.stl que es una serie de tiempo: ventas.stl$time.series
ventas.est <- ventas.stl$time.series [,1]
ventas.tend <- ventas.stl$time.series [,2]

ventas.tend
par(mfrow= c(1,2))
plot(ventas.est)
plot(ventas.tend)

#Grafica que contiene la serie de tiempo "ventas1.ts"
plot(ventas1.ts, col="blue", main="Ventas en millones de euros", ylab= "Valores de la tendencia", xlab="Periodo")
#Pedimos que sobreponga al gráfico anterior una línea que representa la tendencia (Tt) de la serie de tiempo: ventas.stl$time.series
lines(ventas.stl$time.series[,2], col="red", ylab="Tendencia")
install.packages("tseries")
install.packages("forecast")

library(tseries)
library(forecast)
#Contraste Dickey-Fuller
adf.test(ventas.stl$time.series[,1], alternative="stationary", k=0)


adf.test(diff(ventas.stl$time.series[,1]), alternative="stationary", k=0)

kpss.test(ventas.stl$time.series[,1], null = c("Level", "Trend"), lshort = TRUE)

