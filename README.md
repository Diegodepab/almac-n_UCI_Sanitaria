# Diseño y Explotación de un Almacén de UCI Sanitaria

## Descripción del Proyecto
Este proyecto utiliza una visión parcial de una base de datos real de pacientes ingresados en la Unidad de Cuidados Intensivos (UCI) de hospitales en los EE. UU. La base de datos contiene información detallada sobre cada ingreso, incluyendo síntomas, pruebas complementarias y tratamientos administrados.

Cada grupo de trabajo se encargará de modelar un almacén de datos enfocado en una población concreta de pacientes. Por ejemplo, pacientes ingresados en UCI con problemas cardiovasculares. El grupo deberá seleccionar la población objetivo en función de la enfermedad u otros criterios y reflejarlo en la memoria al inicio del modelado.

### Fuente de Datos
La información para este proyecto se obtendrá de la base de datos disponible en el siguiente enlace:
[Descargar base de datos](https://uma365-my.sharepoint.com/:u:/g/personal/rmluque_uma_es/EebuEtDjp8VImt-_PhweiZMBu1_7XkPqZHkD74iGgg0fXQ?e=lOivcI)

La base de datos es una versión reducida obtenida del recurso [eICU-CRD](https://eicu-crd.mit.edu). Las tablas y sus atributos se pueden consultar en "Documents" -> "Tables in eICU-CRD". Además, el diseño relacional puede visualizarse en "SchemaSpy" bajo la sección de "Relationships". Aunque el número de tuplas no corresponde a la versión completa, los ejemplos de procesamiento en Python proporcionan una idea general sobre la estructura de los datos.
> [!TIP]
>Si al intentar generar el modelo relacional en SQL Server Management Studio se encuentra con un error de permisos, puede solucionarse ejecutando la siguiente consulta:

> ```sql
> ALTER AUTHORIZATION ON DATABASE::[eICU Collaborative Research Database] TO [sa];
> ```

## Tareas del Proyecto

### Tarea 1: Diseño Conceptual y Lógico
Desarrollar un diseño conceptual y lógico del almacén de datos. Se debe restaurar la base de datos proporcionada en SQL Server, visualizar el modelo relacional y generar el diseño del almacén basado en este modelo. El hecho principal será los datos de ingreso en UCI.

El diseño conceptual puede realizarse utilizando cualquier herramienta de diagramas o software especializado para diseño de almacenes de datos, como My Business Intelligence Modeler o Indyco.

### Tarea 2: Integración de Datos (ETL)
Crear un proyecto en Integration Services para realizar el proceso de extracción, transformación y carga (ETL) del almacén de datos a partir de la base original. Se recomienda incluir una fuente de datos adicional (TXT, CSV, Excel, etc.) para complementar el almacén.

### Tarea 3: Análisis de Datos (OLAP)
Desarrollar un proyecto en Analysis Services para construir un cubo multidimensional. A partir de este cubo, se deben realizar entre 10 y 15 consultas en MDX de complejidad media/alta. Se recomienda contactar con el profesor para consensuar las consultas a realizar.

### Tarea 4: Reporting
Implementar un proyecto en Reporting Services o el framework indicado en la asignatura para mostrar las consultas y resultados generados en un dashboard interactivo. El enfoque debe ser sencillo y efectivo, destacando la información relevante obtenida en el análisis de datos.

### Documentación
Cada una de las tareas descritas requerirá una memoria detallada que justifique las decisiones tomadas, explicando los pasos seguidos en el desarrollo de cada fase del proyecto.

## Colaboradores:

  _Autor:_ [JuanSoM](https://github.com/JuanSoM)

  _Autor:_ [Diegodepab](https://github.com/Diegodepab)

