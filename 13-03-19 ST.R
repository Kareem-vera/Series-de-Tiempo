#Holt(1957)extendi� el suavizado exponencial simple para permitir el pron�stico de datos con una tendencia. 
#Este m�todo implica una ecuaci�n de pron�stico y dos ecuciones de suavizado ( una para el nivel y otra para la tendencia)
#Ecuaci�n forecast ^yt+(h|t)->

#Donde lt denota una estimaci�n del nivel de la serie en el tiempo t, bt denota una estimaci�n de la tendencia (pendiente)

require (fpp2)
require(ggplot2)
al <- window(ausair, start=1990)
prono <- holt(al, h=5)
autoplot(prono)
######

prono1<-holt(al, h=5)
prono2<-holt(al,damped = TRUE, phi = 0.9, h=15)
autoplot(al)+ autolayer(prono1, series="Holt", PI=FALSE) + autolayer(prono2, series="Amortiguado Holt", PI=FALSE)+
  ggtitle("pron�sticos")+ xlab("a�o")+ ylab("pasajeros")+
  guides(colour=guide_legend(title="prono"))


##Modelo Holt
prono3<-holt(al, h=5)
prono4<-holt(al,damped = TRUE, phi=.98, h=15)
autoplot(al)+ autolayer(prono3, series="Holt", PI=FALSE) + autolayer(prono4, series="Amortiguado Holt", PI=FALSE)+
  ggtitle("pron�sticos")+ xlab("a�o")+ ylab("pasajeros")+
  guides(colour=guide_legend(title="prono"))

prono5<-holt(al, h=5)
prono6<-holt(al,damped = TRUE, phi = 0.9, h=15)
prono7 <- ses(al, alpha=.7, initial = "simple", h=15)
autoplot(prono7)
autoplot(al)+ autolayer(prono1, series="Holt", PI=FALSE) + autolayer(prono2, series="Amortiguado Holt", PI=FALSE)+
  ggtitle("pron�sticos")+ xlab("a�o")+ ylab("pasajeros")+
  guides(colour=guide_legend(title="prono"))

e1 <- tsCV(al, ses, h=1) #funci�n que arroja errores 
e2 <- tsCV(al,holt,h=1)
e3 <- tsCV(al,holt, damped=TRUE, h=1)

MSE:#buscamos los valores m�s cercanos a 0 
  mean (e1^2, na.rm=TRUE) #na.rm para eliminar los na para calcular la media
#10.58
 mean(e2^2, na.rm = TRUE)
 #6.57, nos quedamos con �ste que es el m�s cercano a 0
 mean(e3^2, na.rm = TRUE)
 #7.38
 
 MAE: #MEdia Absoluta del error
  
mean(abs(e1), na.rm=TRUE)
#2.43
 
 mean(abs(e2), na.rm = TRUE)
 #1.80
 
 mean(abs(e3), na.rm = TRUE)
 #1.87
 