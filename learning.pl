% --------------------- Procedimiento para alimentar la base de conocimientos del sistema --------------------- %
addJudment(Disorder) :-
    findall(P, patientAnswers(P, 'Si'), L),
    assert(disorders(Disorder, L)).
