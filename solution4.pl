% Rens Vester
% Mudi Al-Fageh

:- consult('route.pl').

%true if Time1 is before Time2. to make sure there is transfertime
before(Time1, Time2) :-
    diffTime(Time2, Time1, Time),
    Time > 0.

%all possibilities of getting from one place to another, also transfers
path(Destination, Destination, []).
path(From at Start, To at _, [NewPath|Path]) :-
    route(Stations),
    member(From at Start, Stations), % to get start time
    member(Between at Inter, Stations), % to get candidate
    before(Start, Inter), %assure there is at least 1 min transfertime
    diffTime(Inter, Start, Time),
    NewPath = travel(From at Start, Between at Inter, Time),
    path(Between at _, To at _, Path), !.

%calculate the minutes between two different times
diffTime(X:Y,A:B, Minutes) :-
    DiffHOURS is X - A,
    DiffMINUTES is Y - B,
    Minutes is DiffHOURS*60 + DiffMINUTES.
