CONSULTAS CON EL FICHERO libros.xml:
- Títulos ordenados.
for $x in doc("libros.xml")/libros/libro order by $x/titulo return $x/titulo


2- Títulos ordenados por el nombre del primer autor.
for $x in doc("libros.xml")/libros/libro order by $x/autores/autor[1]/nombre return $x/titulo


3- Nombre y apellido del primer autor de cada libro.
for $x in doc("libros.xml")/libros/libro order by $x/autores/autor[1]/nombre return ($x/autores/autor[1]/nombre, $x/autores/autor[1]/apellido)

4- Título y número de autores de cada libro.
for $x in doc("libros.xml")/libros/libro return ($x/autores/autor[1]/nombre, $x/autores/autor[1]/apellido)


5- Libros que tienen varios autores y libros que tienen un autor
for $x in doc("libros.xml")//libro[count(autores/autor) = 1] order by $x/titulo return ($x/titulo, count($x/autores/autor))
para los libros que tienen 1 autor:
for $x in doc("libros.xml")//libro[count(autores/autor) > 1] order by $x/titulo return ($x/titulo, count($x/autores/autor))

6- Libros cuyo autor es “Axel”.
for $x in doc("libros.xml")/libros/libro where $x/autores/autor/nombre = 'Axel' order by $x/titulo return ($x/titulo, $x/autores/autor)

7- Mostrar título y precio en una lista HTML.

for $x in doc("libros.xml")/libros/libro
order by $x/titulo
return 
<ul>
<li>{$x/titulo}</li> 
<li>{$x/precio}</li>
</ul>

Con el fichero "alumnos.xml"

1- Mostrar el nombre de los alumnos aprobados.
for $x in doc("alumnos.xml")//alumnos/alumno where $x/nota >4 order by $x/nota return ($x/nota,$x/nombre)


2- Mostrar el DNI y la nota de los alumnos que han aprobado.
for $x in doc("alumnos.xml")//alumnos/alumno where $x/nota >4 order by $x/nota return ($x/nota,$x/nombre,$x/@dni)
3- Indicar el nombre de los alumnos cuyas notas están entre 6 y 8 (ambas inclusive).
for $x in doc("alumnos.xml")//alumnos/alumno where $x/nota >=6 and $x/nota <=8 order by $x/nota return ($x/nota,$x/nombre)
4- Mostrar listado de nombres ordenados por apellidos.
for $x in doc("alumnos.xml")//alumnos/alumno order by $x/apells return ($x/nombre,$x/apells)


5- Mostrar nombres ordenados por DNI.
for $x in doc("alumnos.xml")//alumnos/alumno order by $x/@dni return ($x/nombre,$x/@dni)


6- Mostrar el Nº de cada alumno y su nombre.
for $x in doc("alumnos.xml")//alumnos/alumno return ($x/nombre,$x/@dni)

