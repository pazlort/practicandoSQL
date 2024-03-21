USE db_escuelas;

############################################
##### Ejercicios para Consultas en SQL #####
############################################

#########################################################################
##### SINTAXIS BÁSICA: SELECT…FROM + USO DE WHERE, AND, OR, BETWEEN #####
#########################################################################

#Base de datos: escuela

#1) Seleccionar todos los datos de la tabla alumnos:
/* SELECT * FROM alumnos; */

#2) Seleccionar solamente el legajo y el nombre de los alumnos:
/* SELECT legajo, nombre FROM alumnos; */

#3) Mostrar todos los datos de aquellos alumnos aprobados (con notas mayores o iguales a 7)
/* SELECT * FROM alumnos
WHERE nota>= 7; */

#4) Mostrar el id y el nombre de aquellas escuelas cuya capacidad sea inferior a 200 (no mostrar la columna capacidad).
/* SELECT id, nombre
FROM escuelas
WHERE capacidad <200; */

#5) Mostrar el nombre y la nota de aquellos alumnos cuya nota se encuentre entre 8 y 10
/* SELECT nombre, nota
FROM alumnos
WHERE nota>=8 AND nota<=10; */

#6) Repetir el ejercicio anterior, utilizando BETWEEN
/* SELECT nombre, nota
FROM alumnos
WHERE nota BETWEEN 8 AND 10; */

#7) Mostrar el nombre, la localidad y la provincia de aquellas escuelas situadas en Buenos Aires o Jujuy
/* SELECT nombre, localidad, provincia
FROM escuelas
WHERE provincia='Buenos Aires' OR provincia='Jujuy'; */


####################################################################
##### SINTAXIS BÁSICA: SELECT…FROM + USO DE LIKE, NOT LIKE Y % #####
####################################################################

#8) Mostrar todos los datos de los alumnos llamados Pietra González
/* SELECT *
FROM alumnos
WHERE nombre LIKE 'Pietra González'; */

#9) Repetir el ejercicio anterior, pero con aquellos que no se llamen Pietra González
/* SELECT *
FROM alumnos
WHERE nombre NOT LIKE 'Pietra González'; */

#10) Mostrar todos los datos de los alumnos cuyo nombre comience con R
/* SELECT *
FROM alumnos
WHERE nombre LIKE 'R%'; */

#11) Mostrar todos los datos de los alumnos cuyo nombre termine con Z
/* SELECT *
FROM alumnos
WHERE nombre LIKE '%Z'; */

#12) Mostrar todos los datos de los alumnos cuyo nombre contenga una M
/* SELECT *
FROM alumnos
WHERE nombre LIKE '%M%'; */


#####################################################
##### USOS DE JOIN Y ALIAS PARA TABLAS Y CAMPOS #####
#####################################################

#13) Mostrar el legajo, el nombre del alumno y el nombre de la escuela de todos los alumnos
/* SELECT legajo AS legajo_alumno, alumnos.nombre AS nombre_alumno, escuelas.nombre AS nombre_escuela
FROM alumnos
INNER JOIN escuelas ON alumnos.id_escuela = escuelas.id; */

#14) Modificar el ejercicio anterior utilizando alias de tablas y alias de columnas de modo tal que los datos se muestren de esta manera:
/* SELECT legajo AS legajo_alumno, alumni.nombre AS nombre_alumno, school.nombre AS nombre_escuela
FROM alumnos AS alumni
INNER JOIN escuelas AS school ON alumni.id_escuela = school.id;  */

#15) Mostrar todos los alumnos, tengan o no escuela asignada.
/* SELECT alumni.nombre AS nombre_alumno, school.nombre AS nombre_escuela
FROM alumnos AS alumni
LEFT JOIN escuelas AS school ON alumni.id_escuela = school.id;  */

#16) Mostrar todas las escuelas con el nombre de cada alumno (aunque no tengan escuela asignada).
/* SELECT alumni.nombre AS nombre_alumno, school.nombre AS nombre_escuela
FROM alumnos AS alumni
RIGHT JOIN escuelas AS school ON alumni.id_escuela = school.id;  */


########################################
##### USO DE IS NULL / IS NOT NULL #####
########################################

#17) Mostrar todos los datos de los alumnos que tengan notas.
/* SELECT * 
FROM alumnos
WHERE nota IS NOT NULL; */

#18) Mostrar todos los datos de los alumnos que no tengan notas.
/* SELECT * 
FROM alumnos
WHERE nota IS NULL;  */


#######################
##### ALTER TABLE #####
#######################

#19) Realizar lo siguiente:
#  a) Agregar a través de Alter Table una en la tabla escuelas columna llamada “Partido”, a la derecha de Localidad con una cadena vacía como valor por defecto (armar la sentencia a través de Alter Table y ejecutar desde la consulta).
/* ALTER TABLE escuelas
ADD Partidos varchar(45) DEFAULT NULL
AFTER `localidad`; */

#  b) Ejecutar una consulta donde se vean todos los campos para confirmar que se ha agregado el campo “partido”.
/* SELECT *
FROM escuelas; */

#  c) Eliminar esa columna utilizando Alter Table, no es necesario ejecutarlo desde la consulta.
/* ALTER TABLE escuelas
DROP `Partidos`; */


############################
##### LIMIT Y ORDER BY #####
############################

#22) Obtener un ranking de las primeras 3 escuelas de mayor capacidad.
/* SELECT *
FROM escuelas
ORDER BY  capacidad DESC
LIMIT 3; */


##############################################################
##### FUNCIONES DE AGREGACIÓN Y AGRUPAMIENTO / USO DE IN #####
##############################################################

#23) Contar la cantidad de alumnos de la tabla homónima. Llamar a la columna “Cantidad de alumnos”.
/* SELECT COUNT(*) AS cantidad_alumnos
FROM alumnos; */

#24) Repetir la consulta anterior consultando solamente COUNTcuya nota sea menor a 7.
/* SELECT COUNT(*) AS cantidad_alumnos
FROM alumnos
WHERE nota<7; */

#25) Obtener la capacidad total de las escuelas de la provincia de Buenos Aires
/* SELECT SUM(capacidad)
FROM escuelas
WHERE provincia='Buenos Aires'; */

#26) Repetir el ejercicio anterior pero solamente con las escuelas de Córdoba y Jujuy
/* SELECT SUM(capacidad)
FROM escuelas
WHERE provincia ='Córdoba' OR provincia ='Jujuy'; */

#27) Obtener el promedio de notas de los alumnos aprobados con más de 7
/* SELECT AVG(nota)
FROM alumnos
WHERE nota>7; */

#28) Obtener la capacidad máxima y la capacidad mínima de alumnos
/* SELECT MAX(capacidad) AS capacidad_max, MIN(capacidad) AS capacidad_min
FROM escuelas; */

#29) Obtener el total de capacidad de las escuelas por provincia
/* SELECT SUM(capacidad), provincia
FROM escuelas
GROUP BY provincia; */

#30) Obtener la cantidad de alumnos por grado
/* SELECT grado, COUNT(*) AS cantidad_alumnos
FROM alumnos
GROUP BY grado ASC; */


############################################
##### DIFERENCIAS ENTRE HAVING Y WHERE #####
############################################

#31) Mostrar las escuelas y la nota máxima para cada una siempre y cuando sean mayores o iguales a 7.
/* SELECT escuelas.nombre, MAX(nota) AS nota_max
FROM alumnos
INNER JOIN escuelas ON alumnos.id_escuela = escuelas.id
GROUP BY escuelas.nombre
HAVING nota_max>=7; */


########################
##### SUBCONSULTAS #####
########################

#32) Mostrar la información de las escuelas cuyos alumnos tengan una nota igual a 10, utilizando una subconsulta.
/* SELECT nombre
FROM escuelas
WHERE id IN (
    SELECT id_escuela
    FROM alumnos
    WHERE nota=10
); */