:- use_module(library(pce)).
:- encoding(utf8).

% --------------------- Procedimiento de la ventana principal --------------------- %
:-
    consult('diagnosis.pl'),
    new(Main, dialog('Diagnóstico de trestornos')),
    send(Main, append, bitmap(image('Resources/fondo.jpg'))),
    send(Main, display, new(Diagnostico, dialog_group('Diagnóstico')), point(500,200)),
    send(Diagnostico, append, new(label(instruction, "Haga clic en el botón iniciar para comenzar un diagnóstico"))),
    send(Diagnostico, append, new(button('Iniciar', message(@prolog, diagnosis, Main)))),
    send(Main, open_centered),
    send(Main, open).

% --------------------- Ventana emergente con pregunta --------------------- %
questionWin(Q, Answer) :-
    new(Question, dialog('Diagnostico')),
    send(Question, append, new(label(question, Q))),
    send(Question, append, new(button('Si', message(Question, return, 'Si')))),
    send(Question, append, new(button('No', message(Question, return, 'No')))),
    send(Question, open_centered),
    send(Question, open),
    get(Question, confirm, Answer),
    send(Question, destroy).
