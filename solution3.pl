% Rens Vester
% Mudi Al-Fageh


:- op(100, xfx, at).
:- op(50, xfx, :).
route([
    "Amsterdam Centraal" at 11:08,
    "Amsterdam Amstel" at 11:15,
    "Utrecht Centraal" at 11:38,
    "s-Hertogenbosch" at 12:08,
    "Eindhoven" at 12:32,
    "Weert" at 12:49,
    "Roermond" at 13:02,
    "Sittard" at 13:21,
    "Maastricht" at 13:35
]).

path(From, Time, Path) :-
    travel(From, Time, Path).

travel(Destination, Destination, _, []).
travel(From, Time, [route(From, Time, Cost)|Path]) :-
    route(From, Time, Cost),
   % travel(Between, To, [Between|Visited], Path).

diffTime(A:B,X:Y, Minutes):-
    DiffHOURS is X - A,
    DiffMINUTES is Y - B,
    Minutes is DiffHOURS*60 + DiffMINUTES,
    Minutes > 0.


/* compare
earlier(time(H, M1), time(H, M2)) :- !, M1 < M2.
earlier(time(H1, _), time(H2, _)) :- H1 < H2. */
