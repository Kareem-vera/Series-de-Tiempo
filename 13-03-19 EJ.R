
require (fpp2)
require(ggplot2)
PB <- read.csv("C:/Users/ALUMNO-D29/Documents/pibb.csv")
tsPB <-  ts(PB, start=1961, end=2017, frequency = 1)
pib <- window(tsPB, start=1980)
prono <- holt(pib, h=5)
autoplot(prono)


pronos1<-holt(pib, h=5)
pronos2<-holt(pib,damped = TRUE, phi = 0.9, h=15)
pronos3<- ses(pib, alpha=.7, initial = "simple", h=15)
autoplot(pronos3)
autoplot(pib)+ autolayer(pronos1, series="Holt", PI=FALSE) + 
    autolayer(pronos2, series="Amortiguado Holt", PI=FALSE)+
  ggtitle("pronósticos")+ xlab("año")+ ylab("PIB")+
  guides(colour=guide_legend(title="pronos"))

er1 <- tsCV(pib, ses, h=1) #función que arroja errores 
er2 <- tsCV(pib,holt,h=1)
er3 <- tsCV(pib,holt, damped=TRUE, h=1)

MSE:#buscamos los valores más cercanos a 0 
  mean (er1^2, na.rm=TRUE) #na.rm para eliminar los na para calcular la media
#19.64
mean(er2^2, na.rm = TRUE)
#16.70, nos quedamos con éste que es el más cercano a 0
mean(er3^2, na.rm = TRUE)
#17.44

MAE: #MEdia Absoluta del error
  
  mean(abs(er1), na.rm=TRUE)
#3.27

mean(abs(er2), na.rm = TRUE)
#3.02

mean(abs(er3), na.rm = TRUE)
#3.17