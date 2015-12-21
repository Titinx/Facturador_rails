# E-Vader - UNLP

##### Facturador en Ruby on Rails - F.I UNLP

---

## Instalación
Clonar el repositorio, ubicarse dentro del directorio: **Facturador_rails**, y luego ingrese el comando `bundle install` .
> Para poder usar la aplicacion, se asume que se dispone de una version de ruby  >= 1.9.2 y la gema Bunbler instalada

## Preparando la Base de Datos
En esta versión, el motor de base de datos que se usa es **SQLite3**, así que debe tenerlo instalado.  

Para crear la base de datos, cargar los schemas e inicializarlos con datos de prueba (`seeds.rb`), ejecute el comando `bundle exec rake db:setup`. Ante cualquier problema, siempre puede ejecutar el comando `bundle exec rake db:reset`, que "limpiara" la base de datos, borrandola y volviendo a crear las tablas y cargando los datos de prueba.
> Aclaracion: el comando `bundle exec rake db:reset` equivale a ejecutar los suguientes dos comandos: `bundle exec rake db:drop` y `bundle exec rake db:setup`.

## Iniciar/Ejecutar la aplicacion
Para ejecutar la aplicacion, debe ejecutar `bundle exec rails s`. En caso de que se ejecute la aplicación en una máquina virtual se deberá ejecutar de esta manera: `bundle exec rails s -b 0.0.0.0`.

##Test
Para ejecutar los test de la aplicacion, deberá ingresar el comando `bundle exec rake test --verbose`.  
También puede, ejecutar los test por separado, ejecutando `bundle exec rake test [ruta del test]`.





