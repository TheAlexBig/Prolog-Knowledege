conecta_con(calle,cochera).
conecta_con(cochera,calle).
conecta_con(cochera,sala).
conecta_con(sala,cochera).
conecta_con(sala,pasillo1).
conecta_con(pasillo1,sala).
conecta_con(comedor,pasillo1).
conecta_con(pasillo1,comedor).
conecta_con(baño,pasillo1).
conecta_con(pasillo1,baño).
conecta_con(cocina,pasillo1).
conecta_con(pasillo1,cocina).
conecta_con(cocina,lavadero).
conecta_con(lavadero,cocina).
conecta_con(cocina,lavadero).
conecta_con(pasillo1,lavadero).
conecta_con(lavadero,pasillo1).
conecta_con(pasillo1,pasillo2).
conecta_con(pasillo2,pasillo1).
conecta_con(cuarto_de_papas,pasillo2).
conecta_con(pasillo2,cuarto_de_papas).
conecta_con(cuarto_de_rodri,pasillo2).
conecta_con(pasillo2,cuarto_de_rodri).
conecta_con(pasillo2,jardin).
conecta_con(jardin,pasillo2).
conecta_con(quiosco,jardin).
conecta_con(jardin,quiosco).

esta_en(pantuflas,cuarto_de_rodri).
esta_en(flore,jardin).
esta_en(pisto,cuarto_de_papas).
esta_en(vaso_con_agua,cocina).
esta_en(limones,jardin).
esta_en(papel_higienico,baño).


ida_y_vuelta(A,B):-
    abolish(camino,1),
    assert(camino(B)),
    ida(B,A),
    writeln(B),
    writeln('**protocolo de retorno**'),
    abolish(camino,1),
    assert(camino(A)),
    ida(A,B),
    writeln(A),
    !.

ida(A,B):-
    assert(camino(B)),
    conecta_con(A,B),
    writeln(B).

ida(A,B):-
    conecta_con(A,C),
    \+camino(C),
    assert(camino(C)),
    ida(C,B),
    writeln(C).

%ida_y_vuelta(inicio,fin).












