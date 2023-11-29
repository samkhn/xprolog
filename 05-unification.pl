/*

Unification is how Prolog matches two terms.
Once variables are instantiated, they cannot be modified.
e.g. parent(alan, clive).
  ?- parent(X, Y).
We expect X to be bound to alan and Y to clive.
e.g. foo(a, Y) = foo(X, b)
  binds Y to b and X to a.
not e.g. foo(a, b) = foo(X, X)
  this fails to unify bc 1st and 2nd arg must match
e.g. 2*3+4 = X+Y
  binds 2*3 to X and 4 to Y bc + is a principal functor
e.g. [a, b, c] = [X, Y, Z]
e.g. [a, b, c] = [X, Y|Z]
  binds X to a, Y to b, Z to tail list ([c])
e.g. [a, b, c] = [a | [b | [c | []]]]
  successfully binds post evaluation
not e.g. '2' = 2 because '2' is an atom and 2 is a number.

An interesting example: highlights the difference between standard unification
and Prolog unifications.

?- X = father(X)

In standard unification, this says NO.
In prolog unification, this says YES.

Standard unification is more mathematical/abstract. It first checks that the
term we are unifying with appears on the other side. It detects it and rejects.
This is called the occurs check.

In Prolog, because unification is recursive, it says yes because it it optimistic
that the programmer knows what they are talking about. It can (for now bind it)
and it attempts to further resolve X within father(X). X then resolves to father(X)
and it recurses. In older Prolog implemetantions, we'd just hit OOM. In modern
implementations, the interpreter stops early and returns something like
X = father(father(...))
YES

As a result, X becomes a finite representation of an infinite number of terms.

Prolog can also execute standard unification. The predicate is
unify_with_occurs_check/2
e.g.
?- unify_with_occurs_check(father(X),X)
NO

Unification is a key part of Prolog proof searches.
Your programs become a collection of complex terms and intersting concepts/relations.
Then unification works to extract interesting information from that relationship.
This is useful for instance with computation linguistics.

*/

% functor point has two arguments that can instantiate to numbers
% to represent Cartesian coordinates.
% functor line has two arguments for two points.
% being vertical and horizontal are properties of line
% vertical lines are lines where the two points X coordinates are the same
vertical(line(point(X,Y),point(X,Z))).
horizontal(line(point(X,Y),point(Z,Y))).

% with these, we can ask interesting queries
% e.g. ?- horizontal(line(point(1,1),point(2,Y))).
%      Y = 1;
%      NO
% e.g. ?- horizontal(line(point(2,3),P)).
%      P = point(_1972, 3);
% here _1972 is a variable and P is a complex value