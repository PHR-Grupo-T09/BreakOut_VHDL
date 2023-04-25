# BreakOut_VHDL

## PROBLEMA A RESOLVER.

En el mundo actual, existe una gran cantidad de dispositivos electrónicos que nos permiten entretenernos y relajarnos después de un día de trabajo. Desde smartphones y tabletas hasta consolas de videojuegos y PCs, hay una infinidad de opciones disponibles. Sin embargo, a veces se echa de menos la simplicidad y la emoción de los juegos clásicos como el ajedrez o el dominó.
Aunque hay muchos videojuegos modernos que ofrecen gráficos impresionantes y experiencias de juego increíblemente inmersivas, estos pueden ser abrumadores para algunas personas. A veces, menos es más. Los juegos clásicos, por otro lado, son a menudo más fáciles de aprender y jugar, pero no por eso menos emocionantes.
Si bien hoy en día es posible tener una gran cantidad de dispositivos electrónicos en casa, la mayoría de ellos son bastante costosos. Por eso queremos implementar el famoso juego Breakout de Atari.
Por otro lado, cabe resaltar el gran conocimiento que hay detrás de los videojuegos. ¿Cómo surgió este tema? La información respecto a la creación de este juego la podemos encontrar en el siguiente enlace XATAKA.
También es interesante ver cómo los juegos clásicos están regresando y ganando popularidad en la actualidad. A pesar de que los gráficos y la tecnología han avanzado mucho en las últimas décadas, hay algo en la simplicidad y la emoción de los juegos retro que sigue cautivando a los jugadores de todas las edades. Como se puede observar en esta noticia de 20minutos “lo retro está de moda”.
Y es un juego tan famoso que las nuevas generaciones de consolas lo están sacando para sus nuevos dispositivos como en la Nintendo switch.

## OBJETIVO
Nuestro proyecto busca abordar la relevancia cultural de los juegos arcade al ofrecer una alternativa más económica y compacta a las máquinas recreativas tradicionales. Para lograr esto, nos enfocamos en crear un sistema que soporte el popular juego BREAKOUT utilizando una FPGA como elemento central.
La implementación del juego se basa en una matriz de luces LED de 16x8 para representar visualmente la barra móvil y la bola. También utilizamos un display LED de 7 segmentos para mostrar el nivel y un zumbador para notificar cuando se pierde una vida o marcar el inicio y final de la partida. La interfaz de usuario se controla mediante un teclado hexadecimal que permite al usuario ingresar sus movimientos y opciones de selección.
Como posibles objetivos que nos gustaría alcanzar aparte de lo ya descrito, sería aumentar el número de niveles, y poder añadir habilidades que el jugador pueda adquirir en el transcurso de la partida. 
Otro posible objetivo sería implementar una tecnología para permitir que los usuarios monitoreen el resultado de la partida, se utilizará el módulo PMOD ESP32 para conectarse de forma inalámbrica a un dispositivo móvil y mostrar el nombre de cada jugador y los resultados actuales. Para lograr esto, se creará una interfaz de usuario personalizada.
El objetivo del proyecto es utilizar VHDL y una FPGA para implementar la lógica del juego, así como para controlar la matriz de LEDs y las luces LED que se utilizarán como indicadores de vidas. Se espera que el resultado final sea un juego completamente funcional que pueda ser jugado en la FPGA utilizando los botones de control y visualizado en la matriz de LEDs.
El proyecto tiene como objetivo no solo desarrollar un juego de arcade en FPGA, sino también aprender y superar las dificultades que puedan surgir en el camino. Con esto, esperamos mejorar nuestra metodología y experiencia para futuros proyectos. En resumen, nuestro proyecto busca brindar una alternativa asequible y compacta a los juegos arcade tradicionales.

## ESTADO DE LA TÉCNICA

Breakout es un juego arcade clásico que se lanzó en 1976 por Atari. El objetivo del juego es derribar una pared de ladrillos mediante el uso de una pelota y una barra móvil. El jugador controla la barra y debe rebotar la pelota para romper todos los ladrillos.


Un buen ejemplo de la realización de este juego es “FPGA Project - Breakout Game”, en el cual se puede observar que la explicación de su desarrollo e implementación es bastante pobre, y a su vez complicada por sus componentes, ya que utiliza una pantalla para mostrar la partida. Pero nos puede servir de apoyo para desarrollar nuestro proyecto. 
Nosotros haríamos algo muy similar, pero mejoraríamos el fondo, el tamaño y diseño de los bloques, también lo implementaremos en una matriz de led y no en una pantalla.
"Design and Implementation of Breakout Game on FPGA using VGA Controller" (Sajjad et al., 2020): Este trabajo propone una implementación de Breakout en FPGA utilizando VHDL y un controlador VGA. El juego se controla mediante un teclado PS/2 y se muestra en una pantalla VGA. Una de las virtudes de este trabajo es la capacidad de implementar el juego en hardware y utilizar periféricos estándar, lo que puede mejorar la accesibilidad y la facilidad de uso. 
Este proyecto incorporará una matriz de leds para jugar el juego, un teclado para poder mover la barra un contador de nivel y unos leds que indicarán las vidas que le quedan al jugador en cada momento de la partida y un zumbador para mostrar de forma sonora cuando un jugador pierde una vida o indicar el inicio y final de la partida. Finalmente, se conectará el ESP 32 para poder mostrar la información de la partida en un dispositivo móvil a través de una conexión inalámbrica.

## SOLUCIÓN PROPUESTA

Una solución propuesta para alcanzar el objetivo del proyecto de implementar un juego de Breakout en una FPGA utilizando VHDL ,se requeriría llevar a cabo una investigación profunda sobre el juego Breakout, incluyendo su mecánica, diseño de niveles y la forma en que se actualizará la pantalla para mostrar el estado del juego. Esta información sería utilizada para diseñar la lógica del juego en VHDL.
Una vez se tenga una idea clara de la lógica del juego, se podría proceder a implementarla utilizando VHDL. Sería importante asegurarse de que el código sea modular y escalable, permitiendo la fácil adición de nuevas funcionalidades en el futuro.
Una vez se tenga la lógica del juego implementada, se podría proceder a diseñar la interfaz de usuario y la forma en que se controlará el juego utilizando los botones disponibles. Se podría utilizar una combinación de hardware y software para lograr una experiencia de juego suave y satisfactoria.
Finalmente, se deberá probar y depurar el juego en la FPGA, asegurándose de que todas las funcionalidades estén trabajando correctamente y que el juego sea fácil de jugar. Sería importante llevar a cabo pruebas exhaustivas para garantizar que el juego sea estable y libre de errores antes de considerarlo completamente funcional.
En resumen, la primera solución propuesta sería llevar a cabo una investigación exhaustiva sobre la lógica del juego, implementarla utilizando VHDL y diseñar una interfaz de usuario efectiva antes de realizar pruebas y depuración para asegurar un juego funcional y satisfactorio.

## REALIZACIÓN

Para esta parte se va a identificar los pasos a seguir para la realización del Proyecto final. Para ello, se ha dividido el proyecto en los siguientes hitos:
Anteproyecto: Se ha creado este documento como una idea previa de lo que se va a realizar.
Hito 1: Creación del juego sencillo. A grandes rasgos el juego permite que la pelota se mueva de un lado a otro, así como permitir el movimiento de la barra móvil y permitir que puedan interaccionar. Si la pelota toca un extremo (izquierda-derecha) del escenario se vuelve a reiniciar. Se realizará por Javier Gil y Javier Díez.
Hito 2: Se implementará el sistema de vidas y el indicador de nivel de la partida. Finalmente se insertará un zumbador que notifique cada vez que se pierde una vida o se inicia la partida. Se realizará por Noé Gandarillas.
Hito 3: Añadir otras opciones de juego, como introducir obstáculos en la matriz de leds. En este caso la pelota puede rebotar con dichos obstáculos, aumentando la dificultad del juego. Otras opciones serían el incremento en la velocidad de la pelota o la adición de distintos elementos que puedan incrementar o disminuir el tamaño de la barra móvil o incrementar el número de pelotas en juego para pasar de un juego sencillo a uno más complicado. Se realizará distribuyendo las tareas de ampliación entre los tres integrantes del grupo.
Hito 4 (Opcional):  Implementar el PMOD (interfaz móvil u ordenador). En este caso se mostrarán las vidas y el nivel en la pantalla de un teléfono o monitor a través de dicha interfaz. Se realizará en conjunto en las últimas semanas disponibles para acabar el proyecto.
