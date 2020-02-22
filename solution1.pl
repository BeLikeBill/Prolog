% Rens Vester
% Mudi Al-Fageh

:- consult('graph.pl').

path(From, To, Path) :-
    travel(From, To, From, Path).

travel(Destination, Destination, _, []).
travel(From, To, Visited, [edge(From, Between, Cost)|Path]) :-
    edge(From, Between, Cost),
    \+ member(Between, Visited), % not visited before
    travel(Between, To, [Between|Visited], Path).
