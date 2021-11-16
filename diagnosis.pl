symptom(Symptom) :- 
    write('El paciente presenta '), write(Symptom), nl,
    read(Respose),
    Respose == 'Si' -> true ; false.

multiSympton([], Min, _, Matches) :-
    Min =< Matches.

multiSympton([H|T], Min, Symptoms, Matches) :-
    S is Symptoms + 1,
    symptom(H) -> M is Matches + 1, multiSympton(T, Min, S, M);
    length(T, L),
    Min - Matches =< L, 
    multiSympton(T, Min, Symptoms, Matches).

phobia(_, 
    ['publico', 'cerrado', 'abiertos', 'multitud', 'solo']).

diagnosis :-
    phobia(_,M),
    multiSympton(M, 2, 0, 0).
