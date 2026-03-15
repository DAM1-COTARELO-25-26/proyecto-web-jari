<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat"/>

    <xsl:key name="agrupacionEstado" match="anime" use="@estado"/>

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
 
                    <div style="background: #181818; border: 1px solid #333; padding: 15px; border
                                radius: 8px; display: inline-block; margin-top: 15px;"> 
                        <p style="margin: 0; color: #FFD700; font-size: 1.1rem;"> 
                            <strong>Animes en la base de datos: </strong>  
                            <xsl:value-of select="count(//anime)"/>  
                            <span style="color: #555; margin: 0 10px;">|</span> 
                            <strong>Nota media global: </strong>  
                            <xsl:value-of select="round(sum(//anime/rating) div count(//anime))"/> / 10 
                        </p> 
                    </div> 
 
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
        
        <xsl:for-each select="anime[generate-id(.) = generate-id(key('agrupacionEstado', @estado))]">
            
            <section class="intro" style="margin-top: 40px; padding: 20px;">
                <h2 style="text-transform: capitalize;">Animes en <xsl:value-of select="@estado"/></h2>
            </section>

            <xsl:for-each select="key('agrupacionEstado', @estado)">
                
                <xsl:sort select="rating" data-type="number" order="descending"/>
                
                <xsl:apply-templates select="."/>
            </xsl:for-each>
            
        </xsl:for-each>
    </xsl:template>

        <xsl:template match="anime">
        <article class="anime-section">
            <a href="#">
                <img>
                    <xsl:attribute name="src">../img/<xsl:value-of select="@id"/>.jpg</xsl:attribute>
                    <xsl:attribute name="alt">Portada del anime <xsl:value-of select="titulo"/></xsl:attribute>
                </img>
            </a>
            <div class="anime-info">
                <h3><xsl:value-of select="titulo"/></h3>
                <p><strong>Nota: </strong> <xsl:value-of select="rating"/> / 10</p>
                <p><strong>Géneros: </strong> 
                    <xsl:for-each select="generos/genero">
                        <xsl:value-of select="."/>
                        <xsl:if test="position() != last()">, </xsl:if>
                    </xsl:for-each>
                </p>
                <p style="margin-top: 15px;"><xsl:value-of select="sinopsis"/></p>
                
                <div style="margin-top: 10px;">
                    <p><strong>Total de temporadas: </strong> <xsl:value-of select="temporadas/@total"/></p>
                    <p><strong>Protagonistas: </strong> 
                        <xsl:for-each select="personajes/principales/protagonista">
                            <xsl:value-of select="."/>
                            <xsl:if test="position() != last()">, </xsl:if>
                        </xsl:for-each>
                    </p>
                </div>
            </div>
        </article>
    </xsl:template>
</xsl:stylesheet>