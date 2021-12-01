:- encoding(utf8).
% --------------------- Procedimiento para alimentar la base de conocimientos del sistema --------------------- %
addJudment(Disorder, OldWindow) :-
    (Disorder \= '')
    ->
        findall(P, patientAnswers(P, _), L), %Solo le puse que ingresara las que se respondió con 'Si'
        assert(disorders(Disorder, L)),
        tell('knowledge.pl'),
        writeln(":- encoding(utf8)."),
        listing(disorders/2),
        listing(specialCriterion/2),
        listing(expectedResponse/2),
        told,
        send(OldWindow,destroy).

% --------------------- Procedimiento para agregar pregunta y respuesta a la lista de preguntas respuestas por el usuario --------------------- %
assertQuestion(Question,Answer,Name,Save, Window, OldWindow) :- 
    (Question \= '') 
    ->
        assert(patientAnswers(Question,Answer)),    %Se ingresa la pregunta y respuesta a la lista con las contestadas anteriormente por el usuario
        assert(expectedResponse(Question,Answer)),   %Guardar en expectedResponse las preguntas y respuestas 
        send(Window,destroy),   %Se elimina la ventana de donde se obtiene la ventana
        (Save ='N') ->  questionJudment(Name, OldWindow)   %Si quiere seguir agregando preguntas
        ; writeln('Guardar'), addJudment(Name, OldWindow).  %Si ya quiere guardar

% --------------------- Procedimiento para agregar preguntas sobre el nuevo transtorno --------------------- %
questionJudment(Name, OldWindow) :-
    (Name \= '') 
    ->
        new(NewQuestion, dialog('Agregar nueva pregunta')),
        new(QuestionDisorder, text_item('Ingrese la nueva pregunta para su transtorno')),
        send(NewQuestion, append, QuestionDisorder),
        new(M, menu(respuesta, cycle)),
        send_list(M, append, ['Si', 'No']),
        send(M, layout, horizontal),
        send(NewQuestion, append, M),
        send(NewQuestion, append, new(button('Agregar otra pregunta', message(@prolog, assertQuestion, QuestionDisorder?selection, M?selection, Name, 'N', NewQuestion, OldWindow)))),
        send(NewQuestion, append, new(button('Aceptar', message(@prolog, assertQuestion, QuestionDisorder?selection, M?selection, Name, 'Y', NewQuestion, OldWindow)))),
        send(NewQuestion, open_centered),
        send(NewQuestion, open).