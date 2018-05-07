<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
 <xsl:output method="xml"
                version="1.0"
                encoding="UTF-8"
                media-type="text/xml"
                omit-xml-declaration="no"
                indent="yes"/>
                
<xsl:template match="/">
		<xsl:element name="zadanie">
			<xsl:call-template name="informacje"/>
		</xsl:element>
	</xsl:template>    
    
<xsl:template match="//informacje" name="informacje">
		<xsl:copy-of select="//informacje"/>
	</xsl:template>    
					    
</xsl:stylesheet>