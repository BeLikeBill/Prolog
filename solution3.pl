% Rens Vester
% Mudi Al-Fageh

:- consult('graph.pl').


:- op(100, xfx, at).
:- op(50, xfx, :).
route([
    "Amsterdam Centraal" at 11:08,
    "Amsterdam Amstel" at 11:15,
    "Utrecht Centraal" at 11:38,
    "'s-Hertogenbosch" at 12:08,
    "Eindhoven" at 12:32,
    "Weert" at 12:49,
    "Roermond" at 13:02,
    "Sittard" at 13:21,
    "Maastricht" at 13:35
]).
