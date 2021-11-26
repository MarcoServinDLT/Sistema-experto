:- dynamic disorders/2.

disorders("Transtorno de Ansiedad Generalizada", 
[
    "¿Los problemas que el paciente presenta han tenido consecuencias negativas en su vida cotidiana?",
    "¿El paciente ha tenido episodios de ansiedad?",
    "¿Dichos episodios han estado vigentes en período de al menos 6 meses?",
    "¿El paciente está enfermo?",
    "¿El paciente usa sustancias o está bajo medicación psiquiátrica?",
    "¿Se encuentra en un estado constante de preocupación?",
    [
        3,
        "¿Tiene una inquietud constante por la sensación de estar atrapado?",
        "¿Se fatiga con facilidad?",
        "¿Se le dificulta concentrarse?",
        "¿Se molesta con facilidad?",
        "¿Se le dificulta conciliar el sueño o descansar?"    
    ]
]
).

disorders("Transtorno de Fobia Especifica", 
[
    "¿Los problemas que el paciente presenta han tenido consecuencias negativas en su vida cotidiana?",
    "¿El paciente ha tenido episodios de ansiedad?",
    "¿Dichos episodios han estado vigentes en período de al menos 6 meses?" ,
    "¿La ansiedad se puede atribuir a una situación u objeto en especial?",
    "¿El paciente evita u opone resistencia a la causa de la ansiedad?",
    "¿El miedo que el paciente presenta es desproporcionado al peligro que podría suponer la situación u objeto?",
    "¿El paciente ha sufrido algún evento traumático relacionado a la causa de la ansiedad?"
]
).

disorders("Agorafobia",
[
    "¿Los problemas que el paciente presenta han tenido consecuencias negativas en su vida cotidiana?",
    "¿El paciente ha tenido episodios de ansiedad?",
    "¿Dichos episodios han estado vigentes en período de al menos 6 meses?",
    "¿La ansiedad se puede atribuir a una situación u objeto en especial?",
    "El paciente llora al estar envuelto en dicha situacion o al observar el objeto en particular",
    "¿El paciente evita u opone resistencia a la causa de la ansiedad?",
    "¿El miedo que el paciente presenta es desproporcionado al peligro que podría suponer la situación u objeto?",
    "¿El paciente ha sufrido algún evento traumático relacionado a la causa de la ansiedad?",
    "¿Teme al estar fuera de casa? ",
    "Al estar fuera de casa ¿tiene una sensación constante de alerta?",
    [
        2,
        "¿El usar el transporte público le causa ansiedad? ",
        "¿Teme a los espacios abiertos?",
        "¿Teme a los sitios cerrados?",
        "¿Sufre ansiedad cuando está en aglomeraciones?",
        "¿La compañía de algún conocido es imprescindible para salir de casa?"
    ]
]
).

disorders("Transtorno Depresivo Mayor",
[
    "¿Los problemas que el paciente presenta han tenido consecuencias negativas en su vida cotidiana?",
    "¿El paciente está enfermo?",
    "¿El paciente usa sustancias o está bajo medicación psiquiátrica?",
    [
        5,
        "¿Se encuentra la mayoría del tiempo desanimado?",
        "¿Se molesta con facilidad?",
        "¿Ha perdido interés en realizar sus actividades cotidianas?",
        [
            2,
            "¿Ha cambiado sus hábitos alimenticios?",
            "¿Ha experimentado una pérdida o aumento de peso alarmante? "
        ], 
        [
            1,
            "¿Se le dificulta conciliar el sueño o descansar?",
            "¿Duerme más de lo habitual?"
        ],
        [
            3,
            "¿Se considera inhábil para realizar actividades físicas?",
            "¿Se le dificulta el aprender?",
            "¿Se le dificulta comunicarse efectivamente?"
        ],
        "¿Se fatiga con facilidad?",
        "¿Se siente culpable de todo lo negativo que le ocurre  y a su entorno?",
        "¿La toma de decisiones le resulta una tarea difícil?"
    ],
    "¿piensa en la muerte de forma frecuente?",
    "¿Ha tenido ideas suicidas de forma frecuente?",
    "Durante el periodo reciente ¿ha sentido euforia sin motivo aparente? "
]
).