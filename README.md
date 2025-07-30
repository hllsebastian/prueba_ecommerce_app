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
- **http** - Llamadas a la API
- **API pública** - [Fake Store API](https://fakestoreapi.com/)

## 🧱 Estructura del proyecto

```bash
lib/
├── data/             # Endpoints, servicios y modelos de datos
├── domain/           # Reglas de negocio y modelos
├── presentation/     # Providers, Widgets y pantallas
│   ├── providers/  
│   ├── screens/
│   ├── widgets/
├── routes/           # Configuración de rutas con GoRouter
└── main.dart
