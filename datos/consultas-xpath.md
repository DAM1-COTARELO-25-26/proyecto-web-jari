# Consultas XPath - Catálogo de Animes 
En este documento se detallan las 10 consultas XPath realizadas sobre el archivo `menu.xml` para extraer información 
específica del catálogo. 

## Rutas absolutas y relativas (2 consultas) 

### 1. Obtener todos los títulos de los animes 
* **Expresión XPath:** `//titulo` 
* **Explicación:** Selecciona todos los nodos `<titulo>` sin importar en qué nivel del documento se encuentren. 
* **Resultado esperado:** Devuelve una lista con los textos: "Naruto", "Assassination Classroom", "Attack on Titan", etc. 
* **Contexto de uso:** Útil para generar un índice rápido o un menú desplegable solo con los nombres de las series. 

### 2. Obtener todos los géneros usando ruta absoluta 
* **Expresión XPath:** `/catalogoAnimes/anime/generos/genero` 
* **Explicación:** Navega desde la raíz del documento bajando nivel por nivel hasta llegar a los nodos `<genero>`. 
* **Resultado esperado:** Devuelve todos los géneros etiquetados: "Acción", "Aventura", "Shonen", "Comedia", etc. 
* **Contexto de uso:** Ideal para extraer una lista completa de categorías y luego filtrarlas para crear un menú de etiquetas (tags). --- 
## Predicados (2 consultas)

### 3. Animes que están actualmente en emisión 
* **Expresión XPath:** `//anime[@estado='emision']/titulo` 
* **Explicación:** Filtra los elementos `<anime>` buscando aquellos cuyo atributo `estado` sea exactamente "emision", y luego extrae su título. 
* **Resultado esperado:** "Demon Slayer", "Jujutsu Kaisen", "Fire Force", etc. 
* **Contexto de uso:** Se usaría en la página principal para crear una sección de "Nuevos episodios cada semana". 

### 4. Extraer los nombres de los protagonistas de un anime específico 
* **Expresión XPath:** `//anime[@id='A003']//protagonista` 
* **Explicación:** Busca el anime con el identificador "A003" (Attack on Titan) y extrae todos los nodos `<protagonista>` de su interior. 
* **Resultado esperado:** "Eren Yeager". 
* **Contexto de uso:** Perfecto para la página de detalles de una serie, para cargar automáticamente la ficha técnica de los personajes principales. --- 
## Funciones XPath (3 consultas) 

### 5. Contar el número total de animes en el catálogo 
* **Expresión XPath:** `count(//anime)` 
* **Explicación:** Usa la función matemática `count()` para sumar cuántos elementos `<anime>` existen en el documento. 
* **Resultado esperado:** `14` 
* **Contexto de uso:** Para mostrar estadísticas en el pie de página (ej: "Actualmente tenemos 14 animes en nuestra base de datos"). 

### 6. Buscar animes por palabra clave en el título 
* **Expresión XPath:** `//anime[contains(titulo, 'Dragon')]/titulo` 
* **Explicación:** Utiliza la función de cadena `contains()` para encontrar animes cuyo título incluya la palabra "Dragon". 
* **Resultado esperado:** "Dragon Ball" y "Tragones y Mazmorras" (si se busca 'Dragon' en su título en inglés o si tuvieran coincidencia).
                            En este XML exacto devolverá "Dragon Ball". 
* **Contexto de uso:** Es la base para programar la barra de búsqueda de la página web. 

### 7. Sumar el total de temporadas de todas las series 
* **Expresión XPath:** `sum(//temporadas/@total)` 
* **Explicación:** Usa la función `sum()` para sumar el valor numérico de todos los atributos `total` dentro de `<temporadas>`. 
* **Resultado esperado:** `38` (La suma de 5+2+4+4+4+2+1+2+7+4+2+1+1+1). 
* **Contexto de uso:** Para un panel de curiosidades o estadísticas del sitio web. --- 
## Navegación por ejes (1 consulta) 

### 8. Encontrar el anime que se registró justo después de "Naruto" 
* **Expresión XPath:** `//anime[titulo='Naruto']/following-sibling::anime[1]/titulo` 
* **Explicación:** Localiza el anime con el título 'Naruto' y usa el eje `following-sibling::` para seleccionar a su "hermano" inmediatamente 
                   siguiente (el siguiente nodo `<anime>` en el XML). 
* **Resultado esperado:** "Assassination Classroom". 
* **Contexto de uso:** Programar botones de "Siguiente Anime" y "Anime Anterior" en un carrusel o visor de fichas. --- 
## Consultas Complejas (2 consultas)

### 9. Obras maestras finalizadas 
* **Expresión XPath:** `//anime[rating >= 8.5 and @estado='finalizado']/titulo` 
* **Explicación:** Combina dos condiciones en el predicado usando el operador lógico `and`: que la nota sea mayor o 
                   igual a 8.5 Y que la serie ya haya terminado. 
* **Resultado esperado:** "Attack on Titan", "Dragon Ball" y "Haikyu!!". 
* **Contexto de uso:** Para generar una lista de recomendaciones para usuarios que quieren maratonear animes 
                       sin tener que esperar a nuevos capítulos. 

### 10. Series largas con múltiples villanos 
* **Expresión XPath:** `//anime[temporadas/@total >= 4 and count(personajes/villanos/antagonista) >= 3]/titulo` 
* **Explicación:** Filtra los animes que tienen 4 o más temporadas en total, Y además cuentan con 3 o más antagonistas registrados en su nodo 
                    de villanos usando la función `count()` dentro del predicado. 
* **Resultado esperado:** "Naruto", "Attack on Titan", "Demon Slayer", "Seven Deadly Sins", "My Hero Academia" y "Haikyu!!". 
* **Contexto de uso:** Para crear una colección especial en la web tipo "Grandes sagas y combates épicos". 