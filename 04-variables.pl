% Section 4 - variables
% You can run interesting queries on this:
% ?- woman(X).
% This will ask the prolog interpreter "what can bind with X to make this statement true?"
% Or "if the interpreter unifies X with <possible values> will the statement be true?"
% Interpreter returns all the things that can be bound:
% ?- woman(X).
%	X = mia
% Now if you enter ; at the end of X = mia, the interpreter continues returning valid bindings
% to X
%	X = mia;
%	X = jody;
%	X = yolanda
% Entering ; a third time returns a no from the interpreter.
woman(mia).
woman(jody).
woman(yolanda).

% Running `?- loves(marsellus,X), woman(X).`
% means "Is there an individual X s.t. Marsellus loves X and X is a woman?`
% Interpreter will return X = mia
loves(vincent,mia).
loves(marsellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).

% We can define variables within the database as well:
jealous(X, Y):- loves(X,Z), loves(Y,Z), X \== Y.
% (uppercase letters are treated as variables)
