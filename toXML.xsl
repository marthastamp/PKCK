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
			<xsl:call-template name="Podsumowanie"/>
		</xsl:element>
	</xsl:template>    
    
<xsl:template match="//informacje" name="informacje">
		<xsl:copy-of select="//informacje"/>
	</xsl:template>    
					    
<xsl:template name="Podsumowanie">
	<xsl:element name="Podsumowanie">
		<xsl:element name="IlośćKlubów">
			<xsl:value-of select="count(//liga_piłkarska/kluby/klub)"/>
		</xsl:element>
		<xsl:element name="IlośćStadionów">
			<xsl:value-of select="count(//liga_piłkarska/kluby/klub/stadion)"/>
		</xsl:element>	
		<Kluby_w_miastach>
			<xsl:element name="Manchester">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Manchester'])"/>
			</xsl:element>
		</Kluby_w_miastach>
		<DataWygenerowania>
			<xsl:element name="DataWygenerowania">
				<xsl:value-of select="current-dateTime()"/>
			</xsl:element>
		</DataWygenerowania>
	</xsl:element>	
</xsl:template>   				    
					    
</xsl:stylesheet>