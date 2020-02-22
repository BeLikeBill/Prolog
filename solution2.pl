% Rens Vester
% Mudi Al-Fageh

:- consult('graph.pl').

shortest_path(From, To, Path) :-
    traverse(From, To, From, Path, 0, _).
    %ShortestPath is Path,
    %ShortestPath is (min_member(PathCost, TotalCosts)

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


%relation all paths and their cost.
traverse(Result, Result, _, [], EndCost, EndCost).
traverse(From, To, Visited, [edge(From, Between, Cost)|Path], StartCost, TotalCost) :-
    edge(From, Between, Cost),
    \+ member(Between, Visited), % not visited before
    NewCost is StartCost+Cost, %NewCost is startcost + cost van nieuwe
    traverse(Between, To, [Between|Visited], Path, NewCost, TotalCost).
