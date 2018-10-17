%Ejercicio 2

guardarBinario(Arbol,Numero):-
    open('Generados/Arbol_binario.txt',write,Flujo),
    buscar(Arbol,Flujo,Numero),
    close(Flujo).

buscar([[],Nc,[]],Flujo,_):-
    writeln(Flujo,Nc),!.

buscar([_,Nc,_],Flujo,Nc):-
    writeln(Flujo,Nc),!.


buscar([_,Nc,Nd],Flujo,Numero):-
    <(Nc,Numero),
    write(Flujo,Nc),
    write(Flujo, '\n'),
    buscar(Nd,Flujo,Numero),!.

buscar([Nz,Nc,_],Flujo,Numero):-
    >(Nc,Numero),
    write(Flujo,Nc),
    write(Flujo, '\n'),
    buscar(Nz,Flujo,Numero),!.


%Ejercicio 2






