:- dynamic disorders/2.

disorders("Transtorno de Ansiedad Generalizada", 
[
    "Los problemas que el paciente presenta han tenido consecuencias negativas en su vida cotidiana?",
    "El paciente ha tenido episodios de ansiedad?",
    "Dichos episodios han estado vigentes en periodo de al menos 6 meses?",
    "El paciente esta enfermo?",
    "El paciente usa sustancias o esta bajo medicacion psiquiatrica?",
    "Se encuentra en un estado constante de preocupacion?",
    [
        3,
        "Tiene una inquietud constante por la sensacion de estar atrapado?",
        "Se fatiga con facilidad?",
        "Se le dificulta concentrarse?",
        "Se molesta con facilidad?",
        "Ha presentado tension muscular",
        "Se le dificulta conciliar el sueno o descansar?"    
    ]
]
).

disorders("Transtorno de Fobia Especifica", 
[
    "Los problemas que el paciente presenta han tenido consecuencias negativas en su vida cotidiana?",
    "El paciente ha tenido episodios de ansiedad?",
    "Dichos episodios han estado vigentes en periodo de al menos 6 meses?" ,
    "La ansiedad se puede atribuir a una situacion u objeto en especial?",
    "El paciente evita u opone resistencia a la causa de la ansiedad?",
    "El miedo que el paciente presenta es desproporcionado al peligro que podria suponer la situacion u objeto?",
    "El paciente ha sufrido algun evento traumatico relacionado a la causa de la ansiedad?"
]
).

disorders("Agorafobia",
[
    "Los problemas que el paciente presenta han tenido consecuencias negativas en su vida cotidiana?",
    "El paciente ha tenido episodios de ansiedad?",
    "Dichos episodios han estado vigentes en periodo de al menos 6 meses?",
    "La ansiedad se puede atribuir a una situacion u objeto en especial?",
    "El paciente evita u opone resistencia a la causa de la ansiedad?",
    "El miedo que el paciente presenta es desproporcionado al peligro que podria suponer la situacion u objeto?",
    "El paciente ha sufrido algun evento traumatico relacionado a la causa de la ansiedad?",
    "Teme al estar fuera de casa?",
    "Al estar fuera de casa tiene una sensacion constante de alerta?",
    [
        2,
        "El usar el transporte publico le causa ansiedad? ",
        "Teme a los espacios abiertos?",
        "Teme a los sitios cerrados?",
        "Sufre ansiedad cuando esta en aglomeraciones?",
        "La compania de algun conocido es imprescindible para salir de casa?"
    ]
]
).

disorders("Transtorno Depresivo Mayor",
[
    "Los problemas que el paciente presenta han tenido consecuencias negativas en su vida cotidiana?",
    "El paciente esta enfermo?",
    "El paciente usa sustancias o esta bajo medicacion psiquiatrica?",
    [
        5,
        "Se encuentra la mayoria del tiempo desanimado?",
        "Se molesta con facilidad?",
        "Ha perdido interes en realizar sus actividades cotidianas?",
        [
            2,
            "Ha cambiado sus habitos alimenticios?",
            "Ha experimentado una perdida o aumento de peso alarmante? "
        ], 
        [
            1,
            "Se le dificulta conciliar el sueno o descansar?",
            "Duerme mas de lo habitual?"
        ],
        [
            3,
            "Se considera inhabil para realizar actividades fisicas?",
            "Se le dificulta el aprender?",
            "Se le dificulta comunicarse efectivamente?"
        ],
        "Se fatiga con facilidad?",
        "Se siente culpable de todo lo negativo que le ocurre  y a su entorno?",
        "La toma de decisiones le resulta una tarea dificil?"
    ],
    "piensa en la muerte de forma frecuente?",
    "Ha tenido ideas suicidas de forma frecuente?",
    "Durante el periodo reciente ha sentido euforia sin motivo aparente?"
]
).

:- dynamic specialCriterion/2.

specialCriterion("Se encuentra la mayoria del tiempo desanimado?", "Se encuentra en un estado constante de irritabilidad?").
specialCriterion(
    [
        3,
        "Tiene una inquietud constante por la sensacion de estar atrapado?",
        "Se fatiga con facilidad?",
        "Se le dificulta concentrarse?",
        "Se molesta con facilidad?",
        "Ha presentado tension muscular",
        "Se le dificulta conciliar el sueno o descansar?"    
    ],
    [
        1,
        "Tiene una inquietud constante por la sensacion de estar atrapado?",
        "Se fatiga con facilidad?",
        "Se le dificulta concentrarse?",
        "Se molesta con facilidad?",
        "Ha presentado tension muscular",
        "Se le dificulta conciliar el sueno o descansar?"    
    ]).

:- dynamic expectedResponse/2.

expectedResponse("Los problemas que el paciente presenta han tenido consecuencias negativas en su vida cotidiana?", 'Si').
expectedResponse("El paciente ha tenido episodios de ansiedad?", 'Si').
expectedResponse("Dichos episodios han estado vigentes en periodo de al menos 6 meses?", 'Si').
expectedResponse("La ansiedad se puede atribuir a una situacion u objeto en especial?", 'Si').
expectedResponse("El paciente evita u opone resistencia a la causa de la ansiedad?", 'Si').
expectedResponse("El miedo que el paciente presenta es desproporcionado al peligro que podria suponer la situacion u objeto?", 'Si').
expectedResponse("El paciente ha sufrido algun evento traumatico relacionado a la causa de la ansiedad?", 'No').
expectedResponse("Teme al estar fuera de casa?", 'Si').
expectedResponse("Al estar fuera de casa tiene una sensacion constante de alerta?", 'Si').
expectedResponse("El usar el transporte publico le causa ansiedad? ", 'Si').
expectedResponse("Teme a los espacios abiertos?", 'Si').
expectedResponse("Teme a los sitios cerrados?", 'Si').
expectedResponse("Sufre ansiedad cuando esta en aglomeraciones?", 'Si').
expectedResponse("La compania de algun conocido es imprescindible para salir de casa?", 'Si').
expectedResponse("El paciente esta enfermo?", 'No').
expectedResponse("El paciente usa sustancias o esta bajo medicacion psiquiatrica?", 'No').
expectedResponse("Se encuentra en un estado constante de preocupacion?", 'Si').
expectedResponse("Tiene una inquietud constante por la sensacion de estar atrapado?", 'Si').
expectedResponse("Se fatiga con facilidad?", 'Si').
expectedResponse("Se le dificulta concentrarse?", 'Si').
expectedResponse("Se molesta con facilidad?", 'Si').
expectedResponse("Se le dificulta conciliar el sueno o descansar?", 'Si').
expectedResponse("Se encuentra la mayoria del tiempo desanimado?", 'Si').
expectedResponse("Se molesta con facilidad?", 'Si').
expectedResponse("Ha perdido interes en realizar sus actividades cotidianas?", 'Si').
expectedResponse("Ha cambiado sus habitos alimenticios?", 'Si').
expectedResponse("Ha experimentado una perdida o aumento de peso alarmante?" , 'Si').
expectedResponse("Se le dificulta conciliar el sueno o descansar?", 'Si').
expectedResponse("Duerme mas de lo habitual?", 'Si').
expectedResponse("Se considera inhabil para realizar actividades fisicas?", 'Si').
expectedResponse("Se le dificulta el aprender?", 'Si').
expectedResponse("Se le dificulta comunicarse efectivamente?", 'Si').
expectedResponse("Se fatiga con facilidad?", 'Si').
expectedResponse("Se siente culpable de todo lo negativo que le ocurre  y a su entorno?", 'Si').
expectedResponse("La toma de decisiones le resulta una tarea dificil?", 'Si').
expectedResponse("piensa en la muerte de forma frecuente?", 'Si').
expectedResponse("Ha tenido ideas suicidas de forma frecuente?", 'Si').
expectedResponse("Durante el periodo reciente ha sentido euforia sin motivo aparente?", 'No').