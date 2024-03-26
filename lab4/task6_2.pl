name("Anya").
name("Valya").
name("Nadya").
name("Galya").

dress("Green").
dress("Blue").
dress("White").
dress("Rose").

between_c(_, X1, Y, Y1, Z, _) :- Y \= "Anya", Y \= "Valya", X1 = "Blue", Z = "Galya", Y1 = "Green".

between_c(X, _, _, Y1, _, Z1) :- Y1 = "White", Z1 = "Rose", X = "Valya".

between_c2(X, X1, Y, Y1, Z, Z1) :-
    name(X), name(Y), name(Z),
    dress(X1), dress(Y1), dress(Z1),
    between_c(X, X1, Y, Y1, Z, Z1),
    X \= Y, X \= Z, Y \= Z,
    X1 \= Y1, X1 \= Z1, Y1 \= Z1.

between(X, X1, Y, Y1, Z, Z1) :- between_c2(X, X1, Y, Y1, Z, Z1).

between(X, X1, Y, Y1, Z, Z1) :- between_c2(Z, Z1, Y, Y1, X, X1).

circle(X, X1, Y, Y1, Z, Z1, W, W1) :-
    between(X, X1, Y, Y1, Z, Z1),
    between(Y, Y1, Z, Z1, W, W1),
    X \= W, X1 \= W1.

circle(X, X1, Y, Y1, Z, Z1, W, W1) :-
    between(X, X1, Y, Y1, Z, Z1),
    between(Z, Z1, W, W1, X, X1),
    Y \= W, Y1 \= W1.