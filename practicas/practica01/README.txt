ejerccio #1


consiste en leer el texto del codigo fuente cacater por caracter e ir generando tokens 
	por palabras reservadas  , puntos , comas 



ejerccio #2 
el analisador léxico lee los caracteres que componen el texto del programa y sumnistra tokens al analizador sintáctico 
los separa por espacios , putos y comas, por ejemplo

ejerccio #3 

pimero hay dos reglas pasarlo a afnd 
-concatenacion 
ejemplo 
 
<estado 1> con a <estado2>
<estado 3> con b <estado4> 
=  <estado 1> con a  <estado 2> con epsilon <estado 3>con b <estado 4>

-selección 
ejemplo
<estado 1> con a <estado2>
<estado 3> con b <estado4> 

			 con epsilon <estado 1> con a <estado 2> con epsilon
<estado 0>													<estado 5>		
			 con epsilon <estado 2> con b <estado 4> con epsilon


con a*

<estado 0> epsiolon <estado 1> a <estado 2> epsilon <estado 3>

<estado 0 > epsilon va con <estadodo 3>
epsicon va de <estado 2> a <estado 1>

 algoritmo:

1-construir cerraduras epsilon 
la cerradura epsilon es el de todos los resultados que alcanzan la transiciones epsilon desde un esatado o estados, se denomina como s'
 una cerradura epsilon de un estado siempre contien al mismo estado 

2-eliminación de traciones multiples "funcion mover", estados que no son alcanzables desde el nuevo esatado del conjunto cerradura con cada unso de los caracteres simples 
3 construir la cerradura de los estados que surgen de la funcion mover con cada uno de los caracteres

4- continuar hasta eliminación de trasiciones multiples con la funcion mover

