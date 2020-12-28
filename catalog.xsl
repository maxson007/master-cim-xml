<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>My CD Collection</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Titre</th>
                        <th>Artiste</th>
                    </tr>
                    <xsl:for-each select="catalogue/cd">
                        <tr>
                            <td><xsl:value-of select="titre"/></td>
                            <td><xsl:value-of select="artiste"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>