# SIGDOSI-DDRISSQ-DOCS

## Tabla de Contenido
1. [Core del Negocio](#1-core-del-negocio)
2. [Casos de Uso Expandidos](#2-casos-de-uso-expandidos)
3. [Drivers Arquitectonicos](#3-drivers-arquitectonicos)

## 1. Core del Negocio

### Descripción 
La Dirección Departamental de Redes Integradas de Servicios de Salud de Quezaltenango (DDRISSQ) es la institución encargada de garantizar y coordinar los servicios médicos, programas de prevención y trámites sanitarios en todo el departamento. Dentro de esta estructura, el Departamento de Planificación para la Salud tiene entre sus funciones planificar, coordinar y dar seguimiento a las acciones relacionadas con la infraestructura de los establecimientos adscritos a la DDRISSQ, mediante la gestión de documentación técnica y el control de solicitudes de mantenimiento.

### Stakeholders
* **Jefe del Departamento de Planificación**: Supervisa la gestión de documentación técnica y solicitudes de mantenimiento, dando seguimiento a los procesos y apoyando la toma de decisiones relacionadas con la infraestructura.
* **Encargado de la Unidad de Gestión de Infraestructura**: Gestiona la documentación técnica, administra solicitudes de mantenimiento y da seguimiento al estado de la infraestructura de los establecimientos.
* **Personal Administrativo de los Establecimientos de Salud**: Interesados en el seguimiento y resolución de necesidades de infraestructura del establecimiento; reciben los beneficios de la gestión realizada.

### Diagrama CDU de Alto Nivel

![cdu-alto-nivel](./assets/use-cases/high-level-uc.png)

### Primera Descomposición

![cdu-primera-descomposición](./assets/use-cases/descomposition-uc.png)

## 2. Casos de Uso Expandidos

### CDU100 - Gestionar Establecimientos

![cdu-gestionar-clientes](./assets/use-cases/facility-management-uc.png)

|**Id**|CDU100|
|-|-|
|**Nombre**|Gestionar Establecimientos|
|**Actores**|Jefe del Departamento de Planificación|
|**Proposito**|Mantener disponible y actualizada la información de los establecimientos de salud adscritos a la DDRISSQ para apoyar los procesos de planificación relacionados con infraestructura.|
|**Resumen**|Permite administrar y mantener actualizada la información general y de ubicación de los establecimientos de salud, facilitando su identificación, seguimiento y vinculación con los procesos de documentación técnica y mantenimiento de infraestructura.|
|**Ruta Esperada**|1. Registro de un establecimiento de salud.<br>2. Actualizar información relevante del establecimiento.<br>3. Mantener el estado de vigencia del establecimiento.<br>4. Consultar información de establecimientos según necesidades operativas.<br>5. Asociar o mantener actualizada la ubicación geográfica del establecimiento.|
|**Cursos Alternos**|1a. La información del establecimiento ya existe y se procede únicamente a su actualización.<br>2a. El establecimiento se da de baja.<br>4a. No se encuentran establecimientos que cumplan con los criterios de consulta.|
|**Prioridad**|Alta.|

### CDU200 - Gestionar Documentación Técnica

![cdu-gestionar-documentación-técnica](./assets/use-cases/technical-doc-management-uc.png)

|**Id**|CDU200|
|-|-|
|**Nombre**|Gestionar Documentación Técnica|
|**Actores**|Encargado de la Unidad de Gestión de Infraestructura<br>Jefe del Departamento de Planificación|
|**Proposito**|Mantener disponible y actualizada la documentación técnica sobre la infraestructura de los establecimientos de salud adscritos a la DDRISSQ para apoyar los procesos de toma de decisiones relacionadas con infraestructura.|
|**Resumen**|Permite administrar y mantener actualizada la documentación técnica de los establecimientos de salud, facilitando su seguimiento y vinculación con los procesos de mantenimiento de infraestructura.|
|**Ruta Esperada**|1. Registrar documentación técnica de un establecimiento de salud.<br>2. Actualizar la información o los archivos asociados a la documentación técnica.<br>3. Consultar documentación técnica según las necesidades operativas.<br>4. Mantener el estado de vigencia de la documentación técnica.|
|**Cursos Alternos**|1a. El establecimiento de salud asociado no existe o no se encuentra disponible.<br>3a. No se encuentra documentación técnica que cumpla con los criterios de consulta.|
|**Prioridad**|Alta.|

### CDU300 - Gestionar Solicitudes de Mantenimiento

![cdu-gestionar-solicitudes-de-mantenimiento](./assets/use-cases/maintenance-req-management-uc.png)

|**Id**|CDU300|
|-|-|
|**Nombre**|Gestionar Solicitudes de Mantenimiento|
|**Actores**|Jefe del Departamento de Planificación|
|**Proposito**|Permitir el registro, seguimiento y actualización de las solicitudes de mantenimiento de la infraestructura de los establecimientos de salud adscritos a la DDRISSQ, apoyando la planificación y control de las intervenciones de mantenimiento.|
|**Resumen**|Permite administrar las solicitudes de mantenimiento, facilitando su registro, consulta, actualización y seguimiento mediante el control de su estado y demás información relevante.|
|**Ruta Esperada**|1. Registrar una solicitud de mantenimiento para un establecimiento de salud.<br>2. Actualizar la información de la solicitud.<br>3. Consultar solicitudes de mantenimiento según las necesidades operativas.<br>4. Dar seguimiento al estado de la solicitud (Pendiente, En proceso, Finalizada o Cancelada).<br>5. Registrar observaciones o información complementaria relacionada con la atención de la solicitud.|
|**Cursos Alternos**|1a. El establecimiento de salud asociado no existe o no se encuentra disponible.<br> 2a. La solicitud de mantenimiento que se desea actualizar no existe en el sistema.<br> 2b. La solicitud de mantenimiento es cancelada.<br>3a. No se encuentran solicitudes de mantenimiento que cumplan con los criterios de consulta.<br>4a. La solicitud ya se encuentra finalizada o cancelada y no permite determinadas modificaciones.|
|**Prioridad**|Alta.|

### CDU400 - Gestionar Usuarios
![cdu-gestionar-usuarios](./assets/use-cases/user-management-uc.png)

|**Id**|CDU400|
|-|-|
|**Nombre**|Gestionar Usuarios|
|**Actores**|Jefe del Departamento de Planificación|
|**Proposito**|Permitir la administración de los usuarios del sistema mediante su registro, consulta, actualización y control de acceso, garantizando que únicamente el personal autorizado pueda utilizar las funcionalidades del sistema de acuerdo con su rol.|
|**Resumen**|Permite administrar los usuarios del sistema, facilitando su registro, consulta, actualización y, cuando corresponda, la activación o desactivación de cuentas, así como la asignación de roles y permisos.|
|**Ruta Esperada**|1. Registrar un nuevo usuario en el sistema.<br>2. Asignar el rol correspondiente al usuario.<br>3. Consultar la información de los usuarios registrados.<br>4. Actualizar la información del usuario cuando sea necesario.<br>5. Activar o desactivar la cuenta de un usuario según las necesidades administrativas.|
|**Cursos Alternos**|1a. El usuario ya se encuentra registrado en el sistema.<br>1b. La información proporcionada es incompleta o no cumple con las validaciones establecidas.<br>2a. El rol seleccionado no existe o no se encuentra disponible.<br>4a. El usuario que se desea actualizar no existe en el sistema.<br>5a. No es posible desactivar el único usuario con privilegios de administrador.<br>5b. El usuario ya se encuentra en el estado solicitado (activo o inactivo).|
|**Prioridad**|Alta.|

## 3. Drivers Arquitectonicos

### 1. Requisitos Funcionales

#### Gestión de Establecimientos
* **RF01 - Registrar establecimiento**: El sistema deberá permitir registrar nuevos establecimientos de salud.
* **RF02 - Consultar establecimientos**: El sistema deberá permitir consultar la información de los establecimientos registrados.
* **RF03 - Actualizar establecimiento**: El sistema deberá permitir modificar la información de un establecimiento existente.
* **RF04 - Inhabilitar establecimiento**: El sistema deberá permitir dar de baja a un establecimiento existente.
* **RF05 - Asociar ubicación geográfica**: El sistema deberá permitir asociar la ubicación geográfica a un establecimiento.

#### Gestión de Documentación Técnica
* **RF06 - Registrar documentación técnica**: El sistema deberá permitir registrar documentación técnica asociada a un establecimiento de salud.
* **RF07 - Consultar documentación técnica**: El sistema deberá permitir consultar la documentación técnica almacenada.
* **RF08 - Actualizar documentación técnica**: El sistema deberá permitir modificar la información de la documentación técnica registrada.
* **RF08 - Historial de modificaciones**: El sistema deberá registrar el historial de cambios realizados sobre la documentación técnica.

#### Gestión de Solicitudes de Mantenimiento
* **RF09 - Registrar solicitud**: El sistema deberá permitir registrar solicitudes de mantenimiento.
* **RF10 - Consultar solicitudes**: El sistema deberá permitir consultar las solicitudes registradas.
* **RF11 - Actualizar solicitud**: El sistema deberá permitir modificar la información de una solicitud de mantenimiento.
* **RF12 - Registrar observaciones**: El sistema deberá permitir registrar observaciones relacionadas con una solicitud de mantenimiento.*
* **RF13 - Cancelar solicitud**: El sistema deberá permitir cancelar una solicitud de mantenimiento.
* **RF14 - Historial de solicitudes**: El sistema deberá registrar el historial de cambios realizados sobre las solicitudes de mantenimiento.

#### Gestión de Usuarios
* **RF15 - Registrar usuario**: El sistema deberá permitir registrar nuevos usuarios.
* **RF16 - Consultar usuarios**: El sistema deberá permitir consultar la información de los usuarios registrados.
* **RF17 - Actualizar usuario**: El sistema deberá permitir modificar la información de un usuario.
* **RF18 - Activar o desactivar usuario**: El sistema deberá permitir cambiar el estado de una cuenta de usuario.

#### Generales
* **RF19 - Adjuntar archivos**: El sistema deberá permitir adjuntar archivos digitales a la documentación técnica, información de un establecimiento y/o solicitudes de mantenimiento de los mismos.
* **RF20 - Descargar archivos**: El sistema deberá permitir descargar los archivos asociados a la documentación técnica y/o a las solicitudes de mantenimiento.

### 2. Requisitos No Funcionales

#### Adecuación Funcional
* **RNF01 - Cobertura funcional**: El sistema deberá proporcionar todas las funcionalidades necesarias para la gestión de establecimientos de salud, documentación técnica, solicitudes de mantenimiento y usuarios.

#### Eficiencia de Desempeño
* **RNF02 - Tiempo de respuesta**: El sistema deberá responder a las solicitudes del usuario en un tiempo máximo de tres segundos bajo condiciones normales de operación.
* **RNF03 - Uso eficiente de recursos**: El sistema deberá optimizar el consumo de memoria, procesamiento y almacenamiento durante su ejecución.

#### Compatibilidad
* **RNF04 - Compatibilidad con navegadores**: El sistema deberá funcionar correctamente en navegadores modernos independientemente del sistema operativo.
* **RNF05 - Interoperabilidad**: El sistema deberá intercambiar información mediante servicios web REST utilizando formato JSON.

#### Capacidad de Interacción
* **RNF06 - Facilidad de uso**: La interfaz del sistema deberá ser intuitiva y de fácil aprendizaje para los usuarios.
* **RNF07 - Consistencia de la interfaz**: El sistema deberá mantener un diseño uniforme en todas las pantallas y formularios.
* **RNF08 - Retroalimentación al usuario**: El sistema deberá mostrar mensajes claros de confirmación, advertencia y error durante las operaciones realizadas.
* **RNF09 - Validación de datos**: El sistema deberá validar la información ingresada antes de procesarla, indicando los campos que contengan errores.

#### Fiabilidad
* **RNF10 - Disponibilidad**: El sistema deberá estar disponible durante el horario laboral establecido por la DDRISSQ.
* **RNF11 - Integridad de la información**: El sistema deberá garantizar la integridad de los datos almacenados evitando pérdidas o inconsistencias.

#### Seguridad
* **RNF12 - Autenticación**: El sistema deberá permitir el acceso únicamente a usuarios autenticados.
* **RNF13 - Autorización**: El sistema deberá restringir el acceso a las funcionalidades según el rol asignado al usuario.
* **RNF14 - Protección de credenciales**: Las contraseñas de los usuarios deberán almacenarse utilizando algoritmos hash seguros.
* **RNF15 - Gestión de sesiones**: El sistema deberá finalizar automáticamente la sesión tras un período de inactividad configurable.

#### Mantenibilidad
* **RNF16 - Arquitectura modular**: El sistema deberá desarrollarse utilizando una arquitectura modular que facilite su mantenimiento.
* **RNF17 - Calidad del código**: El código fuente deberá seguir estándares de codificación y buenas prácticas de desarrollo.

#### Flexibilidad
* **RNF17 - Adaptación a cambios**: El sistema deberá facilitar la adaptación a nuevos procesos administrativos de la institución.

#### Protección
* **RNF18 - Restricción operativa**: El sistema deberá impedir la ejecución de operaciones que puedan comprometer la integridad de la información, considerando el estado de los registros y los permisos del usuario.
* **RNF19 - Protección contra pérdida de información**: El sistema deberá evitar la pérdida de información ante fallos inesperados mediante mecanismos de persistencia adecuados.

### 3. Requisitos de Restricción

#### Técnicos
* **RST01 - Arquitectura del sistema**: El sistema deberá implementarse siguiendo una arquitectura en capas que separe la presentación, la lógica de negocio y el acceso a datos, asimismo seguir una arquitectura cliente-servidor para su comunicación.
* **RST02 - Aplicacion Web**: La solución debe estar preparada para ser desplegada en cualquier entorno.
* **RST03 - Conectividad**: El sistema requerirá conexión a la red institucional o a Internet para su funcionamiento.

#### Operacionales
* **RST04 - Eliminación de registros**: No se permite eliminación física de registros por normativas de la institución. Solo debe aplicarse baja lógica o estado "inactivo".

#### Gestión
* **RST05 - Control de versiones**: El código fuente deberá administrarse utilizando Git como sistema de control de versiones.
* **RST06 - Metodología de desarrollo**: El desarrollo del sistema deberá seguir los lineamientos de la metodología ágil Scrum.
* **RST07 - Desarrollo del sistema**: El sistema debe desarrollarse durante seis mes, según cronograma aprobado.