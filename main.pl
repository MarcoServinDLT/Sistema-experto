:- use_module(library(random)).
:- use_module(library(pce)).
:- encoding(utf8).

% --------------------- Lista de imagenes disponibles -------------------- %
imagenes(["Resources/1.jpg","Resources/2.jpg","Resources/3.jpg","Resources/4.jpg","Resources/5.jpg","Resources/6.jpg","Resources/7.jpg","Resources/8.jpg","Resources/9.jpg","Resources/10.jpg","Resources/11.jpg","Resources/12.jpg","Resources/13.jpg","Resources/14.jpg","Resources/15.jpg","Resources/16.jpg","Resources/17.jpg","Resources/18.jpg"]).

% --------------------- Procedimiento de la ventana principal --------------------- %
:-
    consult('diagnosis.pl'),
    new(Main, dialog('Diagnóstico de trestornos')),
    send(Main, append, bitmap(image('Resources/fondo.jpg'))),
    send(Main, display, new(Diagnostico, dialog_group('Diagnóstico')), point(490,200)),
    send(Diagnostico, append, new(label(instruction, "Haga clic en el botón iniciar para comenzar un diagnóstico"))),
    send(Diagnostico, append, new(button('Iniciar', message(@prolog, diagnosis)))),
    send(Main, open_centered),
    send(Main, open).

% --------------------- Ventana emergente con pregunta --------------------- %
questionWin(Q, Answer) :-
    new(Question, dialog('Diagnostico')),
    imagenes(Imgs),
    random_member(I, Imgs),
    %writeln(Img),
    send(Question, append, bitmap(image(I))),
    send(Question, append, new(label(question, Q))),
    send(Question, append, new(button('Si', message(Question, return, 'Si')))),
    send(Question, append, new(button('No', message(Question, return, 'No')))),
    send(Question, open_centered),
    send(Question, open),
    get(Question, confirm, Answer),
    send(Question, destroy).
