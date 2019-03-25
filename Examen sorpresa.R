#1)Calcular los residuales con un pronóstico ingenuo estacional aplicado a la serie de ausbeer

plot(ausbeer)
res1 <- residuals(snaive(ausbeer)) #ESTACIONARIO  

###1.1) Prueba si los residuales son ruido blanco y se distribuyen normal
autoplot(res1)
ggAcf(res1)
Box.test(res1)
#----Como podemos observar la gráfica de res1 podemos decir que los residuales sí tienen 
#ruido blanco ya que el p_value de Box.tes es mayor a .05  
#(X-squared = 0.025606, df = 1, p-value = 0.8729) no rechazamos la hipótesis nula (H0=ruido blanco)
gghistogram(res1)
shapiro.test(res1)
#----Se observa en el histograma que sí se distribuyen normal y como el p-value es mayor a .05
# (W = 0.99125, p-value = 0.2266) la distribución de los datos no es significativamente 
#diferente a la distribución normal

#2)Calcular residuales para la serie WWWusage y bricksq y seleccionar qué pronóstico es más 
#apropiado ingenuo o ingenuo estacional en cada serie. Argumenta tu respuesta.
plot(WWWusage)
res2 <- residuals(rwf(WWWusage))#ingenuor
res2.1 <- residuals(snaive(WWWusage))#ingenuo estacional
help("WWWusage")
W1 <- rwf(WWWusage, h=8)
W2 <- snaive(WWWusage, h=8)
autoplot(WWWusage)+
  autolayer (W1, series="ingenuo", PI=FALSE)+
  autolayer (W2, series="ingenuo estacional", PI=FALSE)+ 
  xlab("año") + 
  ylab("Horas")+ ggtitle("pronósticos") + 
  guides(colour=guide_legend(title = "pronóstico"))
accuracy(W1)
#                 ME     RMSE      MAE       MPE     MAPE MASE      ACF1
#Training set 1.333333 5.799687 4.525253 0.8286134 3.401706    1 0.7917635
accuracy(W2)
#                  ME     RMSE      MAE       MPE     MAPE MASE      ACF1
#Training set 1.333333 5.799687 4.525253 0.8286134 3.401706    1 0.7917635

plot(bricksq)
res3 <- residuals(rwf(bricksq))
res3.1 <- residuals(snaive(bricksq))
help("bricksq")
b1 <- rwf(bricksq, h=8)
b2 <- snaive(bricksq, h=8)
autoplot(bricksq)+
  autolayer (b1, series="ingenuo", PI=FALSE)+
  autolayer (b2, series="ingenuo estacional", PI=FALSE)+ 
  xlab("año") + 
  ylab("Producción")+ ggtitle("pronósticos") + 
  guides(colour=guide_legend(title = "pronóstico"))
accuracy(b1)
#                 ME    RMSE     MAE       MPE     MAPE      MASE        ACF1
#Training set 1.980519 40.8301 32.9026 0.1226214 8.178975 0.9241615 -0.07859987
accuracy(b2)
#                    ME    RMSE      MAE      MPE     MAPE MASE    ACF1
#Training set 6.834437 48.7093 35.60265 1.513132 8.678982    1 0.80655

#3)Contesta falso o verdadro y justtifica tu respuesta
###a).Los buenos métodos de pronóstico deberían tener ruidos distribuidos normalmente.
       #Sí por que se busca que la distribución sea normal
###b).Un modelo con pequeños residuos dará buenos pronósticos
       #No, esto dependera de los movimientos del dato 
###c).La mejor medida de los errores del pronóstico es MAPE.
      #Sí porque es el porcentaje bruto de la media 


#4)¿Que quiere decir que una serie de tiempo sea ruido blanco?
#----Quelos datos no tienen correlación estadística. la medi=0 y la varianza=c


#5)Una serie de ibmclose, produce una gráfica de esta serie. Divide los datos en un conjunto 
#de entrenamiento de 300 observaciones y un conjunto de prueba de 69 obsevaciones.
#Utilice varios métodos para pronósticar (simples) el conjunto de entrenamiento y 
#compara los resultados en el conjunto de prueba. ¿Qué método es el mejor? Justifique su
#respuesta y compruebe los residuos de su método elegidos. ¿Son ruido blanco?

serieibm= ibmclose
autoplot
