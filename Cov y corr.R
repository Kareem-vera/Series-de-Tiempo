desem <- read.csv("C:/Users/ALUMNO-D29/Documents/tasadesempleo.csv")
plot(desem)

dx <- desem$X10.2..Tasa.de.desocupación
mdx <- mean(dx)
dy <- desem$X10.5..Tasa.de.trabajo.asalariado
mdy <- mean(dy)
cova <- sum((dx-mdx)*(dy-mdy))
covar <- cova/55

corr <- covar/sqrt((var(dx)*var(dy)))
