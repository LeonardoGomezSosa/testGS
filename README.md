#  README

## Respuesta a las preguntas del examen.

_6.- Explique el ciclo de vida de un view controller_

La vista se instancía .

La vista puede pasar a un estado apareciendo(viewWillApear) o transitar directo a desaparecer(viewWillDisapear) o ser mostrada en la pantalla(viewDidApear)

Si la vista apareció puede transitar al siguiente estado, desaparecer (viewWillDisapear).

En el estado desapareciendo, puede regersar al estado apareciendo(viewWillApear) o ser desaparecida(viewDidDisapear)

Una vista pasa a desaparecida(viewDidDisapear).  Una vista que ha desaparecido puede transitar al estado apareciendo.



_7.- Explique el ciclo de vida de una aplicacion._

Es el conjunto de trancisione que puede atravesar una aplicacion desde el momento de su lanzamiento hasta su finalización a través de una órden directa de usuario o por inactividad.

Llos estados o grupos de estados por los que puede pasar una aplicacion son foreground y background, unattached y suspended, cada uno con transiciones definidas.

-Foreground:
    - Foreground active: En este estado puede la app interactuar con el usuario. 
    -Foreground Inactive: tras un tiempo sin recibir la app se pasa a estado inactivo

- Background: La app se encuentra ejecutando procesos como pueden ser servicios, pero, no se encuentra visible en pantalla.
- Suspended: La app se encuentra "viva", sin embargo no realiza ningun proceso en segundo plano y no esta renderizando vistas
- Unattached: La app no se ejecuta. 

1. Una aplicacion incicia en Unattached o no corriendo. y pasa al Foreground inactive. en seguida pasa a Foreground Active. o transitar a Background
2. de Foreground Active o Active, la aplicacion puede transitar a Foreground inactive (inactive).
3. Si una aplicación que transitó de active a inactive puede transitar a:
    1. Active
    2. Background
4. Una app en Background puede transitar a:
    1. Inactive
    2. Suspended
    3. Unattached
    5. Una app suspendida puede transitar a:
        1. Backgound 
        2. Unattached

_8.- ¿Qué es ARC?_

es el método que utiliza iOS para gestión de memoria. Se usa un contador de referencias a objetos. Cada vez que un objeto es referenciado se incrementa el contador. Los objetos que tiene un contador en 0 o no estan siendo apuntados son desechados.

## Punto Extra

Amarillo, el controlador se crea y se carga al instanciare, el viewDidLoad se ejecuta antes de hacer visible la pantalla o modificar la propiedad de fondo que realiza el cambio de color a amarillo.
