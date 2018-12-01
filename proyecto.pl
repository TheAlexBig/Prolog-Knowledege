%Literal 3
cruzar_puente_standard:-
     cruzar_puente([derecha,derecha,derecha,derecha,derecha],30).

cruzar_puente([Abuelo,Papa,Mama,Mayor,Menor],Contador):-
    Estado_Inicial = [Abuelo,Papa,Mama,Mayor,Menor],
    verificar_posicion(Estado_Inicial,[Estado_Inicial],Contador,1).

%En la mitad de la ejecucion se valida la respuesta
verificar_posicion([izquierda,izquierda,izquierda,izquierda,izquierda],Estados,Contador,2):-
write('***Solucion posible encontrada***'),nl, nl,
mostrar_estados(Estados), nl,
write('Tiempo Restante: '),write(Contador),nl,nl,false.


verificar_posicion(Ubicacion,Estados,Contador,2):-
     cruzar_puente_2(Ubicacion,Estados,Contador).


verificar_posicion(Ubicacion,Estados,Contador,1):-
    cruzar_puente_1(Ubicacion,Estados,Contador).


cruzar_puente_1(Ubicacion, Estados, Contador):-
     ir_parejas(Ubicacion, Ubicacion2, Valor),
     is(Aux, -(Contador, Valor)),
     >=(Aux, 0),
     guardar_estado(Estados, Estados2, Ubicacion2),
     verificar_posicion(Ubicacion2,Estados2,Aux,2).


cruzar_puente_2(Ubicacion,Estados,Contador):-
     ir_regreso(Ubicacion, Ubicacion2, Valor),
     is(Aux, -(Contador, Valor)),
     >=(Aux, 0),
     guardar_estado(Estados,Estados2, Ubicacion2),
     verificar_posicion(Ubicacion2,Estados2, Aux,1).


ir_regreso(Ubicacion,Ubicacion2,Contador):-
        trasladar_1(Ubicacion,Ubicacion2,Contador).

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
	revisar(Estados, Ubicacion2),
	Estados2 = [Ubicacion2|Estados].

revisar([], _).
revisar([EstadoAnt|EstadosAnt], Ubicacion2):-
	Ubicacion2 \== EstadoAnt,
	revisar(EstadosAnt, Ubicacion2).



mostrar_estados([]):-!.

mostrar_estados([Estado|EstadosAnt]):-
     mostrar_estados(EstadosAnt),
     write(Estado),nl.






