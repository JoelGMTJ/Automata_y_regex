# Evidencia Implementación de Análisis Léxico (Automata y Expresión Regular)

Joel Guadalupe García Guzmán - A01713785


## Descripción

El lenguaje que yo escogí se compone de Σ = a,b,c y sigue las siguientes reglas
<ul>
    <li>Tiene que tener <b>aa</b> o <b>bb</b></li>
    <li>Tiene que terminar en <b>bc</b></li>
</ul>
Esas son todas las reglas de mi lenguaje. 
Voy a nombrar a todos los estados como q1, q2 ... q6.

## Soluciones con autómatas

<img src="images/DFA_first.jpg" alt="Mi primer DFA" width="500">

Versión 1 de mi autómata, lo hice en la clase que escogimos el autómata pero le agregué algunos detalles de formato como que inicialmente no escribí el nombre de los estados y no coloqué la flecha del estado inicial.
Tenía algunos errores en la lógica como que en cuanto llegue a q6 (estado final) se acaba el autómata y no existe ningún camino a otro lado, cosa que me daría error si en medio del string contiene ‘bc’, lo cual corregí en la segunda versión.

<img src="images/DFA_boring.png" alt="DFA corregido" width="500">

En esta segunda versión de mi autómata, ya está hecho digitalmente, mejorando la visibilidad. También corregí el error que cuando llegaba a q6 no tendría ningún lugar a donde ir.

Aquí también están las mismas imágenes con códigos de color para más claridad del programa:

<img src="images/DFA_pretty.png" alt="DFA color code" width="500">
<img src="images/Tabla_pretty.png" alt="DFA table with color" width="500">

### Explicacion de mi DFA

Voy a usar un autómata determinístico finito (<b>DFA</b> por sus siglas en inglés).
Una breve explicación de el como funcionan los DFA es que son varios círculos llamados "estados", también tenemos las líneas llamadas "transiciones" o "saltos", a los estados que pueden ser finales los representamos como un círculo dentro de otro círculo y los llamamos "estados finales" (Gopalakrishnan 2019).

Mi DFA se basa en que en cuanto llegues ya sea a q3 o q5 significa que ya has cumplido con la regla de "tener 'aa' o 'bb' almenos una vez", por eso mismo una vez que llegas a esos 2 estados no puedes volver a q1, q2 o q4.
Después de esto, q3 representa haber llegado desde una 'a' y q5 representa llegar desde una 'b'.
Mi única posición final es q6, y para llegar a este estado solo lo puedes hacer dando un salto si ocurre la letra 'c' desde el estado q5, así asegurandonos la condicion que termine en 'bc'.

### Pruebas de mi DFA

Para probar mi DFA vamos a usar el programa prolog y vamos a correr el script \'tests.pl' el cual contiene varias pruebas de mi lenguaje. Dentro de ahí manda a llamar el script \'automataTester.pl' donde viene la lógica de mi DFA.

Dentro del script primero especifico todas las conexiones de mi DFA, esta parte es solamente traducir de mi DFA a código de prolog. Su estructura es <i>connects(a,b,c)</i>, donde 'a' y 'c' son estados, y 'b' es la conexion que va de 'a' hacia 'c'. Ejemplo de todas las conexiones de q1 con todas las diferentes letras.

```
connects(q1,a,q2).
connects(q1,b,q4).
connects(q1,c,q1).
```
También es importante declarar que solamente q6 es el estado final, por lo que tenemos que declararlo en prolog.

Después la parte que sí maneja la lógica 
```
% Condicion final, solo va a entrar cuando se haya terminado el string
avanzar([],Estadofinal,_):-
    final(Estadofinal).
```
``` 
% Funcion principal, recorre todo el DFA
avanzar([Action|Rest], Current, Answer):-
    connects(Current,Action,Nextpos),
    avanzar(Rest,Nextpos,Answer).
```
El segundo bloque de código va a ocurrir siempre que el string aún tenga caracteres por recorrer. Lo que hace es buscar la conexion del estado Current con Nextpos y guarda el estado al que se dirige como Nextpos, donde si aún quedan objetos en la lista se vuelve a ejecutar hasta que no quede ninguno.

El primer bloque de código es la condición de paro, la cual es que la lista esté vacia, es decir, que ya la hayamos recorrido por completo, donde revisa si el Estadofinal si sea el final, es decir, q6.

## Soluciones con Regex

Mi primera versión de mi expresión en Regex es funcional pero bastante larga <br>
<b>((a|b|c)\*((aa)|(bb))(a|b|c)\*(bc))|((a|b|c)*(bbc))</b><br>
Esta fue la primera versión, la cual queda tan larga pues tiene que considerar los casos que contenga el par de letras 'aa' y 'bb' en algun momento
y terminar con 'bc' y el otro caso que es cuando el conjunto de letras 'bc' final es parte de la repeticion de letras 'bb'.

<b>\[a-c]\*(aa[a-c]*bc|bb[a-c]*bc|bbc)</b><br>
Esta es mi segunda version, ahora más compacta gracias a que logré simplificar las condiciones a centrarme más directamente en 3 condiciones
1) Que el string contenga 'aa' y termine en 'bc'
2) Que el string contenga 'bb' y termine en 'bc'
3) Caso especial que el string termine en 'bbc'

## Referencias

Automata and computability : a programmer’s perspective / Ganesh Lalitha Gopalakrishnan. (2019). CRC Press, Taylor & Francis Group, page 42
