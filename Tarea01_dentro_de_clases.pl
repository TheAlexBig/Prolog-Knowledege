meter(S):-
    =(S,[[1,_],[2,_],[3,_],[4,_],[5,_]]),
    evaluar([X,chilo],S),
    <(X,5),
    evaluar([Y,canuta],S),
    >(Y,1),
    evaluar([Z,marina],S),
    evaluar([W,lencha],S),
    >(W,Y),
    evaluar([V,mario],S),
    \+(=:=(V,-(Y,1));=:=(V,+(Y,1))),
    \+(=:=(V,-(Z,1));=:=(V,+(Z,1))),
    >(V,1),
    <(V,5).

evaluar([1,Visitante],[[1,Visitante],_,_,_,_]).
evaluar([2,Visitante],[_,[2,Visitante],_,_,_]).
evaluar([3,Visitante],[_,_,[3,Visitante],_,_]).
evaluar([4,Visitante],[_,_,_,[4,Visitante],_]).
evaluar([5,Visitante],[_,_,_,_,[5,Visitante]]).



