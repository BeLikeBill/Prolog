% Rens Vester
% Mudi Al-Fageh

:- consult('graph.pl').

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


%shortest_path([], EndPath, EndPath).
shortest_path( From, To, Path) :-
    traverse(From, To, From, Path, 0, _),
    findall(Cost, cost(Path, Cost), List),
    sort(List, List),
    List = [Head|Tail],
    Path = Head.
    %Rule: findall, sort[all costs]
    %traverse(From, To, 0, Path. 0, LowestCost),
    %ShortestPath is (min_member(PathCost, TotalCosts)
    %min_list('Param1', 'Param2') of sort(List) en dan LowestCost = Head of list.




%WIP kant en klare code die alle paden vindt van A naar B en hun kosten.
%relation all paths and their cost.
traverse(Result, Result, _, [], EndCost, EndCost).
traverse(From, To, Visited, [edge(From, Between, Cost)|Path], StartCost, TotalCost) :-
    edge(From, Between, Cost),
    \+ member(Between, Visited), % not visited before
    NewCost is StartCost+Cost, %NewCost is startcost + cost van nieuwe
    traverse(Between, To, [Between|Visited], Path, NewCost, TotalCost).
