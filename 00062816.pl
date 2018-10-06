%José Alexander García Valladares 00062816%

%Problema 1 verificar si dos listas son iguales%

% Caso base, cuando ambos ya no tienen mas elementos
arregloQ([],[]):-!.

% Caso especial para elmentos atomicos
arregloQ(Elemento1,Elemento2):-
    atomic(Elemento1),
    atomic(Elemento2),
    ==(Elemento1,Elemento2),!.

% Verifica uno por uno las cabezas de las listas.
arregloQ(Lista1,Lista2):-
    =([Cabeza1|Cola1],Lista1),
    =([Cabeza2|Cola2],Lista2),
    ==(Cabeza1,Cabeza2),
    arregloQ(Cola1,Cola2).

%Problema 2 invertir una lista%

% Mantiene aridad 2
revertirL(Lista,Invertida):-
    =([Cabeza|Cola],Lista),
    revertir(Cola,[Cabeza],Invertida),!.

% Caso especial si solo es un elmento
revertirL(Lista,Invertida):-
    atomic(Lista),
    =(Invertida,Lista),!.

%Caso base cuando ya no se tengan elementos.
revertir([],Acumulador,Invertida):-
    Invertida=Acumulador,!.


% Saca la cabeza de la lista de elementos para luego agregarla lista con
% acumulador para la proxima iteracion.
revertir(Elementos,Acumulador, Invertida):-
    =([Cabeza|Cola],Elementos),
    atomic(Cabeza),
    revertir(Cola,[Cabeza|Acumulador],Invertida).

% Si no es atomico se reordena la lista que tiene en su interior
revertir(Elementos,Acumulador, Invertida):-
    =([Cabeza|Cola],Elementos),
    \+atomic(Cabeza),
    revertirL(Cabeza,Reordenado),
    revertir(Cola,[Reordenado|Acumulador],Invertida).













