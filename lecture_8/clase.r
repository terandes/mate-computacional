## Primer paso en la ayuda.
help.start()

## Muestra aleatoria
x <- rnorm(50)
y <- rnorm(x)
plot(x,y)

## Hagamos un for, if, seq, mod, print

for (i in seq(1,100)){
  if (i%%2 == 1 ){
    print (i)
  }
}

## vemos las variables existentes
ls()
rm(x, y)

## nuevo vector 
x <- 1:20
## " pesos " 
w <- 1 + sqrt(x)/2

dummy <- data.frame(x=x, y= x + rnorm(x)*w)
dummy 
## Ajustamos un modelo lineal 
fm <- lm(y ~ x, data=dummy)
##características del mismo
summary(fm)
## Nuevo ajuste pero con pesos en la misma
fm1 <- lm(y ~ x, data=dummy, weight=1/w^2)
summary(fm1)
## Hace que las variables sean accesibles. 
attach(dummy)

lrf <- lowess(x, y)
plot(x, y)
## Regresión local
lines(x, lrf$y)
## La verdadera (pendiente 1, pasa por el origen)
abline(0, 1, lty=3)
## Regresión lineal sin pesos
abline(coef(fm))
## Regresión lineal con pesos.
abline(coef(fm1), col = "red")
## importante quitarlas para que no estorben a futuro
detach()

## Vemos si tiene sentido la regresión con los residuales.
plot(fitted(fm), resid(fm),
     xlab="Fitted values",
     ylab="Residuals",
     main="Residuals vs Fitted")
## checamos que tenga sentido con el qqplot.
qqnorm(resid(fm), main="Residuals Rankit Plot")
rm(fm, fm1, lrf, x, dummy)

filepath <- system.file("data", "morley.tab" , package="datasets")
filepath
mm <- read.table(filepath)
mm
## la velocidad mas 299,000 es la velocidad en km/s medida
mm$Expt <- factor(mm$Expt)
mm$Run <- factor(mm$Run)
attach(mm)
plot(Expt, Speed, main="Speed of Light Data", xlab="Experiment No.")
fm <- aov(Speed ~ Run + Expt, data=mm)
summary(fm)
detach()
rm(fm, fm0)

## nuevo ejemplo. 
th <- seq(-pi, pi, len=100)
z <- exp(1i*th)
par(pty="s")
plot(z, type="l")
w <- rnorm(100) + rnorm(100)*1i
plot(w, xlim=c(-1,1), ylim=c(-1,1), pch="+",xlab="x", ylab="y")
lines(z)
w <- sqrt(runif(100))*exp(2*pi*runif(100)*1i)
plot(w, xlim=c(-1,1), ylim=c(-1,1), pch="+", xlab="x", ylab="y")
lines(z)


###############

#####################
## 1.- Probabilidad
#####################
# a) 
#####################
## Función para saber si gana o pierde. 
gana <- function (x){
    x1<-x[1]
    g<-NA
    if((x1==7)|(x1==11)){
        return(1)
    } else {
        if ((x1==3)|(x1==2)|(x1==12)){
            return(0)
        }else{
            for ( i in x[2:length(x)]){
                if((i==x1)){
                    return(1)
                }else {
                    if (i==7){
                        return(0)
                    }
                }
            }
        }
    }
    g
}
juego <- function(n){
    d1 <- sample(1:6,n,replace=1)
    d2 <- sample(1:6,n,replace=1)
    juego <- d1+d2    
}
gprepe <- replicate(1000,mean(replicate(1000,gana(juego(200)))))
mean(gprepe)
hist(gprepe,main="Histograma de la probabiliad",ylab="Densidad",xlab="p",freq=FALSE)
###################
# b)
###################
f <- function(x,l,m){
    f <- l/2*exp(-l*abs(x-m))
    f
}
g<-function(x){
    a<-f(x,0.5,0)
    a
}
set.seed(10102013)
x1 <- rexp(25000,rate=0.5)
x2 <- rexp(25000,rate=0.5)
y <- x1-x2
hist(y,freq=FALSE,main="Histograma de Y",ylab="Densidad")
hist(y,freq=FALSE,ylim=c(0,0.25),xlim=c(-20,20),main="Histograma de Y",ylab="Densidad")
curve(g, from=-20, to=20, n=1000,add=TRUE,col='red')



c.v.<-function(x){
    sd(x)/mean(x)
}
muestraNormal <-rnorm(100,1,1)
c.v.(muestraNormal)
x<-sample(1:4,100,replace=TRUE)
c.v.(x)
hist(replicate(500,c.v.(rexp(20,0.5))),freq=FALSE,main="Histograma",ylab="Densidad",xlab="Coeficiente de Variación")

#####################
## 3.- Funciones 
#####################
rm(list=ls())
f <- function (xvec){
    f <- xvec*0
    f[xvec<0] <- xvec[xvec<0]^2+2*xvec[xvec<0]+3
    f[(xvec<2)&(xvec>=0)] <- xvec[(xvec<2)&(xvec>=0)]+3
    f[(xvec>=2)] <- xvec[xvec>=2]^2+4*xvec[xvec>=2]-7
    f
}
x <- seq(-3,3,0.01)
y <- f(x)
plot(x,y,type='l',col='green',ylab="f(x)",main="Gráfica de la función f(x)")


