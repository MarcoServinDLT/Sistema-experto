:- use_module(library(pce)).


isList([_]) :- !.
isList([_|_]) :- !.


% --------------------- Ventana emergente con pregunta --------------------- %
questionWin(Q, Answer) :-
    new(Question, dialog('Diagnostico')),
    send(Question, append, new(label(question, Q))),
    send(Question, append, new(button('Si', message(Question, return, 'Si')))),
    send(Question, append, new(button('No', message(Question, return, 'No')))),
    send(Question, open_centered),
    send(Question, open),
    get(Question, confirm, Answer),
    writeln(Answer),
    send(Question, destroy).

% -- Pregunstas individuales de sintomsa -- %
symptom(Symptom) :- 
    patientAnswers(Symptom,_) -> patientAnswers(Symptom, 'Si') ;
    isList(Symptom) -> multiSympton(Symptom) ;
    questionWin(Symptom, Respose),
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
addAnswer(Question, Asnwer, Window) :-
    \+ patientAnswers(Question, _),
    assert(patientAnswers(Question, Asnwer)), 
    send(Window, close).

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
    write(T),
    retractall(patientAnswers(_,_)).
