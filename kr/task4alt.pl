city("Kyiv").
city("Kharkiv").
city("Odesa").
city("Lviv").

restiction1("Kharkiv", _).
restiction1(_, CityC):- CityC \= "Odesa".

restiction2("Lviv", _).
restiction2("Kharkiv", _).
restiction2(_, CityA):- CityA = "Kharkiv".

restiction3("Lviv", _).
restiction3(_, CityB) :- CityB = "Kyiv".

restiction4("Kharkiv", _).
restiction4(_, CityB) :- CityB = "Kharkiv".

restiction5("Odesa", _).
restiction5(_, CityB) :- CityB \= "Kharkiv".

solve(CityA, CityB, CityC, CityD):-
    city(CityA), city(CityB), city(CityC), city(CityD),
    CityA \= CityB, CityA \= CityC, CityA \= CityD,
    CityB \= CityC, CityB \= CityD, CityC \= CityD,
    restiction1(CityA, CityC),
    restiction2(CityB, CityA),
    restiction3(CityC, CityB),
    restiction4(CityD, CityB),
    restiction5(CityD, CityB).
