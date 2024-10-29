
# Guía para Ejecutar el Proyecto en Flutter

Este documento proporciona instrucciones detalladas sobre cómo configurar y ejecutar el proyecto utilizando **Flutter versión 3.24.4** y **Dart 3.5.4**.

---

## 📋 Requisitos Previos

- **Flutter 3.24.4**
    - Asegúrate de tener instalada la versión **3.24.4** de Flutter. Puedes verificar tu versión ejecutando:

      ```bash
      flutter --version
      ```

- **Dart 3.5.4**
    - Esta versión viene incluida con Flutter 3.24.4.

- **Git**
    - Necesario para clonar el repositorio del proyecto.

- **Dispositivo o Emulador**
    - Un dispositivo físico conectado o un emulador configurado.

---

## 🚀 Instalación de Flutter

Si no tienes Flutter instalado, sigue estos pasos:

1. **Descargar Flutter**

    - Visita [Flutter SDK](https://flutter.dev/docs/get-started/install) y descarga la versión **3.24.4**.

2. **Agregar Flutter a la Ruta del Sistema**

    - Añade el directorio `flutter/bin` a tu variable de entorno `PATH`.

3. **Verificar la Instalación**

    - Ejecuta:

      ```bash
      flutter doctor
      ```

      Deberías ver algo similar a:

      ```
      Doctor summary (to see all details, run flutter doctor -v):
      [✓] Flutter (Channel stable, 3.24.4, on macOS 12.4)
      [✓] Android toolchain - develop for Android devices
      [✓] Xcode - develop for iOS and macOS
      ```

---

## ⚙️ Configuración del Proyecto

1. **Clonar el Repositorio**

   ```bash
   git clone https://github.com/usuario/nombre-del-proyecto.git
   ```

2. **Navegar al Directorio del Proyecto**

   ```bash
   cd nombre-del-proyecto
   ```

3. **Instalar las Dependencias**

   ```bash
   flutter pub get
   ```

---

## ▶️ Ejecución del Proyecto

1. **Conectar un Dispositivo o Iniciar un Emulador**

    - Asegúrate de tener un dispositivo físico conectado o un emulador en ejecución. Puedes verificarlo con:

      ```bash
      flutter devices
      ```

2. **Ejecutar la Aplicación**

   ```bash
   flutter run
   ```

   Esto desplegará la aplicación en el dispositivo o emulador seleccionado.

---

## 🛠️ Comandos Útiles

- **Compilar para Android**:

  ```bash
  flutter build apk
  ```

- **Compilar para iOS** (solo en macOS):

  ```bash
  flutter build ios
  ```

- **Limpiar Archivos de Compilación**:

  ```bash
  flutter clean
  ```

---

## 🐞 Resolución de Problemas

- **Verificar la Configuración**:

  Ejecuta:

  ```bash
  flutter doctor
  ```

  Si hay problemas, `flutter doctor` te dará instrucciones para resolverlos.

- **Actualizar Flutter**:

  ```bash
  flutter upgrade
  ```

---

## 📚 Recursos Adicionales

- [Documentación Oficial de Flutter](https://flutter.dev/docs)
- [Paquetes en pub.dev](https://pub.dev/)

---

## 📞 Contacto

Si tienes preguntas o necesitas soporte, contacta a:

- **Correo Electrónico**: [alexisnavarrobiz@gmail.com](mailto:alexisnavarrobiz@gmail.com)
- **GitHub Issues**: [Issues del Proyecto](https://github.com/usuario/nombre-del-proyecto/issues)

---

## 🎉 ¡Gracias por colaborar!