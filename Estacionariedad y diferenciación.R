#Estacionariedad y diferenciación
#Una serie temporal estacionaria es aquella cuyas propiedades no dependen del momento 
#en que se observa la serie.
#Por lo tanto, las series temporales con tendencias, o con la estacionalidad, 
#no son estacionarias: la tendencia y la estacionalidad afectarán el valor de las series
#temporales en tiempos diferentes.
#Por otro lado, una serie de ruido blanco es etsacionaria: no importa cuando lo observes,
#debe verse muy parecida en cualquier momento.
#Algunos casos pueden ser confusos: una serie temporal con comportamiento ciclico
#(pero sin tendencia o estacionalidad) es estacionaria. Esto se deben a que los ciclos 
#no son de una longitud fija por lo que antes de observar un ST.

##DIFERENCIACIÓN

#El precio de las acciones de Google no es estacionario en la gráfica a) (S.T.) 
#pero os cambios diarios fueron estacionarios en la grafica b). 
#Esto muestra una forma de hacer una ST no estacionaria en estacionarioa al calcular 
#diferencias entre observaciones consecutivas. Esto se conoce como diferenciación.
#Transformaciones como los logaritmos pueden ayudar a estabilizar la varianza de una ST
#La diferenciación puede ayudar a nivel de una ST y por lo tanto eliminando o
#reduciendo la tendencia y la estacionalidad.
#Además de observar la gráfica temporal de los datos, la fráfica ACF tambiés es útil 
#para identificar series temporales no estacionarias. para un STE wl cf CERA 0 RELT RAPIDO. MIENTRAS QUE PARA LOS NO ESTACIONARIOS DISMINUYE LENTAMENTE

##NOSOTROS SIEMPRE BUSCAMOSQUE SEA RUIDO BLANCO PARA QUE SE CREÉ LA ESTACIONARIEDAD 

#El ACF de la diferencia en el precio de las acciones de Google se parece a la de una ST de RB. No hay autocorrelaciones fuera del límite del 95%.


##MODELO DE CAMINATA ALEATORIA
#La serie diferenciada es el cambio entre observ. consec. en la serie original y se puede escribir como:
#y´t=Error=componete aleatorio o esocastico= yt+yt-1
#Las series diferenciadas tendran solo valores T-1, ya que no es posible calcular una diferencia. Para la primera observación 
#yt - yt-1 = e1
#Cuando la serie diferenciada es RB, el mod para la serie original se puede escribir como:
#yt-yt-1+e1
#Donde et denota a RB, Reoriganizar esto lleva al modelo de "caminata aleatoria"

##NO ES RECOMENDABLE HACER MÁS DE DOS DIFERENCIACIONES EN UNA ST

#La caminata aleatoria se usan para datos no estacionarios y se usan mucho para los datos financieros y economicos
#los paseos aleatorios suelen tener:
#Largos periodods de tendencias aparentes hacia arriba o hacia abajo.
#Cambios repentinos e impredecibles en la dirección.
#Los pronósticos de un modelo de caminata aleatoria son iguales a la última observación,
#Ya que los movimientos futuros son impredecibles, y es probable que estén arriba o abajo.
#Por lo tanto el modelo de paseo aleatorio respalda pronósticos ingenuos.

a <- ausbeer
plot (a)
b<- diff(ausbeer)
plot (b)
