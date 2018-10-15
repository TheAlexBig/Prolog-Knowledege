%Jose Alexander Garcia Valladares 00062816

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












