m<-read.csv("C:/Users/ALUMNO-D29/Documents/dmx.csv")
mts<- ts (m, start= 2006, end=2018, frequency=12 )

###La descomposición de la serie de tiempo nos permite conocer la estacionalidad 
### y la aleatoriedad de la ST
### para descomponer una serie de tiempo seutiliza la función de decompose()
### para descomponer una ST
mtsadi <- decompose(mts)

###Para ver gráficamente una descomposición del ST en R existen
### dos formas de graficar la descomposición 
### 1)Directo de la ST
plot(decompose(mts))
plot(mtsadi)


###Ahora para descomponer una serie en modelo aditivo
# tdesocadi <- decompose(mts) y se descompone con el modelo aditivo
###Para hacerlo en modelo multiplicativo
mtsmult<- decompose(mts, type = "mult")
##Gráficamos los dos modelos
plot(mtsadi)
plot(mtsmult)

dt<- mtsadi$trend
dt

de <- mtsadi$seasonal
de

da <- mtsadi$random
da

tf=dt+de+da
tf
