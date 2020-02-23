% Rens Vester
% Mudi Al-Fageh

:- consult('graph.pl').
:- consult('solution1.pl'). %so we can use path(From, To, Cost).

%to get the desired I/O when calling cost
cost(Path, TotalCost) :-
    totalcost(Path, 0, TotalCost).

%calculates total cost of given path
totalcost([], EndCost, EndCost).
totalcost([edge(_, _, Cost)|Tail], StartCost, TotalCost) :-
    NewCost is StartCost+Cost,
    totalcost(Tail, NewCost, TotalCost).

%gets the shortest path from to
shortestPath(From, To, Path) :-
    findall((Cost,Path), (path(From, To, Path), cost(Path, Cost)), Bag),
    sort(Bag, NewBag),
    NewBag = [(_, Path)|_].
