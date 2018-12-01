% 7) Amigos salen a beber
posiciones(C):-
    =(A,[[1,_],[2,_],[3,_],[4,_]]),
    =(B,[[1,_],[2,_],[3,_],[4,_]]),
    asiento([Angel,angel],A),
    bebida([Tequila,tequila],B),
    =:=(Tequila,+(Angel,1)),
    bebida([Vino,vino],B),
    bebida([Cerveza,cerveza],B),
    \+(=:=(Vino,+(Cerveza,1));=:=(Vino,-(Cerveza,1))),
    bebida([Champa,champaña],B),
    (=:=(Champa,1);=:=(Champa,4)),
    asiento([Cesar,cesar],A),
    asiento([Diego,diego],A),
    (=:=(Diego,+(Vino,1));=:=(Diego,-(Vino,1))),
    =:=(Cesar,+(Angel,1)),
    asiento([Boris,boris],A),
    \+(=:=(Boris,Cerveza)),
    arreglar(A,B,C).

sacardato([_,Resultado],Resultado).

arreglar([],[],[]).
arreglar([Cabeza1|Cola1],[Cabeza2|Cola2],Final):-
    sacardato(Cabeza1,Dato1),
    sacardato(Cabeza2,Dato2),
    arreglar(Cola1,Cola2,Aux),
    =(Final,[[Dato1,Dato2]|Aux]).

asiento([1,Persona],[[1,Persona],_,_,_]).
asiento([2,Persona],[_,[2,Persona],_,_]).
asiento([3,Persona],[_,_,[3,Persona],_]).
asiento([4,Persona],[_,_,_,[4,Persona]]).


bebida([1,Bebida],[[1,Bebida],_,_,_]).
bebida([2,Bebida],[_,[2,Bebida],_,_]).
bebida([3,Bebida],[_,_,[3,Bebida],_]).
bebida([4,Bebida],[_,_,_,[4,Bebida]]).


%posiciones(C) y te devuelve el resultado














