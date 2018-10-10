resplandece(luna).
suena(campana).
informatico(paco).
abogada(ligia).

buen_estado(camino).
falla(\+auto).
gusta(\+sandia).
gusta(\+melon).

jugara(julito):-
    buen_estado(camino),
    falla(auto).

equivoque(salon).
asistieron(\+alumnos).

golpea(popeye,brutus).

volcan(altura,2500,metros).


local(ubi1).
local(ubi2).
local(ubi3).
local(ubi4).
local(ubi5).

no_encontrar(UMama,UPapa,UPepito):-
    local(UPepito),
    \==(UPapa,UPepito),
    \==(UMama,UPepito).



juego(lol).
juego(killer_instinct).
juego(fornite).
juego(wow).
juego(cod).

tiene(javito,lol).
tiene(pepito,fornite).
tiene(pepito,wow).
tiene(rodri,lol).

% el guion bajo se le llama variable anonima.
comprar_juego(Juego):-
    juego(Juego),
    \+ tiene(_X,Juego).


%12
sexo(hombre1,m).
sexo(hombre2,m).
sexo(hombre3,m).
sexo(mujer1,f).
sexo(mujer2,f).
sexo(mujer3,f).

ama(hombre1,mujer1).
ama(mujer1,hombre1).
ama(hombre2,mujer3).
ama(mujer3,hombre3).
ama(hombre2,mujer2).
ama(mujer2,hombre2).

se_pueden_casar(X,Y):-
    ama(X,Y),
    ama(Y,X),
    sexo(X,SX),
    sexo(Y,SY),
    \==(SX,SY).


%13
enemigo(a,b).
enemigo(b,c).

aliado(X,Y,Z):-
    enemigo(X,Y),
    enemigo(Y,Z),
    enemigo(X,Z),
    write('Eran enemigos').

aliado(X,Y,Z):-
    enemigo(X,Y),
    enemigo(X,Z),
    \+ enemigo(X,Y),
    write('Amigos desde siempre').


%
calorias(paella,200).
calorias(gazpacho,150).
calorias(consome,300).
calorias(filete_cerdo,400).
calorias(pollo_asado,280).
calorias(trucha,160).
calorias(bacalao,300).
calorias(nueces_miel,500).
calorias(naranja,50).

valor_calorico(X,Y,Z,V):-
    calorias(X,CX),
    calorias(Y,CY),
    calorias(Z,CZ),
    is(V,+(CX,+(CY,CZ))).

comida_equilibrada(X,Y,Z):-
    valor_calorico(X,Y,Z,V),
    =<(V,800).













