<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xml"
                version="1.0"
                encoding="utf-8"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" 
                doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" 
                indent="yes"/>

    <xsl:template match="/">
        <html>
            <!-- <xsl:copy-of select="document('')/xsl:stylesheet/namespace::*[not(local-name() = 'xsl')]"/> -->
            <xsl:attribute name="xml:lang">pl</xsl:attribute>
            <xsl:attribute name="lang">pl</xsl:attribute>
            <head>
                <!-- <xsl:call-template name="Metadane"/> -->
                <title>Liga Piłkarska</title>
            </head>          
            <body>
            	<h1>Initial Commit</h1>                
            </body>
        </html>
    </xsl:template>

 </xsl:stylesheet>   