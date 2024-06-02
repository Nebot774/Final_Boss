# Explora El Espacio Con la NASA

Este proyecto de exploración espacial está desarrollado en Flutter y utiliza diversas APIs de la NASA para proporcionar información y visualizaciones relacionadas con el espacio. La estructura del proyecto está organizada de manera que cada funcionalidad está separada en diferentes directorios, facilitando la mantenibilidad y la escalabilidad.

## Estructura del Proyecto

### `lib/`

El directorio principal del proyecto contiene todos los archivos y directorios necesarios para la aplicación.

#### `animations/`

Contiene las animaciones utilizadas en la aplicación para mejorar la experiencia del usuario.

#### `bloc/`

Implementa el patrón BLoC (Business Logic Component) para manejar la lógica de negocio y la gestión de estado de la aplicación.

- **blocs/**: Contiene los archivos BLoC que manejan la lógica de negocio.
- **events/**: Contiene los eventos que pueden desencadenar cambios en los BLoCs.
- **states/**: Contiene los estados que pueden ser emitidos por los BLoCs.

#### `models/`

Define las estructuras de datos que se utilizan en la aplicación, representando las entidades principales como imágenes, datos de asteroides, etc.

#### `repositories/`

Contiene las clases de repositorio que gestionan la comunicación con las APIs y otras fuentes de datos.

#### `ui/`

Contiene toda la lógica relacionada con la interfaz de usuario.

- **pages/**: Contiene las diferentes pantallas de la aplicación.
  - **rovers/**: Contiene las pantallas relacionadas con los rovers en Marte.
    

#### `widgets/`

Contiene widgets personalizados que se utilizan en diversas partes de la aplicación.

### `test/`

Contiene las pruebas unitarias y de integración para verificar la funcionalidad de los repositorios y widgets. Es importante tener el backend de Spring en ejecución para realizar las consultas y pruebas correctamente.

### `main.dart`

El punto de entrada principal de la aplicación.

## Instalación

Para ejecutar este proyecto, sigue los siguientes pasos:

1. **Clonar el repositorio**:
    ```sh
    git clone https://github.com/tu_usuario/proyecto_exploracion_espacial.git
    cd proyecto_exploracion_espacial
    ```

2. **Instalar las dependencias**:
    ```sh
    flutter pub get
    ```

3. **Ejecutar la aplicación**:
    ```sh
    flutter run
    ```

## Ejecución del Backend

Antes de ejecutar la aplicación y las pruebas, asegúrate de que el backend de Spring esté en funcionamiento. Para ello:

1. Navega al directorio del backend de Spring.
2. Compila y ejecuta el servidor de Spring:
    ```sh
    ./mvnw spring-boot:run
    ```

Esto iniciará el servidor backend necesario para que la aplicación Flutter pueda realizar las consultas.

## API Utilizadas

Este proyecto utiliza varias APIs proporcionadas por la NASA, incluyendo:

- **NASA Open APIs**: Para obtener datos de asteroides, imágenes del día, y más.
- **Google Translate API**: Para traducción de texto si es necesario.



## Licencia

Este proyecto está bajo la Licencia MIT. Para más detalles, por favor revisa el archivo LICENSE.


