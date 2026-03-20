# Evidencia Implementación de Análisis Léxico (Automata y Expresión Regular)

Joel Guadalupe García Guzmán - A01713785


## Descripción

El lenguaje que yo escogí se compone de Σ = a,b,c y sigue las siguientes reglas
<ul>
    <li>Tiene que tener <b>aa</b> o <b>bb</b></li>
    <li>Tiene que terminar en <b>bc</b></li>
</ul>
Esas son todas las reglas de mi lenguaje. Al ser muy pocas voy a usar un autómata determinístico finito (<b>DFA</b> por sus siglas en inglés). <br>
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

Aqui van las pruebas que haga con los programas 

## Soluciones con Regex

Mi primera versión de mi expresión en Regex es funcional pero bastante larga <br>
<b>((a|b|c)\*((aa)|(bb))(a|b|c)\*(bc))|((a|b|c)*(bbc))</b><br>
Esta fue la primera versión, la cual queda tan larga pues tiene que considerar los casos que contenga el par de letras 'aa' y 'bb' en algun momento
y terminar con 'bc' y el otro caso que es cuando el conjunto de letras 'bc' final es parte de la repeticion de letras 'bb'.

<b>\[a-c]\*(aa[a-c]*bc|bb[a-c]*bc|bbc)</b><br>
Esta es mi segunda version

## Referencias

Automata and computability : a programmer’s perspective / Ganesh Lalitha Gopalakrishnan. (2019). CRC Press, Taylor & Francis Group, page 42
