% 00099216 Andrés Antonio Quijada Muñoz
% 00062816 Jose Alexander Garcia Valladares
% 00043516 Nelson Giovanni Castro Rodas


%Primer problema, CanÃ­bales y misioneros.
%Correr con canibalesymisioneros.
canibalesymisioneros():-
    =(InitialState, [[0,0,3,3,derecha]]),
    cruzar([0,0,3,3,derecha], _, InitialState).

mostrarR([Cabeza]):-
    write("MI CI MD CD L\n"),
    write(Cabeza).

mostrarR([Cabeza|Cola]):-
    mostrarR(Cola),
    write("\nMI CI MD CD L\n"),
    write(Cabeza).


cruzar([3,3,0,0,izquierda], _,FinalState):-
    write("\n"),
    mostrarR(FinalState),!.
cruzar(State, NS, Archive):-
    pasar(State, NS, Archive, NewState),
    cruzar(NS, _, NewState),!.

revisarSeguridad(M, C):-
    >=(M, C).
revisarSeguridad(0, C):-
    >(C, 0).

pasar([MisionerosIzquierda, CanibalesIzquierda, MisionerosDerecha, CanibalesDerecha, derecha], [MisionerosIzquierdaM, CanibalesIzquierda, MisionerosDerechaM, CanibalesDerecha, izquierda], Archive, NewState):-
    >(MisionerosDerecha, 0),
    is(MisionerosDerechaM, MisionerosDerecha-1),
    is(MisionerosIzquierdaM, MisionerosIzquierda+1),
    revisarSeguridad(MisionerosDerechaM, CanibalesDerecha),
    revisarSeguridad(MisionerosIzquierdaM, CanibalesIzquierda),
    saveState(Archive, [MisionerosIzquierdaM, CanibalesIzquierda, MisionerosDerechaM, CanibalesDerecha, izquierda], NewState).

pasar([MisionerosIzquierda, CanibalesIzquierda, MisionerosDerecha, CanibalesDerecha, derecha], [MisionerosIzquierda, CanibalesIzquierdaM, MisionerosDerecha, CanibalesDerechaM, izquierda], Archive, NewState):-
    >(CanibalesDerecha, 0),
    is(CanibalesDerechaM, CanibalesDerecha-1),
    is(CanibalesIzquierdaM, CanibalesIzquierda+1),
    revisarSeguridad(MisionerosIzquierda, CanibalesIzquierdaM),
    saveState(Archive, [MisionerosIzquierda, CanibalesIzquierdaM, MisionerosDerecha, CanibalesDerechaM, izquierda], NewState).

pasar([MisionerosIzquierda, CanibalesIzquierda, MisionerosDerecha, CanibalesDerecha, derecha], [MisionerosIzquierdaM, CanibalesIzquierda, MisionerosDerechaM, CanibalesDerecha, izquierda], Archive, NewState):-
    >(MisionerosDerecha, 1),
    is(MisionerosDerechaM, MisionerosDerecha-2),
    is(MisionerosIzquierdaM, MisionerosIzquierda+2),
    revisarSeguridad(MisionerosDerechaM, CanibalesDerecha),
    revisarSeguridad(MisionerosIzquierdaM, CanibalesIzquierda),
    saveState(Archive, [MisionerosIzquierdaM, CanibalesIzquierda, MisionerosDerechaM, CanibalesDerecha, izquierda], NewState).

pasar([MisionerosIzquierda, CanibalesIzquierda, MisionerosDerecha, CanibalesDerecha, derecha], [MisionerosIzquierda, CanibalesIzquierdaM, MisionerosDerecha, CanibalesDerechaM, izquierda], Archive, NewState):-
    >(CanibalesDerecha, 1),
    is(CanibalesDerechaM, CanibalesDerecha-2),
    is(CanibalesIzquierdaM, CanibalesIzquierda+2),
    revisarSeguridad(MisionerosIzquierda, CanibalesIzquierdaM),
    saveState(Archive, [MisionerosIzquierda, CanibalesIzquierdaM, MisionerosDerecha, CanibalesDerechaM, izquierda], NewState).

pasar([MisionerosIzquierda, CanibalesIzquierda, MisionerosDerecha, CanibalesDerecha, derecha], [MisionerosIzquierdaM, CanibalesIzquierdaM, MisionerosDerechaM, CanibalesDerechaM, izquierda], Archive, NewState):-
    >(MisionerosDerecha, 0),
    >(CanibalesDerecha, 0),
    is(CanibalesDerechaM, CanibalesDerecha-1),
    is(CanibalesIzquierdaM, CanibalesIzquierda+1),
    is(MisionerosDerechaM, MisionerosDerecha-1),
    is(MisionerosIzquierdaM, MisionerosIzquierda+1),
    revisarSeguridad(MisionerosIzquierdaM, CanibalesIzquierdaM),
    saveState(Archive, [MisionerosIzquierdaM, CanibalesIzquierdaM, MisionerosDerechaM, CanibalesDerechaM, izquierda], NewState).

pasar([MisionerosIzquierda, CanibalesIzquierda, MisionerosDerecha, CanibalesDerecha, izquierda], [MisionerosIzquierdaM, CanibalesIzquierda, MisionerosDerechaM, CanibalesDerecha, derecha], Archive, NewState):-
    >(MisionerosIzquierda, 0),
    is(MisionerosIzquierdaM, MisionerosIzquierda-1),
    is(MisionerosDerechaM, MisionerosDerecha+1),
    revisarSeguridad(MisionerosIzquierdaM, CanibalesIzquierda),
    revisarSeguridad(MisionerosDerechaM, CanibalesDerecha),
    saveState(Archive, [MisionerosIzquierdaM, CanibalesIzquierda, MisionerosDerechaM, CanibalesDerecha, derecha], NewState).

pasar([MisionerosIzquierda, CanibalesIzquierda, MisionerosDerecha, CanibalesDerecha, izquierda], [MisionerosIzquierda, CanibalesIzquierdaM, MisionerosDerecha, CanibalesDerechaM, derecha], Archive, NewState):-
    >(CanibalesIzquierda, 0),
    is(CanibalesIzquierdaM, CanibalesIzquierda-1),
    is(CanibalesDerechaM, CanibalesDerecha+1),
    revisarSeguridad(MisionerosDerecha, CanibalesDerechaM),
    saveState(Archive, [MisionerosIzquierda, CanibalesIzquierdaM, MisionerosDerecha, CanibalesDerechaM, derecha], NewState).

pasar([MisionerosIzquierda, CanibalesIzquierda, MisionerosDerecha, CanibalesDerecha, izquierda], [MisionerosIzquierdaM, CanibalesIzquierda, MisionerosDerechaM, CanibalesDerecha, derecha], Archive, NewState):-
    >(MisionerosIzquierda, 1),
    is(MisionerosIzquierdaM, MisionerosIzquierda-2),
    is(MisionerosDerechaM, MisionerosDerecha+2),
    revisarSeguridad(MisionerosIzquierdaM, CanibalesIzquierda),
    revisarSeguridad(MisionerosDerechaM, CanibalesDerecha),
    saveState(Archive, [MisionerosIzquierdaM, CanibalesIzquierda, MisionerosDerechaM, CanibalesDerecha, derecha], NewState).

pasar([MisionerosIzquierda, CanibalesIzquierda, MisionerosDerecha, CanibalesDerecha, izquierda], [MisionerosIzquierda, CanibalesIzquierdaM, MisionerosDerecha, CanibalesDerechaM, derecha], Archive, NewState):-
    >(CanibalesIzquierda, 1),
    is(CanibalesIzquierdaM, CanibalesIzquierda-2),
    is(CanibalesDerechaM, CanibalesDerecha+2),
    revisarSeguridad(MisionerosDerecha, CanibalesDerechaM),
    saveState(Archive, [MisionerosIzquierda, CanibalesIzquierdaM, MisionerosDerecha, CanibalesDerechaM, derecha], NewState).

pasar([MisionerosIzquierda, CanibalesIzquierda, MisionerosDerecha, CanibalesDerecha, izquierda], [MisionerosIzquierdaM, CanibalesIzquierdaM, MisionerosDerechaM, CanibalesDerechaM, derecha], Archive, NewState):-
    >(MisionerosIzquierda, 0),
    >(CanibalesIzquierda, 0),
    is(CanibalesIzquierdaM, CanibalesIzquierda-1),
    is(CanibalesDerechaM, CanibalesDerecha+1),
    is(MisionerosIzquierdaM, MisionerosIzquierda-1),
    is(MisionerosDerechaM, MisionerosDerecha+1),
    revisarSeguridad(MisionerosDerechaM, CanibalesDerechaM),
    saveState(Archive, [MisionerosIzquierdaM, CanibalesIzquierdaM, MisionerosDerechaM, CanibalesDerechaM, derecha], NewState).


saveState(SS, NS, NewState):-
    revisar_G(SS, NS),
    =(NewState, [NS|SS]).

revisar_G([],_).

revisar_G([PrevState|PS],New):-
    \==(New, PrevState),
    revisar_G(PS, New).



% Para ejecutar escribir frogs()

frogs():-
    =(Inicio, [[verde, verde, verde, piedra, cafe, cafe, cafe]]),
    saltoRanas([verde, verde, verde, piedra, cafe, cafe, cafe], Inicio).


saltoRanas([cafe, cafe, cafe, piedra, verde, verde, verde], Mov):-
    nl,
    nl,
    imprimir(Mov),
    nl,
    write("Juego terminado"),
    nl,
    nl,
    fail.

saltoRanas(Ubi, Mov):-
    saltar(Ubi, NUbi),
    guardar(Mov, NMov, NUbi),
    saltoRanas(NUbi, NMov).

saltar(Ubi, NUbi):-
       mover(Ubi, NUbi).

guardar(Mov, NMov, NUbi):-
    revisar_M(Mov, NUbi),
    NMov = [NUbi|Mov].

revisar_M([], _).

revisar_M([MovAnt|MovsAnt], NUbi):-
    NUbi \== MovAnt,
    revisar_M(MovsAnt, NUbi).

imprimir([Head]):-
    write(Head).

imprimir([H|T]):-
    imprimir(T),
    write("-->"),
    write(H).


mover([verde, verde, verde, piedra, cafe, cafe, cafe], [verde, verde, verde, cafe, piedra, cafe, cafe]).
mover([verde, verde, verde, cafe, piedra, cafe, cafe], [verde, verde, piedra, cafe, verde, cafe, cafe]).
mover([verde, verde, piedra, cafe, verde, cafe, cafe], [verde, piedra, verde, cafe, verde, cafe, cafe]).
mover([verde, piedra, verde, cafe, verde, cafe, cafe], [verde, cafe, verde, piedra, verde, cafe, cafe]).
mover([verde, cafe, verde, piedra, verde, cafe, cafe], [verde, cafe, verde, cafe, verde, piedra, cafe]).
mover([verde, cafe, verde, cafe, verde, piedra, cafe], [verde, cafe, verde, cafe, verde, cafe, piedra]).
mover([verde, cafe, verde, cafe, verde, cafe, piedra], [verde, cafe, verde, cafe, piedra, cafe, verde]).
mover([verde, cafe, verde, cafe, piedra, cafe, verde], [verde, cafe, piedra, cafe, verde, cafe, verde]).
mover([verde, cafe, piedra, cafe, verde, cafe, verde], [piedra, cafe, verde, cafe, verde, cafe, verde]).
mover([piedra, cafe, verde, cafe, verde, cafe, verde], [cafe, piedra, verde, cafe, verde, cafe, verde]).
mover([cafe, piedra, verde, cafe, verde, cafe, verde], [cafe, cafe, verde, piedra, verde, cafe, verde]).
mover([cafe, cafe, verde, piedra, verde, cafe, verde], [cafe, cafe, verde, cafe, verde, piedra, verde]).
mover([cafe, cafe, verde, cafe, verde, piedra, verde], [cafe, cafe, verde, cafe, piedra, verde, verde]).
mover([cafe, cafe, verde, cafe, piedra, verde, verde], [cafe, cafe, piedra, cafe, verde, verde, verde]).
mover([cafe, cafe, piedra, cafe, verde, verde, verde], [cafe, cafe, cafe, piedra, verde, verde, verde]).

mover([verde, verde, verde, piedra, cafe, cafe, cafe], [verde, verde, piedra, verde, cafe, cafe, cafe]).
mover([verde, verde, piedra, verde, cafe, cafe, cafe], [verde, verde, cafe, verde, piedra, cafe, cafe]).
mover([verde, verde, cafe, verde, piedra, cafe, cafe], [verde, verde, cafe, verde, cafe, piedra, cafe]).
mover([verde, verde, cafe, verde, cafe, piedra, cafe], [verde, verde, cafe, piedra, cafe, verde, cafe]).
mover([verde, verde, cafe, piedra, cafe, verde, cafe], [verde, piedra, cafe, verde, cafe, verde, cafe]).
mover([verde, piedra, cafe, verde, cafe, verde, cafe], [piedra, verde, cafe, verde, cafe, verde, cafe]).
mover([piedra, verde, cafe, verde, cafe, verde, cafe], [cafe, verde, piedra, verde, cafe, verde, cafe]).
mover([cafe, verde, piedra, verde, cafe, verde, cafe], [cafe, verde, cafe, verde, piedra, verde, cafe]).
mover([cafe, verde, cafe, verde, piedra, verde, cafe], [cafe, verde, cafe, verde, cafe, verde, piedra]).
mover([cafe, verde, cafe, verde, cafe, verde, piedra], [cafe, verde, cafe, verde, cafe, piedra, verde]).
mover([cafe, verde, cafe, verde, cafe, piedra, verde], [cafe, verde, cafe, piedra, cafe, verde, verde]).
mover([cafe, verde, cafe, piedra, cafe, verde, verde], [cafe, piedra, cafe, verde, cafe, verde, verde]).
mover([cafe, piedra, cafe, verde, cafe, verde, verde], [cafe, cafe, piedra, verde, cafe, verde, verde]).
mover([cafe, cafe, piedra, verde, cafe, verde, verde], [cafe, cafe, cafe, verde, piedra, verde, verde]).
mover([cafe, cafe, cafe, verde, piedra, verde, verde], [cafe, cafe, cafe, piedra, verde, verde, verde]).


%Literal 3
%Comienza al poner cruzar_puente_standard
cruzar_puente_standard:-
     cruzar_puente([derecha,derecha,derecha,derecha,derecha],30).

%Realiza el movimiento inicial
cruzar_puente([Abuelo,Papa,Mama,Mayor,Menor],Contador):-
    Estado_Inicial = [Abuelo,Papa,Mama,Mayor,Menor],
    verificar_posicion(Estado_Inicial,[Estado_Inicial],Contador,1).

% Existen dos tipos de movimiento, entre dos personas y una persona. La
% clausula a continuacion hace referencia al final de cuantas personas
% se esta hablando
verificar_posicion([izquierda,izquierda,izquierda,izquierda,izquierda],Estados,Contador,2):-
write('***Solucion posible encontrada***'),nl, nl,
mostrar_estados(Estados), nl,
write('Tiempo Restante: '),write(Contador),nl,nl,false.

%Se llama a la clausula para cruzar el puente dos personas
verificar_posicion(Ubicacion,Estados,Contador,2):-
     cruzar_puente_2(Ubicacion,Estados,Contador).

%Se llama a la clausula para cruzar a una persona
verificar_posicion(Ubicacion,Estados,Contador,1):-
    cruzar_puente_1(Ubicacion,Estados,Contador).

% La condicion de paro de estas clausulas es que el tiempo se agote o
% que se encuentre la respuesta
cruzar_puente_1(Ubicacion, Estados, Contador):-
     ir_parejas(Ubicacion, Ubicacion2, Valor),
     is(Aux, -(Contador, Valor)),
     >=(Aux, 0),
     guardar_estado(Estados, Estados2, Ubicacion2),
     verificar_posicion(Ubicacion2,Estados2,Aux,2).

% Siempre que cruzen dos personas se valida si todos han cruzado.
cruzar_puente_2(Ubicacion,Estados,Contador):-
     ir_regreso(Ubicacion, Ubicacion2, Valor),
     is(Aux, -(Contador, Valor)),
     >=(Aux, 0),
     guardar_estado(Estados,Estados2, Ubicacion2),
     verificar_posicion(Ubicacion2,Estados2, Aux,1).

%Se buscan el movimiento de una persona
ir_regreso(Ubicacion,Ubicacion2,Contador):-
        trasladar_1(Ubicacion,Ubicacion2,Contador).

%Se buscan entre los posibles casos de movimientos pares
ir_parejas(Ubicacion, Ubicacion2, Contador):-
	trasladar_2(Ubicacion, Ubicacion2, Contador).


%Abuelo 12 Papa 8 Mama 6 Mayor 3 Menor 1

%Movimientos en parejas

%Movimientos con el abuelo
trasladar_2([derecha,derecha,Mama,Mayor,Menor],[izquierda,izquierda,Mama,Mayor,Menor],12).
trasladar_2([derecha,Papa,derecha,Mayor,Menor],[izquierda,Papa,izquierda,Mayor,Menor],12).
trasladar_2([derecha,Papa,Mama,derecha,Menor],[izquierda,Papa,Mama,izquierda,Menor], 12).
trasladar_2([derecha,Papa,Mama,Mayor,derecha],[izquierda,Papa,Mama,Mayor,izquierda],12).

%Movimientos con el padre
trasladar_2([Abuelo,derecha,derecha,Mayor,Menor],[Abuelo,izquierda,izquierda,Mayor,Menor],8).
trasladar_2([Abuelo,derecha,Mama,derecha,Menor],[Abuelo,izquierda,Mama,izquierda,Menor],8).
trasladar_2([Abuelo,derecha,Mama,Mayor,derecha],[Abuelo,izquierda,Mama,Mayor,izquierda],8).

%Movimientos con la mama
trasladar_2([Abuelo,Papa,derecha,derecha,Menor],[Abuelo,Papa,izquierda,izquierda,Menor],6).
trasladar_2([Abuelo,Papa,derecha,Mayor,derecha],[Abuelo,Papa,izquierda,Mayor,izquierda],6).


%Movimientos con el mayor
trasladar_2([Abuelo,Papa,Mama,derecha,derecha],[Abuelo,Papa,Mama,izquierda,izquierda],3).


%Movimientos individuales
trasladar_1([izquierda,Papa,Mama,Mayor,Menor],[derecha,Papa,Mama,Mayor,Menor],12).
trasladar_1([Abuelo,izquierda,Mama,Mayor,Menor],[Abuelo,derecha,Mama,Mayor,Menor],8).
trasladar_1([Abuelo,Papa,izquierda,Mayor,Menor],[Abuelo,Papa,derecha,Mayor,Menor],6).
trasladar_1([Abuelo,Papa,Mama,izquierda,Menor],[Abuelo,Papa,Mama,derecha,Menor],3).
trasladar_1([Abuelo,Papa,Mama,Mayor,izquierda],[Abuelo,Papa,Mama,Mayor,derecha],1).



guardar_estado(Estados, Estados2, Ubicacion2):-
	revisar_A(Estados, Ubicacion2),
	Estados2 = [Ubicacion2|Estados].

revisar_A([], _).
revisar_A([EstadoAnt|EstadosAnt], Ubicacion2):-
	Ubicacion2 \== EstadoAnt,
	revisar_A(EstadosAnt, Ubicacion2).



mostrar_estados([]):-!.

mostrar_estados([Estado|EstadosAnt]):-
     mostrar_estados(EstadosAnt),
     write(Estado),nl.






