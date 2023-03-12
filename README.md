# omnipro_test

Prueba técnica de ingreso a Omni.Pro

Versión de flutter utilizada: 3.7.7 stable
Versión de dart utilizada: Dart 2.19.4 DevTools 2.20.1

## Descripción de las funcionalidades:

- La aplicación consta de 1 vista. En la parte superior se muestra la información de el estado de conexión, los datos obtenidos y un botón para reiniciar el proceso. En la parte inferior se muestra la lista de datos obtenidos.
- Si se inicia la aplicación sin internet aparece un mensaje de error y al recuperar la conexión se obtienen automaticamente los primeros datos.
- Al hacer scroll hacía abajo y llegar a border, se obtendran otros 10 elementos.
- Si se pierde la conexión durante el uso, aparece mensaje de perdida de conexión y no se podran obtener datos.
- Al recuperar la conexión durante el uso, aparece mensaje y se podrá seguir obteniendo datos.

-Se implementaron test unitarios.


## Obvervaciones:

- La variables privadas se almacenaron en el archivo .env. Por cuestiones de la prueba este archivo de sube al repo.