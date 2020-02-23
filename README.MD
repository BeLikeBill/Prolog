This is our prolog project for the third week of the course Programmeer Talen in Amsterdam.

Besides the source code there is also a few questions we have to answer about the assignment.


For the first exercise the questions are:

Welke operator wordt er gebruikt voor het vergelijken van de naburige knoop met de knoop gegeven door To en
waarom?
We use the '\+' operator. Definition from www.swi-prolog.org:

\+://it{Goal}.
True if‘Goal' cannot be proven (mnemonic: + refers to provable and the backslash (\) is normally used to indicate negation in Prolog).

We used it becuse it is a good en easy way to check condition in prolog.

Many Prolog implementations (including SWI-Prolog) provide not/1. The not/1 alternative is deprecated due to its strong link to logical negation.


Waarom mag de betreffende naburige knoop niet onderdeel zijn van een kant die aanwezig is in Visited, de lijst van kanten die al bezocht zijn?


Welke paden zijn er van 1 naar 3, van 3 naar 5 en van 5 naar 4?
