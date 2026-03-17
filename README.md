# Evidencia Implementación de Análisis Léxico (Automata y Expresión Regular)

Joel Guadalupe García Guzmán - A01713785


## Descripción

El lenguaje que yo escogí tiene las siguientes reglas:
<ul>
    <li>Todas las combinaciones con las letras <b>abc</b></li>
    <li>Tiene que tener <b>aa</b> o <b>bb</b></li>
    <li>Tiene que terminar en <b>bc</b></li>
</ul>
Esas son todas las reglas de mi lenguaje. Al ser muy pocas voy a usar un autómata determinístico finito (<b>DFA</b> por sus siglas en inglés). <br>

## Soluciones con autómatas

<img src="images/DFA_first.jpg" alt="Mi primer DFA" width="500">

Versión 1 de mi autómata, lo hice en la clase que escogimos el autómata pero le agregué algunos detalles de formato como que inicialmente no escribí el nombre de los estados y no coloqué la flecha del estado inicial.
Tenía algunos errores en la lógica como que en cuanto llegue a q6 (estado final) se acaba el autómata y no existe ningún camino a otro lado, cosa que me daría error si en medio del string contiene ‘bc’, lo cual corregí en la segunda versión.

<img src="images/DFA_boring.jpg" alt="DFA corregido" width="500">

En esta segunda versión de mi autómata, ya está hecho digitalmente, mejorando la visibilidad. También corregí el error que cuando llegaba a q6 no tendría ningún lugar a donde ir.
