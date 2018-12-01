%Jose Alexander Garcia Valladares 00062816
%ejercicio 3

%por si es necesario
creararchivo_ejercicio3:-
    open('palabras.txt',write,Flujo),
    meter('célebres',Flujo,0),
    close(Flujo).

meter(_,_,100):-!.

meter(A,Flujo,Contador):-
    writeln(Contador),
    write(Flujo,A),
    is(Acumulado,+(Contador,1)),
    write(Flujo,Acumulado),
    write(Flujo,'.\n'),
    meter(A,Flujo,Acumulado).

celebre:-
    open('palabras.txt',read,Flujo),
    random(S),
    is(Aumentado,mod(round(*(S,100)),100)),
    leer(Flujo,Aumentado),
    close(Flujo).

leer(Flujo,0):-
    read(Flujo,Linea),
    writeln(Linea),!.
leer(Flujo,A):-
   is(Acumulado,-(A,1)),
   read(Flujo,_),
   leer(Flujo,Acumulado).

%Ejercicio 5
recorrer(Flujo,Inicio,Insertado):-
    read(Flujo,Valor1),
    writeln(Valor1),
    \==(Valor1, end_of_file),
    read(Flujo,Valor2),
    read(Flujo,Valor3),
    recorrer(Flujo,Inicio,Lista),
    =(Insertado,[[Valor1,Valor2,Valor3]|Lista]),!.

recorrer(_,Lista,Lista):-!.

leerdocumento(S):-
    open('informacion.txt',read,Flujo),
    recorrer(Flujo,[],Lista),
    =(S,Lista),
    close(Flujo).

%Ejercicio 8
es_la_hora(1,'7:00am').
es_la_hora(2,'10:00am').
es_la_hora(3,'12:00m').
es_la_hora(4,'3:00pm').
es_la_hora(5,'5:00pm').
es_la_hora(6,'7:00pm').

%Literal a
temperaturadiaria:-
    temperatura.

%Litera b
temperaturahora:-
    open('temp_lunes.txt',read,Flujo1),
    lecturadividida(Flujo1,0,Lista1),
    close(Flujo1),
    open('temp_martes.txt',read,Flujo2),
    lecturadividida(Flujo2,0,Lista2),
    close(Flujo2),
    open('temp_miercoles.txt',read,Flujo3),
    lecturadividida(Flujo3,0,Lista3),
    close(Flujo3),
    open('temp_jueves.txt',read,Flujo4),
    lecturadividida(Flujo4,0,Lista4),
    close(Flujo4),
    open('temp_viernes.txt',read,Flujo5),
    lecturadividida(Flujo5,0,Lista5),
    close(Flujo5),
    open('temp_sabado.txt',read,Flujo6),
    lecturadividida(Flujo6,0,Lista6),
    close(Flujo6),
    open('temp_domingo.txt',read,Flujo7),
    lecturadividida(Flujo7,0,Lista7),
    close(Flujo7),
    calculartemperaturahora(Lista1,Lista2,Lista3,Lista4,Lista5,Lista6,Lista7,1).


temperatura:-
    open('temp_lunes.txt',read,Flujo),
    lecturatemperatura(Flujo,0,Total),
    is(PromedioLunes,/(Total,5)),
    write('Temperatura promedio de Lunes: '),
    writeln(PromedioLunes),
    close(Flujo).

temperatura:-
    open('temp_martes.txt',read,Flujo),
    lecturatemperatura(Flujo,0,Total),
    is(PromedioLunes,/(Total,5)),
    write('Temperatura promedio de Martes: '),
    writeln(PromedioLunes),
    close(Flujo).

temperatura:-
    open('temp_miercoles.txt',read,Flujo),
    lecturatemperatura(Flujo,0,Total),
    is(PromedioLunes,/(Total,5)),
    write('Temperatura promedio de Miercoles: '),
    writeln(PromedioLunes),
    close(Flujo).

temperatura:-
    open('temp_jueves.txt',read,Flujo),
    lecturatemperatura(Flujo,0,Total),
    is(PromedioLunes,/(Total,5)),
    write('Temperatura promedio de Jueves: '),
    writeln(PromedioLunes),
    close(Flujo).

temperatura:-
    open('temp_viernes.txt',read,Flujo),
    lecturatemperatura(Flujo,0,Total),
    is(PromedioLunes,/(Total,5)),
    write('Temperatura promedio de Viernes: '),
    writeln(PromedioLunes),
    close(Flujo).

temperatura:-
    open('temp_sabado.txt',read,Flujo),
    lecturatemperatura(Flujo,0,Total),
    is(PromedioLunes,/(Total,5)),
    write('Temperatura promedio de Sabado: '),
    writeln(PromedioLunes),
    close(Flujo).

temperatura:-
    open('temp_domingo.txt',read,Flujo),
    lecturatemperatura(Flujo,0,Total),
    is(PromedioLunes,/(Total,5)),
    write('Temperatura promedio de Domingo: '),
    writeln(PromedioLunes),
    close(Flujo).


promedio(_,_,end_of_file,0):-!.

promedio(Flujo,Contador,Dato,Total):-
    Contador mod 2 =:= 0,
    lecturatemperatura(Flujo,Contador,Aux),
    is(Total,+(Aux,Dato)),
    !.

promedio(Flujo,Contador,_,Total):-
    lecturatemperatura(Flujo,Contador,Total),!.


lecturatemperatura(Flujo,Contador,Total):-
    read(Flujo,Temperatura),
    is(Acumulador,+(Contador,1)),
    promedio(Flujo,Acumulador,Temperatura,Aux),
    is(Total,Aux),!.

amalgamar(_,end_of_file,_,[]):-!.

amalgamar(Flujo,Dato,Contador,Lista):-
    Contador mod 2 =:= 0,
    lecturadividida(Flujo,Contador,Aux),
    =(Lista,[Dato|Aux]),!.

amalgamar(Flujo,_,Contador,Total):-
    lecturadividida(Flujo,Contador,Total),!.

lecturadividida(Flujo,Contador,Lista):-
    read(Flujo,Temperatura),
    is(Acumulador,+(Contador,1)),
    amalgamar(Flujo,Temperatura,Acumulador,Aux),
    =(Lista,Aux),!.

calculartemperaturahora([],[],[],[],[],[],[],_):-!.

calculartemperaturahora([Cabeza1|Cola1],[Cabeza2|Cola2],[Cabeza3|Cola3],[Cabeza4|Cola4],[Cabeza5|Cola5],[Cabeza6|Cola6],[Cabeza7|Cola7],Contador):-
    is(Sumatoria, Cabeza1 + Cabeza2 + Cabeza3 + Cabeza4 + Cabeza5 + Cabeza6 + Cabeza7),
    is(Promedio,/(Sumatoria,5)),
    is(Acumulador,+(Contador,1)),
    write('En la hora '),
    es_la_hora(Contador,X),
    write(X),
    write(' la temperatura promedio es: '),
    writeln(Promedio),
    calculartemperaturahora(Cola1,Cola2,Cola3,Cola4,Cola5,Cola6,Cola7,Acumulador).

%Ejercicio 9
muestralinea(Arch,Nlinea,Linea):-
    open(Arch,read,Flujo),
    leerpoema(Flujo,Nlinea,Linea),
    close(Flujo).

leerpoema(Flujo,1,Linea):-
    read(Flujo,Linea),
    \==(Linea,end_of_file),!.

leerpoema(Flujo,Nlinea,Linea):-
    read(Flujo,Valor),
    is(Disminuido,-(Nlinea,1)),
    \==(Valor,end_of_file),
    leerpoema(Flujo,Disminuido,Aux),
    =(Linea,Aux),!.

%Ejercicio 10
leercosas:-
    open('cosas.txt',read,Cosas),
    open('enteros.txt',write,Enteros),
    open('reales.txt',write,Reales),
    open('otros.txt',write,Otros),
    read(Cosas,Primero),
    verdato(Cosas,Enteros,Reales,Otros,Primero),
    close(Cosas),
    close(Enteros),
    close(Reales),
    close(Otros).


verdato(_,_,_,_,end_of_file):-!.

verdato(Cosas,Enteros,Reales,Otros,Dato):-
    integer(Dato),
    write(Enteros,Dato),
    write(Enteros,'.\n'),
    read(Cosas,DatoNuevo),
    verdato(Cosas,Enteros,Reales,Otros,DatoNuevo),!.

verdato(Cosas,Enteros,Reales,Otros,Dato):-
    number(Dato),
    write(Reales,Dato),
    write(Reales,'.\n'),
    read(Cosas,DatoNuevo),
    verdato(Cosas,Enteros,Reales,Otros,DatoNuevo),!.

verdato(Cosas,Enteros,Reales,Otros,Dato):-
    write(Otros,Dato),
    write(Otros,'.\n'),
    read(Cosas,DatoNuevo),
    verdato(Cosas,Enteros,Reales,Otros,DatoNuevo),!.
