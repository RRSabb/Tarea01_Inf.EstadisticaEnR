  
     ## Tarea 1. Diplomado inferencia estad?stica para an?lisis de datos
#Leer la base de datos: "cars.csv"
setwd("C:/Users/Daniela Rivera/Desktop/Curso inf_est_R")
cars_dataframe <- read.csv("cars.csv")
names(cars_dataframe)

# 1. ?Cuantas filas tiene?
No_filas <- nrow(cars_dataframe)
print(paste("El numero de filas es:", No_filas))

# 2. ?Cuantas columnas tiene?
No_columnas <- ncol(cars_dataframe)
print(paste("El numero de columnas es:", No_columnas))

# 3. ?Cu?les son los diferentes valores de la columna de cylinders?
unique(cars_dataframe$cylenders) # funcion que imprime los valores encontrados para cilindraje sin repetici?n

# 4. ?Cu?l es el valor promedio de los caballos de fuerza (horsepower)? 
mean(cars_dataframe$horsepower) #Funcion que devuelve la media aritm?tica

# 5.  ?Cu?l es el valor m?ximo de los caballos de fuerza?
df_hpdecrease <- sort(cars_dataframe$horsepower,decreasing=TRUE)
df_hpdecrease
print(paste("El valor m?ximo para los caballos de fuerza es:", df_hpdecrease[1]))

# 6. ?Cu?l es el auto m?s costoso (dealer cost)?
mostCost <- sort(cars_dataframe$Dealer_Cost,decreasing=FALSE)
mostCost
print(paste("El auto de mayor costo es:", mostCost[428]))

# 7. Cambia el nombre de la columna name por car_name.
names(cars_dataframe)[1] <- "car_name" #Se asigna "car_name" al nombre de la columna 1 del DF

#8. Crea un nuevo dataframe formado por las columnas del nombre del
#autom?vil y su precio. Llama car_pricing a esta nueva tabla.
car_pricing <- data.frame(car_name,Price=cars_dataframe$Price)
View(car_pricing)
write.csv(car_pricing,"car_pricing.csv",row.names = FALSE)

# 9. A?ade una columna llamada category que indique BAJO si el precio es menor  a 20,000; que indique MODERADO 
#si el precio es mayor o igual a 20,000 pero menor que 35,000; y que indique 
#ALTO si el precio es mayor que 35,000.
cars_dataframe$Category <- ifelse(cars_dataframe$Price < 20000, "BAJO",
                                  ifelse(cars_dataframe$Price >= 20000 & cars_dataframe$Price < 35000, "MODERADO","ALTO"))
View(cars_dataframe)

# 10. ?Cu?ntos autom?viles son de categor?a baja, moderada e intermedia?
count_category <- table(cars_dataframe$Category)
print(paste("El n?mero de autos de categor?a BAJO es", count_category[1],
              ",para categor?a MODERADO es", count_category[2],
                ",mientras que para categor?a ALTO es", count_category[3]))