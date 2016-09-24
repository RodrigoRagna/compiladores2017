Ejercicio 1:

1.¿Cuáles son las maneras de implementar un analizador sintáctico descendente?
Con descenso recuersivo y LL(k)

2.¿Qué características debe cumplir una gramática libre del contexto para que puedan tener
un reconocedor descendente recursivo sin caer en ciclos ni hacer backtrack?
Quitando la recursión por la izquierda, quitar la ambigüedad


Ejercicio 2:

¿Qué resultado da la evaluación de la expresión 3-2+8?

En el que es por la izquierda da 9, por la asociación, a 8 le suma el resultado de 3-2.
	(3-2)+8
En el que es por la derecha da -7, por la asociación, a 3 le resta el resultado de 2-8.
	3-(2+8)
