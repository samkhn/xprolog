/*

Prolog programs are essentially databases of facts, rules queries.
Facts and rules are togethered referred to as clauses.

Prolog programs can also be understood as a group of predicates (or procedures) and clauses.
These predicates are defined using clauses.
e.g. in Section 2 below, we have three predicates: happy, listens2Music, playsAirGuitar

You can run interesting queries on these predicates and clauses.
You run `swipl 01.pl` and it loads the database of facts and rules.
Then, if you run `?- playsAirGuitar(mia).` it'll return true.
This is because of modus ponens (if p & p->q, then q,
here p = mia is happy and q is mia playsAirGuitar).

Facts, rules, and queries are built out of terms.
There are 4 kinds of terms: atoms, numbers, variables and complex terms aka structures.
Terms in prolog are made of constants and variables,
constants are made of atoms and numbers.

atoms begin with lowercase letter, are enclosed in single quotes or strings of specials chars
ex: playsAirGuitar, listens2Music, 'The Gimp', 'Vincent', :-
number ex: -2 -1 0 1 2 14.243
variables being with uppercase letter or underscore
ex: X, Y, _tag, List, _head
_ (just an underscore) is an anonymous variable
structures are made of a functor followed by a sequence of arguments
ex: playsAirGuitar(jody) (playsAirGuitar is the func, jody is the arg)
ex(recursive): hide(X, father(father(father(butch))))

Important concept is the arity of a term which refers to the number of args that a complex term has
e.g. woman(mia) is a complex term with arity 1
e.g. loves(vincent, mia) has arity 2.
predicates are usually written with their suffix in documentation
e.g. listens2Music/1 or loves/2
Prolog uses arity during matching.

Prolog's power comes from (1) variable unification and (2) recursive term structure.

Recursive term structure
Prolog has lists which are themselves a term and consist of a sequence of terms seperated by comma.
e.g. [a, b, c]
e.g. []
Prolog internally represents lists as right branching trees. so [a, b, c] is

        *
      a    *
         b    *
            c    []



*/