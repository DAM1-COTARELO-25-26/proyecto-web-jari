<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <html lang="es">
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Catálogo de Animes</title>
            <link rel="stylesheet" href="../css/style.css"/>
            <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&amp;display=swap" rel="stylesheet"/>
        </head>
        <body>
            <header>
                <div class="top-nav">
                    <ul class="top-links">
                        <li><a href="../index.html">Inicio</a></li>
                        <li><a href="#">Catálogo XSLT</a></li>
                    </ul>
                </div>
            </header>

            <main>
                <section class="intro">
                    <h2>Nuestro Catálogo de Anime</h2>
                    <p>Generado dinámicamente usando XML y XSLT</p>
                </section>

                <div id="contenedor-animes">
                    <xsl:apply-templates select="catalogoAnimes"/>
                </div>
            </main>

            <footer>
                <p>Proyecto LMSGI - Transformación XSLT y consultas XPath</p>
            </footer>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="catalogoAnimes">
        </xsl:template>

</xsl:stylesheet>