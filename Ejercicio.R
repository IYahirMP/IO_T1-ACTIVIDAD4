# Nestlé, produce y distribuye dos tipos de café a los supermercados del país:
# cafeinado y descafeinado. Para este mes Nestlé tiene 650 toneladas
# de grano de café en inventario y tiene programadas hasta 70 horas de
# tiempo de procesamiento para el tostado. Cada tonelada de café cafeinado
# necesita dos toneladas de grano, cuatro horas de tostado y produce una
# ganancia de $19,000. Cada tonelada de café descafeinado necesita una
# y media tonelada de grano, pero necesita seis horas de tostado y produce
# una ganancia de $23,000. Plantee un modelo de programación lineal que
# le permita a Nestlé planear su producción para este mes.

# Paso 1: Identificar las variables de decisión o variables básicas.
# x1 = Toneladas de café cafeinado
# x2 = Toneladas de café descafeinado

# Paso 2: Identificar los coeficientes de contribución
# c1 = 19 K$/Ton.Café cafeinado
# c2 = 23 K$/Ton.Café descafeinado

# Paso 3: Armar función objetivo
# Maximizar Z = 19x1 + 23x2
# Z se expresa en miles de pesos.

# Paso 4: Identificar los parámetros
# b1 = 650 Ton. Café de grano en inventario (Material máximo a usar)
# b2 = 70 hrs de tiempo de procesamiento para tostado máximas.

# Paso 5: Identificar el lado izquierdo de las restricciones
# a11 = 2 toneladas de grano p/Ton.Café cafeinado
# a12 = 1.5 toneladas de grano p/Ton. Café descafeinado
# a21 = 4 horas de tostado p/Ton. Café cafeinado
# a22 = 6 horas de tostado p/Ton. Café descafeinado

# Paso 6: Armar las restricciones
# 2x1 + 1.5x2 <= 650
# 4x1 + 6x2 <= 70

# Paso 7: No negatividad
# x1, x2 >= 0

# Paso 8: Armar el modelo

# Maximizar Z = 19x1 + 23x2
# s.a.
# 2x1 + 1.5x2 <= 650    (1)
# 4x1 +   6x2 <= 70     (2)
# x1, x2 >= 0

# Paso 9: Solución por el método simplex

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