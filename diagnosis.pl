% --------------------- Procedimiento para determinar si es lista --------------------- %
isList([_]) :- !.
isList([_|_]) :- !.

% --------------------- Pregunstas individuales de sintomas --------------------- %
symptom(Symptom) :- 
    patientAnswers(Symptom,_) -> patientAnswers(Symptom, 'Si') ;
    isList(Symptom) -> multiSympton(Symptom) ;
    questionWin(Symptom, Respose),
    assert(patientAnswers(Symptom, Respose)),
    Respose == 'Si'.

% --------------------- Todas las preguntas --------------------- %
probDisorder(Symptom) :- 
    patientAnswers(Symptom,_) -> patientAnswers(Symptom, 'Si') ;
    isList(Symptom) -> multiSympton(Symptom) ;
    questionWin(Symptom, Respose),
    assert(patientAnswers(Symptom, Respose)).

% --------------------- Validación de criterios últiples --------------------- %
multiSympton([Min|Symptoms]) :-
    multiSympton(Symptoms, Min, 0, 0), !.

% --------------------- Caso base del procedimietno para calcular el cumplimiento de sintomas últiples --------------------- %
multiSympton([], Min, _, Matches) :-
    Min =< Matches, !.

% --------------------- Procedimiento para criterios de sintomas últiples --------------------- %
multiSympton([H|T], Min, Symptoms, Matches) :-
    S is Symptoms + 1,
    symptom(H) -> M is Matches + 1, multiSympton(T, Min, S, M);
    length(T, L),
    Min - Matches =< L, 
    multiSympton(T, Min, Symptoms, Matches), !.

% --------------------- Procedimiento para alamcenar las respuestas del paciente --------------------- %
:- dynamic patientAnswers/2.

% --------------------- Procedimiento para agregar una respuesta --------------------- %
addAnswer(Question, Asnwer, Window) :-
    \+ patientAnswers(Question, _),
    assert(patientAnswers(Question, Asnwer)), 
    send(Window, close).

% --------------------- Procedimiento para alimentar la base de conocimientos del sistema --------------------- %
addJudment(Disorder) :-
    findall(P, patientAnswers(P, 'Si'), L),
    assert(disorders(Disorder, L)).


% --------------------- Procedimiento para realizar un diagnóstico --------------------- %
diagnosis(Disorder) :-
    consult("knowledge.pl"),
    forall(disorders(T, L), (
        length(L, Tam),
        multiSympton(L, Tam, 0, 0),
        writeln(T)
        %send(Disorder, append, new(label(diagnosis, T)))
    )),
    retractall(patientAnswers(_,_)).