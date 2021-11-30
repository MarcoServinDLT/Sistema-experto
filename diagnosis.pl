:- encoding(utf8).


% --------------------- Procedimiento para determinar si es lista --------------------- %
isList([_]) :- !.
isList([_|_]) :- !.

% --------------------- Pregunstas individuales de sintomas --------------------- %
symptom(Symptom) :- 
    patientAnswers(Symptom,_) -> patientAnswers(Symptom, Res), expectedResponse(Symptom, Res) ;
    isList(Symptom) -> multiSympton(Symptom) ;
    questionWin(Symptom, Respose),
    assert(patientAnswers(Symptom, Respose)),
    expectedResponse(Symptom , Respose).

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

% --------------------- Procedimiento para alamcenar el transtorno encontrado --------------------- %
:- dynamic transtorno/1.

% --------------------- Procedimiento para realizar un diagnóstico --------------------- %
diagnosis:-
    retractall(patientAnswers(_,_)),    
    consult("knowledge.pl"),
    forall(disorders(T, L), (
        length(L, Tam),
        multiSympton(L, Tam, 0, 0),
        asserta(transtorno(T))
        ;
        true
    )),
    transtorno(T),
    new(Diagnostico, dialog('Encontramos que usted padece')),
    send(Diagnostico, append, new(Disorder, label(instruction, T))),
    send(Diagnostico, append, new(button('No estoy de acuerdo', message(@prolog, addLearning)))),
    send(Diagnostico, open_centered),
    send(Diagnostico, open),
    retractall(transtorno(_))
    ;
    new(Diagnostico, dialog('No encontramos su transtorno')),
    send(Diagnostico, append, new(button('Agregar nuevo transtorno', message(@prolog, addLearning)))),
    send(Diagnostico, open_centered),
    send(Diagnostico, open).

% ---------------------- Procedimiento para agregar un nuevo transtorno -------------------- %
addLearning :- 
    consult("learning.pl"),
    new(NewDisorder, dialog('Agregar nuevo transtorno')),
    new(NameDisorder, text_item('Ingrese el nombre del transtorno')),
    send(NewDisorder, append, NameDisorder),
    send(NewDisorder, append, new(label(instruction,'¿Desea agregar preguntas especificas para este transtorno?'))),
    send(NewDisorder, append, new(button('Agregar preguntas',  message(@prolog, questionJudment, NameDisorder?selection, NewDisorder)))),
    send(NewDisorder, append, new(button('Guardar',   message(@prolog, addJudment, NameDisorder?selection, NewDisorder)))),
    send(NewDisorder, open_centered),
    send(NewDisorder, open).
    
