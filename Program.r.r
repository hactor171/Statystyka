#wyczytywanie danych z pliku csv

data <- read.csv2("C:/iris.csv", row.names=1,sep=";")#

#instalacja potrzebnych pakietow i biblioteinstall.packages("ipred")

install.packages("ipred")

library(ipred)

install.packages("klaR")

library(klaR)

##Klasyfikator k najblizszych sasiadów

#d - liczba sasiadów(knn)
d=10;

#podzial na zbior testowy i uczacy

ucz=sample(1:nrow(data),nrow(data)/2,FALSE)

#klasyfikator knn - model na zbiorze uczacym

knn=ipredknn(class~sepallength+sepalwidth+petallength+petalwidth, data=data, subset=ucz, k=d)

#prognoza - na zbiorze testowym

prog=predict(knn,data[-ucz,],"class")

#sprawdzenie - obserwacje vs model (na zbiorze testowym)

table(model=prog, dane=data[-ucz,5])

##Klasyfikator najblizsza srednia

knm=nm(class~sepallength+sepalwidth+petallength+petalwidth, 
data=data, subset=ucz)

prog2=predict(knm,data[-ucz,],"class")