
eliminarL(Lista,Ac,Ocurrencia):-
    eliminar(Lista,Ac,Ocurrencia).

eliminar([],[],_):-!.

eliminar([Cabeza|Cola],Ac,Ocurrencia):-
    eliminar(Cola,Acumulador,Ocurrencia),
    \==(Cabeza,Ocurrencia),
    =(Ac,[Cabeza|Acumulador]),!.


eliminar([Cabeza|Cola],Ac,Ocurrencia):-
    eliminar(Cola,Acumulador,Ocurrencia),
    ==(Cabeza,Ocurrencia),
    =(Ac,Acumulador),!.

