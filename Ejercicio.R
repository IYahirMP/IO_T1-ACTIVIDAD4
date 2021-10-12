#Importar la librería
library(lpSolve)

#Se guardan en una matriz los coeficientes de la función objetivo
funcion_objetivo <- c(19, 23)
#Se muestran los coeficientes de la función objetivo
funcion_objetivo

#Asignar a una matriz los coeficientes del lado izquierdo de las desigualdades
#2x1 + 1.5x2 <= 650
#4x1 + 6x2 <= 70
restricciones_izquierdo <- matrix(c(2, 1.5, 4, 6), nrow = 2, byrow = T)
# Se muestra el valor de la matriz
restricciones_izquierdo

# Se guardan los símbolos de desigualdad de cada restricción en un vector
restricciones_direccion <- c("<=", "<=")
# Se muestra el valor de la matriz
restricciones_direccion

# Se crea un vector con los parámetros del lado derecho de cada restricción
restricciones_derecho <- c(650, 70)
# Se muestra el valor del vector
restricciones_derecho

# Se ejecuta una instrucción que muestra la solución que maximiza la función
lp(direction = "max", objective.in = funcion_objetivo, const.mat = restricciones_izquierdo, const.dir = restricciones_direccion, const.rhs = restricciones_derecho)

# Se ejecuta la instrucción que da los valores de x1 y x2 que conforman la solución óptima
lp(direction = "max", objective.in = funcion_objetivo, const.mat = restricciones_izquierdo, const.dir = restricciones_direccion, const.rhs = restricciones_derecho)$solution