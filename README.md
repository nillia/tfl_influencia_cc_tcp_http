# Recursos del TFL: "Influencia del Control de Congestión de TCP en el rendimiento de HTTP"

El trabajo puede ser solicitado a la siguiente dirección de correo electrónico: nico @ illia.dev. 

En cuanto a la presentación del mismo, puede ser visto accediendo [aqui](https://docs.google.com/presentation/d/1-BBKYjdDrXlLI-9_DZkDQZlNQW2Q-AK7QgMZzVxVR44/edit?usp=sharing).

## Resumen
El incremento de la funcionalidad de los sitios Web, el cambio de comportamiento de los usuarios en la Web en general y el crecimiento del uso de múltiples dispositivos por persona hace que la cantidad de tráfico global se haya incrementado. El fenómeno de las redes sociales y servicios de _streamming_ abarca una gran proporción de este tráfico.

Originalmente, los sitios Web estaban compuestos por textos, con apenas imágenes y sin estilos complejos. Hoy en día, es muy difícil imaginar este escenario siendo que algunos de estos sitios reemplazan hasta aplicaciones de escritorio. Este incremento de funcionalidad y la necesidad de soportar múltiples dispositivos completamente distintos hace que el tamaño de los mismos haya crecido a un ritmo considerable con el paso del tiempo.

Por otro lado, los dispositivos fueron mejorando la capacidad de procesamiento con los años, haciendo que la percepción de los usuarios a los tiempos de descarga se incrementó. Siendo que unos pocos cientos de milisegundos pueden hacer la diferencia entre que un usuario acceda al sitio o no.
La capacidad finita de transmitir información por todo el mundo utilizando los distintos enlaces y las limitaciones físicas de los mismos hacen que los protocolos actuales, como TCP y HTTP, deban ser optimizados para aprovechar mejor la utilización de los mismos y así, agilizar los tiempos.

Este trabajo explora cómo influyen los distintos algoritmos de control de congestión de TCP en los tiempos de descarga en distintas versiones de HTTP. Para ello, se realiza la experimentación descargando distintos tipos de sitios Web, clasificados según su contenido, y un flujo continuo de bytes (como puede ser un archivo de sonido).
Estas descargas además, se realizan bajo distintos escenarios planteados considerando variaciones de la la tasa de transferencia y tasa de pérdida de paquetes del enlace y la latencia de la conexión.
Como resultado se ofrecen diferentes combinaciones de algoritmos de control de control de congestión de TCP y versión de HTTP más eficiente para cada caso.

## Configuraciones utilizadas
Para consultar las configuraciones utilizadas durante la experimentación, ir a la Sección [Configuraciones](https://github.com/nillia/tfl_influencia_cc_tcp_http/tree/master/configuraciones).

## Resultados
Para consultar los resultados obtenidos en el trabajo, ir a la Sección [Resultados](https://github.com/nillia/tfl_influencia_cc_tcp_http/tree/master/resultados).
