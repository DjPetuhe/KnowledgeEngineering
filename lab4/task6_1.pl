boolean(true).
boolean(false).

archi_indication(A, _) :- A.
archi_indication(A, A3) :- not(A), not(A3).

two_true_one_false(A, B, C) :- A, B, not(C).
two_true_one_false(A, B, C) :- A, not(B), C.
two_true_one_false(A, B, C) :- not(A), B, C.

get_indication(Archi1, Boss1) :-
    boolean(Archi1), boolean(Archi2), boolean(Archi3),
    boolean(Boss1), boolean(Boss2), boolean(Boss3),
    boolean(Vesli1), boolean(Vesli2), boolean(Vesli3),
    two_true_one_false(Archi1, Archi2, Archi3),
    two_true_one_false(Boss1, Boss2, Boss3),
    two_true_one_false(Vesli1, Vesli2, Vesli3),
    Archi2 = Vesli3, Archi3 \= Vesli1, archi_indication(Archi1, Archi3),
    Boss1 \= Vesli1.

who_guilty(false, _, "Archi").
who_guilty(_, true, "Vesli").
who_guilty(_, _, "Boss").

solve(X) :- get_indication(A1, B1), who_guilty(A1, B1, X). 