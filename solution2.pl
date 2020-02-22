% Rens Vester
% Mudi Al-Fageh

:- consult('graph.pl').
:- consult('solution1.pl'). %so we can use path(From, To, Cost).

%to get the desired I/O
cost(Path, TotalCost) :-
    totalcost(Path, 0, TotalCost).

%takes the third element of an edges tuple
edgecost(edge(_, _, P), Cost) :-
    Cost = P.

%calculates total cost of given path
totalcost([], EndCost, EndCost).
totalcost([Head|Tail], StartCost, TotalCost) :-
    edgecost(Head, Cost),
    NewCost is StartCost+Cost,
    totalcost(Tail, NewCost, TotalCost).

%to get the path from the ordered tuple in shortest_path
getpath( (_, P), Path) :-
    Path = P.

%shortest_path([], EndPath, EndPath).
shortest_path(From, To, Path) :-
    findall((Cost,Path), (path(From, To, Path), cost(Path, Cost)), Bag),
    sort(Bag, NewBag),
    NewBag = [Head|_],
    getpath(Head, Path).
