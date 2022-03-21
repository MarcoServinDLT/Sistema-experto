# Ψstema-experto
Sistema Experto que permite la identificación de trastornos mentales.

Este programa es capaz de identificar distintos trastornos mentales mediante la realización de preguntas referentes a la sintomatología de cada trastorno, además de contar con la capacidad de aprender nuevos trastornos y sus síntomas.

**¡¡El programa cuenta con interfaz gráfica!!**

## ¿Cómo funciona?
Para comprender el funcionamiento del programa es necesario comprender lo que se quiere solucionar, en este caso la problemática corresponde a tratar de identificar trastornos (estos se encuentran ampliamente descritos en los distintos documentos ubicados en la carpeta **context**). Los trastornos cuentan con una gran cantidad de condiciones y restricciones para su diagnostico.

Debido a que muchos trastornos comparten síntomas, se pensó en solucionar el problema mediante teoría de conjuntos, realizando preguntas de los más general (los síntomas más comunes en los diferentes trastornos) a lo particular (síntomas propios del trastorno), lo cual ayudaba a descartar trastornos de manera más rápida y a no repetir varias veces una misma pregunta, esto también ayudaba parcialmente a identificar de entre dos o más trastornos similares, ya que hay trastornos que no pueden coexistir, debe definirse como uno solamente.

La representación del problema mediante teoría de conjuntos sería la siguiente :

![](Contexto/Diagrama%20en%20Venn%20Trastornos.png)

Cuando el trastorno se encuentra en la base de conocimientos del programa, este mismo notificará el diagnostico, de lo contrario, el programa notificará que no se identificó ningún trastorno, por lo que preguntará si conoces el nombre del trastorno, en caso de que la respuesta sea negativa el programa finalizará, si la respuesta fue positiva, el programa solicitará preguntas basadas en los criterios de diagnostico del trastorno para aprenderlo.

## Trastornos pro defecto:
1. Agorafobia.
2. Fobia especifica.
3. Trastorno de ansiedad generalizado.
4. Trastorno depresivo mayor.

- **Trastorno de prueba para aprendizaje:**
1. Trastorno de insomnio (preguntas encontrada en el archivo **Insomnio**).

## Requisitos⚙️
- SWI- Prolog
- XPCE/Prolog (para la interfaz gráfica del programa).

## Construido con...🛠️
El programa está construido con Prolog en su totalidad

## Versiones📓
1.0 - Lanzamiento, interfaz gráfica, cuatro trastornos por defecto y con posibilidad de agregar más

## Autores🖋️

- Hector Aguirre González (HectorAG-inco)
- Luis Jaime Fernández Dominguez (LuisJaimeFD)
- Edgar Alejandor Martínez Esqueda (EdgarMartinezEsqueda)
- Jonatan Ramírez Jiménez (Ramírez Jiménez Jonatan)
- Marco Servin de la Torre (MarcoServinDLT)
