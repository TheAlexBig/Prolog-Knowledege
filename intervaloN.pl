
iniciar(N,L):-
    listaL(N,X),
    L=X.

listaL(0,_):-
    !.

listaL(N,L):-
    >(N,0),
    is(Naux,-(N,1)),

    listaL(Naux,X).

desplegarR([]):-
    !.

desplegarR(L):-
   [H|C]=L,
   writeln(H),
    desplegarR(C).

desplegarRD([]):-
    !.

desplegarRD(L):-
   [H|C]=L,
   desplegarR(H),
   desplegarRD(C).



