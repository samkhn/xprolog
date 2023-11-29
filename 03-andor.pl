% Section 3 - Conjunction and Disjunction
happy(vincent).
listens2Music(butch).
% This rules has 2 items in the body aka 2 goals
% , seperates the two goals and denotes a conjunction (&)
% Not whitespace sensitive
playsAirGuitar(vincent):-
	listens2Music(vincent),
	happy(vincent).
% We have a rule with two heads here
% This represents a disjunction (|)
% Alternative way to write this is with ;
% playsAirGuitar(butch):-
%	happy(butch);
%	listens2Music(butch).
playsAirGuitar(butch):-
	happy(butch).
playsAirGuitar(butch):-
	listens2Music(butch).

