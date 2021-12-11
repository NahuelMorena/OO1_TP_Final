# Trabajo Final Objetos 1 2021

## Grupo de Ayuda Social

Un Grupo de Ayuda Social para Organizaciones sin fines de lucro (comedores, hogares, etc), conformado por Trabajadores  de la UNLP necesita un sistema para registrar las donaciones que realizan sus integrantes. El grupo está integrado por Docentes y No Docentes del establecimiento educacional que voluntariamente contribuyen con una cuota mensual que esté a su alcance y que no necesariamente debe ser la misma todos los meses (generalmente entre 500 y 2000 pesos mensuales) Su objetivo es comprar alimentos y otros productos para colaborar con distintos comedores y hogares de la ciudad de La Plata.

### Carpeta Documentación

* `Trabajo Final OO1 2021.doc` : Enunciado completo del proyecto con el cual se trabaja.

* `OO1TPFinal.pdf` : Documento en base a lo pedido en el inciso 1 del proyecto. Se realiza la identidicación de los distintos requerimientos encontrados en el enunciado, categorizandolos entre requerimientos funcionales y no funcionales. El analizis de los distintos actores que emplean cada caso de uso indicado.

* `Caso de uso.png` : Grafico sobre el caso de uso implementado para acompañar lo escrito en el documento anterior.

* `ModeloUML.png` : Grafico del modelo implementado para la solución al enunciado del proyecto.

* `ModeloUML.xml` : Archivo .xml donde se permite visualizar y actualizar el modelo UML mostrado en el archivo .png.

### Carpeta OO1TPFinal

Se implemento el sistema pedido utilizando el lenguaje de programación Smalltalk.
Se trabajo sobre el programa Pharo 8.0 - 64bit.

Como se pide en el enunciado, se implemento el modelo que se puede visualizar en `ModeloUML.png`, se realizaron los tests de todos los metodos publicos.

Para la interfaz grafica se utilizo el Framework Seaside 3.4.4.

### Comentarios

Para iniciar la aplicación web del proyecto: 

```bash
$   |app|
    app := WAAdmin register: LoginComponent asApplicationAt: 'TP'.
    app sessionClass: SessionWithUser.
```
Para crear una cuenta con el rol de coordinador y poder administrar la información, se debe realizar: 

```bash
$   |grupo coordinador|
    grupo := Grupo soleInstance.
    coordinador := Usuario unNombre: 'Coordinador1' dni: '223456123' telefono: '221546786' email: 'Coordinador1@gmail.com' legajo: '083465' contraseña: 'Coordinador1'.
    grupo cargaDeCoordinador: coordinador.
```

Los datos ingresados son a modo de prueba.

