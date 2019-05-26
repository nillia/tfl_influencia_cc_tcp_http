# Configuraciones

El archivo [ipfw.sh](ipfw.sh) contiene toda la configuración del router, tanto las pautas de seguridad, como las de emulación de escenarios.

El directorio [nginx](nginx) contiene las configuraciones del servidor Web para cada uno de los dominios.
* [Default](nginx/default) contiene la configuración del Flujo continuo de bytes.
* [Banderas](nginx/banderas) contiene la configuración del sitio Web: Banderas.
* [Netflix](nginx/netflix) contiene la configuración del catálogo de contenidos de Netflix.
* [Twitter](nginx/twitter) contiene la configuración del perfil de twitter.

Finalmente, se incluye además, dentro del directorio [cert_ssl](cert_ssl) los certificados SSL generados para la experimentación.
