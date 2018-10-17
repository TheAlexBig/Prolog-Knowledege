crearArchivo:-
    open('Generados/Primero.txt',write,Archivo),
    close(Archivo).

leerArchivo:-
    open('Generados/Primero.txt',read,Archivo),
    read(Archivo,Variable),
    writeln(Variable),
    close(Archivo).


escribir_nombre:-
    open('Generados/Primero.txt',write,Flujo),
    write('Escriba su nombre: '),
    read(Nombre),
    write(Flujo,Nombre),
    close(Flujo).


lectura_repetida:-
    open('Generados/Numeros.txt',read,Flujo),
    ciclo(Flujo),
    close(Flujo).


ciclo(Flujo):-
    read(Flujo,Aux),
    \==(Aux, end_of_file),
    write(Aux),
    write('\n'),
    ciclo(Flujo).

ciclo(Flujo):-
    read(Flujo,Aux),
    ==(Aux, end_of_file).













