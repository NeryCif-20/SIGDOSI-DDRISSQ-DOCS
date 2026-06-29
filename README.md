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