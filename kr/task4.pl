city("Kiyv").
city("Kharkiv").
city("Odesa").
city("Lviv").

restiction1("Kharkiv", _).
restiction1(_, CityC):- CityC \= "Odesa".

restiction2("Lviv", _).
restiction2("Kharkiv", _).
restiction2(_, CityA):- CityA = "Kharkiv".

restiction3("Lviv").
restiction3(CityC) :- CityC = "Kiyv".

restiction5("Odesa").
restiction5(CityD) :- CityD \= "Kharkiv".

solve(CityA, CityB, CityC, CityD):-
    city(CityA), city(CityB), city(CityC), city(CityD),
    CityA \= CityB, CityA \= CityC, CityA \= CityD,
    CityB \= CityC, CityB \= CityD, CityC \= CityD,
    restiction1(CityA, CityC),
    restiction2(CityB, CityA),
    restiction3(CityC),
    restiction5(CityD).
