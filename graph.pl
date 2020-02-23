edge(1, 2, 5).
edge(2, 1, 3).
edge(2, 3, 4).
edge(2, 4, 3).
edge(2, 5, 5).
edge(3, 1, 9).
edge(3, 2, 2).
edge(5, 1, 3).
edge(5, 4, 2).


/* in case there is a direct connection From -> To, then the first Travel rule applies. 
this appends the final value to the path and its a solution. the below travel is for recursively
finding edges in between that can take you to a direct link with the destination. In case it is found
the first Travel applies, gives true and the entire path as solution.  */

travel(From, To, P, [edge(From, To, Cost)|P]) :- edge(From, To, Cost). 
travel(From, To, Visited, Path) :- edge(From, Between, Cost),
    Between \== To, % between cannot be the destination
    \+ member(edge(From, Between, Cost), Visited), % not visited before
    travel(Between, To, [edge(From, Between, Cost)|Visited], Path).

path(From, To, RevPath) :- travel(From, To, [], Path), reverse(Path, RevPath).
