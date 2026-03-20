% Todas las conexiones
connects(q1,a,q2).
connects(q1,b,q4).
connects(q1,c,q1).

connects(q2,a,q3).
connects(q2,b,q4).
connects(q2,c,q1).

connects(q3,a,q3).
connects(q3,b,q5).
connects(q3,c,q3).

connects(q4,a,q2).
connects(q4,b,q5).
connects(q4,c,q1).

connects(q5,a,q3).
connects(q5,b,q5).
connects(q5,c,q6).

connects(q6,a,q3).
connects(q6,b,q5).
connects(q6,c,q3).

% Estado final
final(q6).

% Condicion final, solo va a entrar cuando se haya terminado el string
avanzar([],Estadofinal,_):-
    final(Estadofinal).

% Funcion principal, recorre todo el DFA
avanzar([Action|Rest], Current, Answer):-
    connects(Current,Action,Nextpos),
    avanzar(Rest,Nextpos,Answer).

% Funcion inicial, lo que se escribe en terminal
revisar(String):-
    avanzar(String, q1, _).