%example code from https://staff.science.uva.nl/u.endriss/teaching/prolog/prolog.pdf
bigger(elephant, horse).
bigger(horse, donkey).
bigger(donkey, dog).
bigger(donkey, monkey).

%':-' denotes 'if', before the penis is the predicate(head) and after the penis is sequence of predicates called the body
%if called Prolog will try to prove the body first, find out what evaluates to true
is_bigger(X, Y) :- bigger(X, Y).
is_bigger(X, Y) :- bigger(X, Z), is_bigger(Z, Y).

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
endpath(From, To, ENDPATH) :- direct(From, To, Cost), ENDPATH = [edge(From, To, Cost)]. %endcase, destination has been reached, initialize ENDPATH
endpath(From, To, ENDPATH2) :- edge(From, Between, Cost), endpath(Between, To, ENDPATH), append(ENDPATH, [edge(From, Between, Cost)], ENDPATH2).
