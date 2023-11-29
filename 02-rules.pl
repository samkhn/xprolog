% Section 2 - rules
happy(yolanda).
listens2Music(mia).
% The next 3 lines are rules
% Structure is: [head]:- [body]
% Says if mia is happy, mia playsAirGuitar
listens2Music(yolanda):- happy(yolanda).
playsAirGuitar(mia):- listens2Music(mia).
playsAirGuitar(yolanda):- listens2Music(yolanda).

