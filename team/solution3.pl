% Rens Vester
% Mudi Al-Fageh

:- op(100, xfx, at).
:- op(50, xfx, :).

:- consult('route.pl').

%gets the shortest path between two stations
shortestPath(Destination, Destination, []).
shortestPath(From at _, To at _, [NewPath|Path]) :-
    route(Stations),
    %member(To at End, Stations),
    member(From at Start, Stations),
    member(Between at Inter, Stations),
    diffTime(Start, Inter, Time),
    NewPath = travel(From at Start, Between at Inter, Time),
    shortestPath(Between at Inter, To at _, Path), !.

%calculate the minutes between two times
diffTime(A:B,X:Y, Minutes) :-
    DiffHOURS is X - A,
    DiffMINUTES is Y - B,
    Minutes is DiffHOURS*60 + DiffMINUTES,
    Minutes > 0.
