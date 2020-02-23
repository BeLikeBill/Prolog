% Rens Vester
% Mudi Al-Fageh

:- consult('route.pl').

%gets the shortest path between two stations
shortestPath(Destination, Destination, []).
shortestPath(From at Start, To at _, [NewPath|Path]) :-
    route(Stations),
    %member(To at End, Stations),
    member(From at Start, Stations), % to get start time
    member(Between at Inter, Stations), % to get candidate
    diffTime(Inter, Start, Time),
    Time > 0, %time cannot be negative
    NewPath = travel(From at Start, Between at Inter, Time),
    shortestPath(Between at Inter, To at _, Path), !.

%calculate the minutes between two times
diffTime(X:Y,A:B, Minutes) :-
    DiffHOURS is X - A,
    DiffMINUTES is Y - B,
    Minutes is DiffHOURS*60 + DiffMINUTES.

%to get the desired I/O when calling cost
cost(Path, TotalCost) :-
    totalcost(Path, 0, TotalCost).

%calculates total cost of given path
totalcost([], EndCost, EndCost).
totalcost([travel( _, _, Cost)|Tail], StartCost, TotalCost) :-
    NewCost is StartCost+Cost,
    totalcost(Tail, NewCost, TotalCost).
