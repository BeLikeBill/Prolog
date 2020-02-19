%append/3
append( [], A, A).
append( [H | B], C, [H | D]) :- append( B, C, D).

%palindroom/1
palindroom( []).
palindroom( [_]).
palindroom( X) :- append( [H | T], [H], X), palindroom( T).

equals( Z, Z).

%sudoku9/2
sudoku9(Grid, Solution) :-

    equals( Grid, Solution),

    Grid =
    [[Aa, Ab, Ac, Ad, Ae, Af, Ag, Ah, Ai],
    [Ba, Bb, Bc, Bd, Be, Bf, Bg, Bh, Bi],
    [Ca, Cb, Cc, Cd, Ce, Cf, Cg, Ch, Ci],
    [Da, Db, Dc, Dd, De, Df, Dg, Dh, Di],
    [Ea, Eb, Ec, Ed, Ee, Ef, Eg, Eh, Ei],
    [Fa, Fb, Fc, Fd, Fe, Ff, Fg, Fh, Fi],
    [Ga, Gb, Gc, Gd, Ge, Gf, Gg, Gh, Gi],
    [Ha, Hb, Hc, Hd, He, Hf, Hg, Hh, Hi],
    [Ia, Ib, Ic, Id, Ie, If, Ig, Ih, Ii]],

    %grenzen voor de waarden van de cellen
    val(Aa),val(Ab),val(Ac),val(Ad),val(Ae),val(Af),val(Ag),val(Ah),val(Ai),
    val(Ba),val(Bb),val(Bc),val(Bd),val(Be),val(Bf),val(Bg),val(Bh),val(Bi),
    val(Ca),val(Cb),val(Cc),val(Cd),val(Ce),val(Cf),val(Cg),val(Ch),val(Ci),
    val(Da),val(Db),val(Dc),val(Dd),val(De),val(Df),val(Dg),val(Dh),val(Di),
    val(Ea),val(Eb),val(Ec),val(Ed),val(Ee),val(Ef),val(Eg),val(Eh),val(Ei),
    val(Fa),val(Fb),val(Fc),val(Fd),val(Fe),val(Ff),val(Fg),val(Fh),val(Fi),
    val(Ga),val(Gb),val(Gc),val(Gd),val(Ge),val(Gf),val(Gg),val(Gh),val(Gi),
    val(Ha),val(Hb),val(Hc),val(Hd),val(He),val(Hf),val(Hg),val(Hh),val(Hi),
    val(Ia),val(Ib),val(Ic),val(Id),val(Ie),val(If),val(Ig),val(Ih),val(Ii),

    %cellen in de rijen moeten verschillende waarden hebben
    alldist([ Aa, Ab, Ac, Ad, Ae, Af, Ag, Ah, Ai ]),alldist([ Ba, Bb, Bc, Bd, Be, Bf, Bg, Bh, Bi ]),
    alldist([ Ca, Cb, Cc, Cd, Ce, Cf, Cg, Ch, Ci ]),alldist([ Da, Db, Dc, Dd, De, Df, Dg, Dh, Di ]),
    alldist([ Ea, Eb, Ec, Ed, Ee, Ef, Eg, Eh, Ei ]),alldist([ Fa, Fb, Fc, Fd, Fe, Ff, Fg, Fh, Fi ]),
    alldist([ Ga, Gb, Gc, Gd, Ge, Gf, Gg, Gh, Gi ]),alldist([ Ha, Hb, Hc, Hd, He, Hf, Hg, Hh, Hi ]),
    alldist([ Ia, Ib, Ic, Id, Ie, If, Ig, Ih, Ii ]),

    %cellen in de kolommen moeten verschillende waarden hebben
    alldist([ Aa, Ba, Ca, Da, Ea, Fa, Ga, Ha, Ia ]),alldist([ Ab, Bb, Cb, Db, Eb, Fb, Gb, Hb, Ib ]),
    alldist([ Ac, Bc, Cc, Dc, Ec, Fc, Gc, Hc, Ic ]),alldist([ Ad, Bd, Cd, Dd, Ed, Fd, Gd, Hd, Id ]),
    alldist([ Ae, Be, Ce, De, Ee, Fe, Ge, He, Ie ]),alldist([ Af, Bf, Cf, Df, Ef, Ff, Gf, Hf, If ]),
    alldist([ Ag, Bg, Cg, Dg, Eg, Fg, Gg, Hg, Ig ]),alldist([ Ah, Bh, Ch, Dh, Eh, Fh, Gh, Hh, Ih ]),
    alldist([ Ai, Bi, Ci, Di, Ei, Fi, Gi, Hi, Ii ]),

    %sub grids moeten verschillende waarden hebben
    alldist([ Aa, Ab, Ac, Ba, Bb, Bc, Ca, Cb, Cc ]),alldist([ Da, Db, Dc, Ea, Eb, Ec, Fa, Fb, Fc ]),
    alldist([ Ga, Gb, Gc, Ha, Hb, Hc, Ia, Ib, Ic ]),alldist([ Ad, Ae, Af, Bd, Be, Bf, Cd, Ce, Cf ]),
    alldist([ Dd, De, Df, Ed, Ee, Ef, Fd, Fe, Ff ]),alldist([ Gd, Ge, Gf, Hd, He, Hf, Id, Ie, If ]),
    alldist([ Ag, Ah, Ai, Bg, Bh, Bi, Cg, Ch, Ci ]),alldist([ Dg, Dh, Di, Eg, Eh, Ei, Fg, Fh, Fi ]),
    alldist([ Gg, Gh, Gi, Hg, Hh, Hi, Ig, Ih, Ii ]).

%alle waarden die in de sudoku kunnen
val(V) :-
    V = 1;
    V = 2;
    V = 3;
    V = 4;
    V = 5;
    V = 6;
    V = 7;
    V = 8;
    V = 9.

%recursief checken alle waarden anders zijn in lijst
alldist( []).
alldist( [H | T]) :- distinct( T, H), alldist( T).

distinct( [], _).
distinct( [H | T], X) :- X \= H, distinct( T, X).
