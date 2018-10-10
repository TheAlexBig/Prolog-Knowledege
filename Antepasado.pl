:- dynamic eslabon/1.

antepasadoDirecto(X,Y):-
    padre(X,Y),!.

antepasadoDirecto(X,Y):-
    madre(X,Y),!.

antepasadoDirecto(X,Y):-
    padre(X,Z),
    antepasado(Y,Z).

antepasadoDirecto(X,Y):-
    madre(X,Z),
    antepasado(Y,Z).























