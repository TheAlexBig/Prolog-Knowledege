factorial:-
    write('Digite N:'),
    read(N),
    factorial(N,Fact),
    write('El factorial es:'),
    write(Fact).


factorial(1,X):-
    is(X,1).
    !.
factorial(0,1):-!.

factorial(Factor,Factorial):-
   >(Factor,1),
   is(FactorAnt,-(Factor,1)),
   factorial(FactorAnt,Acum),
   is(Factorial,*(Acum,Factor)).









