#adf.test para saber si la serie es estacionaria o no el p-vslue < .05 para que sea estacionaria si no es así
#se aplica una diferenciación para ver si se hace estacionaria (máximo 2 diferenciaciones sino otro modelo)

#el modelo arima busca trs valores: p,d,q


#Después se aplica los correlogramas
#par () 
##Orden p: valores autoregresivo  (0, por la forma de la gráfica)
#Orden d: # de diferenciaciones (1, porque se aplica solamente una diferenciación)
#Orden q: Los valores promedio de la ultima orden
#Se proponen 4 posibles valores para la q: 0-1-1, 0-1-2, 0-1-3 0-1-4
#Los valores p y q es raro que pasen del valor 5

#Cando se utiliza la función Arima en R se pone la serie original ya que ésta aplica una diferneciación en automatico

#SE crean los modelos sobre la serie original
#Con base al icc
#mod1 <- Arima (st, order - c (0,1,1))
#mod1  506.04 ###Nos quedamos con éste modelo 
#mod2 <- Arima (st, order - c (0,1,2))
#mod2  506.64
#mod3 <- Arima (st, order - c (0,1,3))
#mod3   507.09
#mod4 <- Arima (st, order - c (0,1,4))
#mod4   508.17


#Ya que tienes el modelo debes ver si e/losl residual/es es/son ruido blanco y se utiliza la prueba 
#de Ljung-Box y verificar que el p-value<.05 lo que indica que los residuales de la serie de tiempo sea ruido blanco
#modres <- residual(mod1)
#Box.test(modres,lag=12, type="Ljung-Box) si el p-value es grande los residuales don ruido blanco

#creamos un pronostico y podemos aplicar el Arima 
#Se pronostica con el Forecast
#mod1<-fprecast(mod1, h=12)
#plot(forecast(mod1, h=12), include=18) da los ultimos 18 datos para dar idea de como se comporta la ST

#mod1
#summary(mod1)

#Y no pasa la prueba para Arima

ELECTRA(Mx)
MDB (EU)




