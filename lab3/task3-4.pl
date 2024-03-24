roditel("Vasil", "Anatoly").
roditel("Vasil", "Igor").
roditel("Hanna", "Anatoly").
roditel("Hanna", "Igor").
roditel("Dmitro", "Natalka").
roditel("Dmitro", "Marina").
roditel("Nadia", "Natalka").
roditel("Nadia", "Marina").
roditel("Igor", "Evgen").
roditel("Igor", "Oleksiy").
roditel("Natalka", "Evgen").
roditel("Natalka", "Oleksiy").
roditel("Mykola", "Oksana").
roditel("Olga", "Oksana").
roditel("Oleksiy", "Petra").
roditel("Oleksiy", "Roman").
roditel("Oksana", "Petra").
roditel("Oksana", "Roman").

men("Vasil").
men("Dmitro").
men("Anatoly").
men("Igor").
men("Mykola").
men("Evgen").
men("Oleksiy").
men("Roman").

women("Hanna").
women("Nadia").
women("Natalka").
women("Marina").
women("Olga").
women("Oksana").

roditel_i_rebenok(Anybody) :- roditel(Anybody, _), roditel(_, Anybody).

net_detey(Anybody) :- roditel(_, Anybody), not(roditel(Anybody, _)).

father(Anybody) :- men(Anybody), roditel(Anybody, _).

mother(Anybody) :- women(Anybody), roditel(Anybody, _).

son(Anybody) :- men(Anybody), roditel(_, Anybody).

daughter(Anybody) :- women(Anybody), roditel(_, Anybody).

brother(Anybody) :- men(Anybody), roditel(F, Anybody), roditel(F, B), Anybody \= B.

sister(Anybody) :- women(Anybody), roditel(F, Anybody), roditel(F, B), Anybody \= B.

uncle(Anybody) :- men(Anybody), roditel(F, Anybody), roditel(F, B), roditel(B, _), Anybody \= B.

aunt(Anybody) :- women(Anybody), roditel(F, Anybody), roditel(F, B), roditel(B, _), Anybody \= B.

grandfather(Anybody) :- men(Anybody), roditel(Anybody, B), roditel(B, _).

grandmother(Anybody) :- women(Anybody), roditel(Anybody, B), roditel(B, _).

grandson(Anybody) :- men(Anybody), roditel(F, Anybody), roditel(_, F).

granddaughter(Anybody) :- women(Anybody), roditel(F, Anybody), roditel(_, F).

nephew(Anybody) :- men(Anybody), roditel(F, Anybody), roditel(GF, F), roditel(GF, B), B \= F.

niece(Anybody) :- women(Anybody), roditel(F, Anybody), roditel(GF, F), roditel(GF, B), B \= F.