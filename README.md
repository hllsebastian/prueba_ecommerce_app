# 🛒 Flutter Ecommerce Demo App

Este proyecto es una aplicación de ecommerce desarrollada con **Flutter**, enfocada en demostrar buenas prácticas de desarrollo, gestión de estado con `Provider`, navegación con `GoRouter`, y consumo de una API pública de productos.

## 📱 Características principales

- Pantalla principal con listado de categorías.
- Navegación por productos filtrados por categoría.
- Carrito de compras con modo normal o exprés (según la hora).
- Pantalla de detalle de producto.
- Gestión global del estado del carrito.
- Arquitectura limpia y modular.
- Diseño responsive y optimizado para móviles.

## 🚀 Tecnologías usadas

- **Flutter**
- **Provider** - Gestión de estado
- **GoRouter** - Navegación
- **Dio / http** - Llamadas a la API
- **API pública** - [Fake Store API](https://fakestoreapi.com/)

## 🧱 Estructura del proyecto

```bash
lib/
├── data/             # Endpoints, servicios y modelos de datos
├── domain/           # Reglas de negocio y modelos
├── presentation/     # Widgets y pantallas
│   ├── home/
│   ├── products/
│   ├── cart/
├── provider/         # Providers globales
├── routes/           # Configuración de rutas con GoRouter
└── main.dart
```

---

## 🔧 Cómo correr el proyecto

### 1. Clonar el repositorio

```bash
git clone https://github.com/hllsebastian/prueba_ecommerce_app.git
```

### 2. Instalar dependencias

```bash
flutter pub get
```

### 3. Verificar el entorno

Asegúrate de tener Flutter instalado correctamente:

```bash
flutter doctor
```

> Puedes usar un emulador o un dispositivo físico para correr la app.

### 4. Ejecutar el proyecto

```bash
flutter run
```

---

## 📦 API utilizada

Se consume la API pública de productos [FakeStoreAPI](https://fakestoreapi.com/).

Ejemplo de endpoints definidos en `lib/data/api/endpoints.dart`:

```dart
static const String base = 'https://fakestoreapi.com';
static const String categories = '$base/products/categories';
static String productById(int id) => '$base/products/$id';
```

---

## 🛒 Modos del carrito

El modo del carrito se ajusta automáticamente según la hora:

- **Modo exprés:** Se puede activar entre las 10:00am y 04:00pm horas.
- **Modo normal:** Fuera del horario del modo exprés.

La lógica está implementada en `CartProvider` y `HomeScreen`.

---
