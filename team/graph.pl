%example code from https://staff.science.uva.nl/u.endriss/teaching/prolog/prolog.pdf
bigger(elephant, horse).
bigger(horse, donkey).
bigger(donkey, dog).
bigger(donkey, monkey).

%':-' denotes 'if', before the pp is the predicate(head) and after the pp is sequence of predicates called the body
%if called Prolog will try to prove the body first & find out what evaluates to true, else false
is_bigger(X, Y) :- bigger(X, Y).
is_bigger(X, Y) :- bigger(X, Z), is_bigger(Z, Y).



%GRAPH ASSIGNMENT 1

%edge(From, To, Cost)
edge(1,2,5).
edge(2,1,3).
edge(2,3,4).
edge(2,4,3).
edge(2,5,5).
edge(3,1,9).
edge(3,2,2).
edge(5,1,3).
edge(5,4,2).

%indirect(From, To, Cost) :- edge(From, Between, Cost), direct(Between, To, Cost2), indirect(Between, To, Cost2).

%path(From, To, Visited, Path) :- edge(From, Between, Cost), direct(Between, To), append.

%Path = edge(From, To, Cost).
%not(member(_,Path)). %if Path is empty

%directed graph connected From -> To.
direct(From, To, Cost) :- edge(From, To, Cost). %evaluates to true if direct path From -> To

%endpath function recursively searches for an options from A to B and store the different paths in ENDPATH.
path(From, To, ENDPATH) :- direct(From, To, Cost), ENDPATH = [edge(From, To, Cost)]. %endcase, destination has been reached, initialize ENDPATH
path(From, To, Path) :- edge(From, Between, Cost), path(Between, To, ENDPATH), append(ENDPATH, [edge(From, Between, Cost)], Path).

%add(Visited, Between, NewVisited) :- append(Between, Visited, NewVisited).

%unvisited(Between, Visited) :- not(member(Between, Visited)).

%path(From, To, Visited, ENDPATH) :- direct(From, To, Cost), ENDPATH = [edge(From, To, Cost)], Visited = [From].
%path(From, To, Visited, Path) :- edge(From, Between, Cost), unvisited(Between, Visited), append([Between], Visited, NewVisited), path(Between, To, NewVisited, ENDPATH), append(ENDPATH, [edge(From, Between, Cost)], Path).
%not(member(Between, Visited)),