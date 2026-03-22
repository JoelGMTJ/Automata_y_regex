% Consulta el archivo donde programe mi DFA
:- consult('automataTester.pl').

% Usa una nueva sentencia, el '->' es similar a usar un if, else de otros lenguajes
% obtenido de https://www.swi-prolog.org/pldoc/man?predicate=-%3E/2 
try(String) :-
    write(String), write(': '),
    ( revisar(String) -> write('Valido') ; write('Invalido') ), nl.

% Todos mis casos de prueba
probardfa :-
    write('Todos estos deberian de funcionar (Validos):'), nl,
    try([a,b,b,c]),
    try([a,a,b,c]),
    try([b,b,a,b,c,b,a,b,c]),
    try([a,b,c,a,b,c,a,b,b,a,b,c]),
    try([b,b,c]),
    try([b,b,a,b,c]),
    try([a,a,b,b,c,a,b,b,c]),
    try([c,c,c,a,a,b,c]),
    try([b,b,b,b,c]),
    try([a,a,b,c,b,c]),
    nl,
    write('Todos estos deberian de ser invalidos (Rechazados):'), nl,
    try([a,a,c]),
    try([a]),
    try([a,b]),
    try([b,c]),
    try([a,b,b,c,c]),
    try([b,c,b,c,b]),
    try([a,b,c,c,b]),
    try([a,b,c,b,a,b,c,a,b,c]),
    try([a,a,b,b]),
    try([]),
    try([a,a,b,c,a]).
