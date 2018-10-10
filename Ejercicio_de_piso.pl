
oredenar(E,L):-
    evaluar(E,L,1).

evaluar([H|T],L,N):-
    ==(H,lencha),
    evaluar(T,Acu,N+1),
    =(L,[[H,N]|Acu]).





