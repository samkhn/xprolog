/*

Unification is used in proof searching aka how prolog searches a knowledges base.

*/

f(a).
f(b).

g(a).
g(b).

h(b).

k(X) :- f(X), g(X), h(X).

/* Now if we run the query ?- k(Y).

Prolog will answer k(b). But how did it reach that conclusion?

Prolog begins by reading the knowledge base and tries to unify k(Y) with a fact
or the head of a rule.
It searches the base top to bottom.
Matches with rule k(X)
Prolog generates a variable for Y (say _G13) and attempts to match.
It uses greedy backtracking (greedy bc it choosest the first, backtracking in case of error).
Prolog asks what can match with X so that it can satisfy f(X), g(X), h(X).
It tries to satisfy each goal (e.g. f(X)) left to right.
Can we satisfy f(X)? we read f(a) so yes for that. we bind X = a and try to validate the rest
g(a), h(a). g(a) goal reached but h(a) fails. h(b) doesnt bind to h(a) so we backtrack.
was there another choice we could've made when we chose g(a)? no, g(b) does not bind to g(a).
ok so was there another choice at f(a) level? no, f(b) does not bind.
we now greedy search for somethiung that can satisfy f(X) but not f(a).
ok we found f(b). it satisfies all three.
goal list is empty. we are done.

if we enter ;, we are asking for another solution so prolog will go to last choice and
attempt to backtrack.

*/
