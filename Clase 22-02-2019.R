install.packages("ggplot2")
require(ggplot2)
install.packages("forecast") 
require(forecast)
install.packages("fpp2")
require(fpp2)
netf <- read.csv("C://Users//ALUM_H19//Desktop//netflix.csv")
netfts <- ts(netf,start = 2018,frequency=273)
plot(netfts)
####metodo media###
meanf (st,h)
media <- meanf(netfts, 20)
plot(media)
###metodo del ingenuo###
naive (st,h)
ingenuo <- naive(netfts, 20)
plot(ingenuo)
ingenuo
### ingenuo estacional ###
snaive (st,h)
ingenestacional<- snaive(netfts,273)
plot(ingenestacional)
#### metodo de la deriva ###
rwf (y,h,drift = TRUE)
deri <- rwf(netfts,20, drift =TRUE)
plot(deri)
cerveza2 <- window(ausbeer, start = 1992,end=c(2007,4))
autoplot(cerveza2) +
  autolayer( meanf(cerveza2,h=11),series="media",PI=FALSE) +
  autolayer(naive(cerveza2,h=11),series="ingenuo",PI=FALSE) +
  autolayer(snaive(cerveza2,h=11),series="ingenuoest",PI=FALSE) +
  autolayer("pronosticos produccion cerveza") +
  xlab("año") +
  ylab("miles de litros") 
  guides(colour=guide_legend(title="pronostico"))