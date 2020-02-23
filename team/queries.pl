% Rens Vester - s12958042
% Mudi Al-Fageh

:- consult('solution2.pl').

%for solution 2.1 finding the cost of all paths from 5 to 4
%gets the shortest path from to
getallCosts(From, To, Costs) :-
    findall((Cost, Path), (path(From, To, Path), cost(Path, Cost)), Costs).
