# JARI - Mundo Anime

Bienvenido a **JARI**, una plataforma web dedicada a la documentación y valoración del anime. Este proyecto se basa en dar información de cada anime en cada una de sus páginas web.

##Objetivo y Contenidos

El propósito es servir como una enciclopedia interactiva con dos enfoques:
* **Exploración:** Una portada atractiva para descubrir nuevas series.
* **Profundidad:** Fichas técnicas con sinopsis, tablas de episodios, listas de personajes y sistemas de valoración.

> **Público Objetivo:** Usuarios **mayores de 16 años**, debido a la complejidad de las tramas y contenidos.

---

##  Identidad Visual y Diseño (CSS)

El proyecto mantiene una estética global (Dark Mode + Acentos Cálidos), pero implementa **dos layouts distintos** según la funcionalidad de la página.

### 1. Estilos Globales (Comunes)
* **Tipografía:** 'Poppins', sans-serif.
* **Paleta de Colores:**
    * 🔴 `#ff3c00` (Naranja Rojizo): Color principal de marca, títulos y bordes.
    * 🟡 `#FFD700` (Dorado): Enlaces y destacados.
    * ⚫ `#111111` / `#181818`: Fondos oscuros para reducir la fatiga visual.
* **Navegación:** Menú lateral oculto (Sidebar) accesible mediante un botón de logo fijo (`.logo-button`) en la esquina superior izquierda.

### 2. Layout de Portada (`index.html`)
Diseño basado en el **patrón "Zig-Zag"**:
* Secciones alternas (Imagen Izquierda / Imagen Derecha).
*   Imágenes grandes y títulos llamativos.

### 3. Layout de Ficha Técnica (`[anime].html`)
Diseño tipo **"Dashboard"** estructurado para mostrar grandes cantidades de datos:
* **Contenedor Principal (`.main-container`):** Posee un `padding-left: 110px` para acomodar el logo fijo sin superposiciones.
* **Grilla Superior (`.top-section`):** División 2:1 entre la información (Sinopsis + Datos) y la imagen de portada.
* **Tablas Estilizadas:** Cabeceras rojas (`thead`) y filas alternas para facilitar la lectura de episodios/temporadas.
* **Distribución de Personajes (`.characters-grid`):** Distribución en 3 columnas (Principales, Secundarios, Villanos).
* **Zona de Interacción:** Sección inferior con caja de comentarios y valoración por estrellas.

---

## Estructura del Sitio Web

### Mapa del Sitio

```text
JARI (Sitio web)
│
├── index.html  (Inicio - Diseño Zig-Zag)
│   ├── Menú Lateral (Toggle)
│   ├── Intro & Bienvenida
│   ├── Listado Visual de Animes
│   └── Footer
│
├── [nombre-anime].html  (Detalle - Diseño Dashboard)
│   ├── Menú Lateral (Toggle)
│   ├── Top Section:
│   │   ├── Título & Sinopsis
│   │   ├── Data Box (Estudio, Año, Género)
│   │   └── Imagen Portada
│   ├── Tablas de Datos (Temporadas/Episodios)
│   ├── Grilla de Personajes (3 Columnas)
│   ├── Sección de Comentarios & Rating
│   └── Footer
│
└── contacto.html  (Formulario)