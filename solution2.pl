% Rens Vester
% Mudi Al-Fageh

:- consult('graph.pl').

shortest_path(From, To, Path) :-
    traverse(From, To, From, Path, 0, _).
    %ShortestPath is Path,
    %ShortestPath is (min_member(PathCost, TotalCosts)

%cost([], _).
%cost(TotalCost, TotalCost).
%gets the cost from an edge
cost(edge(_, _, P), Cost) :-
    Cost = P.

totalcost(Path, StartCost, TotalCost) :-
    Path = [Head|Tail],
    cost(Head, NewCost),
    TotalCost is StartCost+NewCost,
    totalcost(Path, TotalCost, TotalCost).


traverse(Result, Result, _, [], EndCost, EndCost).
traverse(From, To, Visited, [edge(From, Between, Cost)|Path], StartCost, TotalCost) :-
    edge(From, Between, Cost),
    \+ member(Between, Visited), % not visited before
    NewCost is StartCost+Cost, %NewCost is startcost + cost van nieuwe
    traverse(Between, To, [Between|Visited], Path, NewCost, TotalCost).

/*
traverse2(From, From, _, [], P, P).
traverse2(From, To, Visited, [edge(From, Between, Cost)|EndPath], S, Path) :-
    edge(From, Between, Cost),
    notIn(Between, Visited),
    S1 is S+Cost,
    traverse2(Between, To, [Between|Visited], EndPath, S1, Path).
*/


%totalCost(Path, Costs) :-
