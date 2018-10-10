
%Problema 2


contarnodos(Arbol,L):-
    nodos(Arbol,Contador),
    is(L,(Contador)).

nodos([[],_,[]],1):-!.

nodos([Nz,_,Nd],L):-
    nodos(Nz,L1),
    nodos(Nd,L2),
    is(L,+(L1,+(L2,1))).


%Problema 4

cortaarbol(Arbol, Dato, Restante, Cortado):-
    buscar(Arbol,Dato,Restante,Cortado).


buscar([],_,[],[]):-!.

buscar([Nz,Dato,Nd],Dato,[],Cortado):-
    =(Cortado,[Nz,Dato,Nd]),!.

buscar([Nz,Nc,Nd],Dato,Restante,Cortado):-
   =<(Dato,Nc),
   buscar(Nz,Dato,Aux,Cortado),
   =(Restante,[Aux,Nc,Nd]),!.

buscar([Nz,Nc,Nd],Dato,Restante,Cortado):-
   >(Dato,Nc),
   buscar(Nd,Dato,Aux,Cortado),
   =(Restante,[Nz,Nc,Aux]),!.












