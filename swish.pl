% filhos
progenitor(antonita,joao).
progenitor(pietro,joao).
progenitor(antonita,clara).
progenitor(pietro,clara).
progenitor(antonita,francisco).
progenitor(pietro,francisco).
progenitor(antonita,valeria).
progenitor(pietro,valeria).
progenitor(antonita,ana).
progenitor(pietro,ana).
progenitor(ana,helena).
progenitor(ana,joana).
progenitor(joao,mario).
progenitor(helena,carlos).
progenitor(mario,carlos).
progenitor(clara,pietro).
progenitor(clara,enzo).
progenitor(jacynto,francisca).
progenitor(claudia,francisca).
progenitor(jacynto,antonia).
progenitor(claudia,antonia).
progenitor(luiza,jacynto).
progenitor(pablo,jacynto).

% casais
casal(pietro, antonita).
casal(helena,mario).
casal(francisco,fabiana).
casal(pietro,francisca).
casal(enzo,antonia).
casal(claudia,jacynto).
casal(luzia,pablo).

% sexo feminino 
sexo(antonita,feminino).
sexo(clara,feminino).
sexo(valeria,feminino).
sexo(ana,feminino).
sexo(helena,feminino).
sexo(joana,feminino).
sexo(fabiana,feminino).
sexo(francisca,feminino).
sexo(antonia,feminino).
sexo(claudia,feminino).
sexo(luzia,feminino).

% sexo masculino
sexo(pietro,masculino).
sexo(joao,masculino).
sexo(francisco,masculino).
sexo(mario,masculino).
sexo(carlos,masculino).
sexo(enzo,masculino).
sexo(jacynto,masculino).
sexo(pablo,masculino).

irma(X,Y):- progenitor(A,X),
    progenitor(A,Y),
    X\==Y,
    sexo(X,feminino).

irmao(X,Y):- progenitor(A,X),
    progenitor(A,Y),
    X\==Y,
    sexo(X,masculino).

avo(X,Y):- progenitor(X,A),
    progenitor(A,Y),
    sexo(X,masculino).

avoa(X,Y):- progenitor(X,A),
    progenitor(A,Y),
    sexo(X,feminino).

tio(X,Y):- irmao(X,A),
    progenitor(A,Y),
    sexo(X,masculino).

tia(X,Y):- irma(X,A),
    progenitor(A,Y),
    sexo(X,feminino).

primo(X,Y):- progenitor(A,X),
    irmao(A,B),
    progenitor(B,Y),
    sexo(X,masculino).

primo(X,Y):- progenitor(A,X),
    irma(A,B),
    progenitor(B,Y),
    sexo(X,masculino).

prima(X,Y):- progenitor(A,X),
    irmao(A,B),
    progenitor(B,Y),
    sexo(X,feminino).

prima(X,Y):- progenitor(A,X),
    irma(A,B),
    progenitor(B,Y),
    sexo(X,feminino).

descendente(X,Y):- progenitor(Y,X).

descendente(X,Y):- progenitor(X,A),
    descendente(A,Y).

ascendente(X,Y):- progenitor(X,Y).

ascendente(X,Y):- progenitor(X,A),
    ascendente(A,Y).
