% Rens Vester - s12958042
% Mudi Al-Fageh

%
% Queries for the questions in report.pdf
%

%for solution 2.1 finding the cost of all paths from 5 to 4
%gets the shortest path from to
?- findall((Path, Cost), (path(5, 4, Path), cost(Path, Cost)), Costs).

%for solution 3.1 finding the duration of getting from Amstel to Sittard
?- shortestPath("Amsterdam Amstel" at Start, "Sittard" at _, Path), cost(Path, TotalCost).
