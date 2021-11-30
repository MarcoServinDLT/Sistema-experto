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
diagnosis(Window) :-
    retractall(patientAnswers(_,_)),    
    consult("knowledge.pl"),
    forall(disorders(T, L), (
        length(L, Tam),
        multiSympton(L, Tam, 0, 0),
        assert(transtorno(T))
        ;
        true
    )),
    transtorno(T),
    send(Window, display, new(Diagnostico, dialog_group('Resultado')), point(500,250)),
    send(Diagnostico, append, new(Disorder, text_item("Encontramos que usted tiene"))),
    send(Diagnostico, append, new(button('No estoy de acuerdo', message(@prolog, addLearning)))),
    send(Disorder, editable, false),
    send(Disorder, selection, T),
    retractall(transtorno(_))
    ;
    send(Window, display, new(Diagnostico, dialog_group('No encontramos su transtorno')), point(500,250)),
    send(Diagnostico, append, new(button('Agregar nuevo transtorno', message(@prolog, addLearning)))).

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
    
