intercalar_listas([],[],[]):-!.

intercalar_listas([Cabeza1|Cola1],[Cabeza2|Cola2],Resultado):-
    intercalar_listas(Cola1,Cola2,Aux),
    =(Resultado,[Cabeza1,Cabeza2|Aux]).


invertir(Lista,Resultado):-
    invertir_lista(Lista,[],ListaFinal),
    =(Resultado,ListaFinal).

invertir_lista([],Lista,Lista):-!.

invertir_lista([Cabeza|Cola],ListaAcumulada,ListaFinal):-
    =(ListaAux,[Cabeza|ListaAcumulada]),
    invertir_lista(Cola,ListaAux,ListaFinal).



invertir_numeros(Numero,Resultado):-
    invertir_numero(Numero,0,Resultado).


invertir_numero(Numero,Invertido,Resultado):-
    >(Numero,10),
    is(Modulo, mod(Numero,10)),
    is(Resto,/(-(Numero,Modulo),10)),
    is(Invertido, +(*(Modulo,10),Resto)),
    invertir_numero(Resto,Invertido,Resultado).

invertir_numero(_,Num,Num):-!.
