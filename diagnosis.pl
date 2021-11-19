isList([_]) :- !.
isList([_|_]) :- !.



% -- Pregunstas individuales de sintomsa -- %
symptom(Symptom) :- 
    patientAnswers(Symptom,_) -> patientAnswers(Symptom, 'Si') ;
    isList(Symptom) -> multiSympton(Symptom) ;
    write(Symptom), nl,
    read(Respose),
    assert(patientAnswers(Symptom, Respose)),
    Respose == 'Si'.

multiSympton([Min|Symptoms]) :-
    multiSympton(Symptoms, Min, 0, 0), !.

% -- Caso base del procedimietno para calcular el cumplimiento de sintomas múltiples -- %
multiSympton([], Min, _, Matches) :-
    Min =< Matches, !.

% -- Procedimiento para criterios de sintomas múltiples -- %
multiSympton([H|T], Min, Symptoms, Matches) :-
    S is Symptoms + 1,
    symptom(H) -> M is Matches + 1, multiSympton(T, Min, S, M);
    length(T, L),
    Min - Matches =< L, 
    multiSympton(T, Min, Symptoms, Matches), !.

% -- Procedimiento para alamcenar las respuestas del paciente -- %
:- dynamic patientAnswers/2.

% -- Procedimiento para agregar una respuesta -- %
addAnswer(Question, Asnwer) :-
    \+ patientAnswers(Question, _),
    assert(patientAnswers(Question, Asnwer)).

% -- Procedimiento para alimentar la base de conocimientos del sistema -- %
%addJudment(Disorder) :-
    %forall(patientAnswers(Question, 'si'), ),
    %assert(disorders(Disorder, Questions)).

% -- Procedimiento para realizar un diagnóstico -- %
diagnosis :-
    consult("knowledge.pl"),
    disorders(T, L),
    length(L, Tam),
    multiSympton(L, Tam, 0, 0),
    write(T).
