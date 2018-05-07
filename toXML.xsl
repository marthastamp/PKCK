<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
 <xsl:output method="xml"
                version="1.0"
                encoding="UTF-8"
                media-type="text/xml"
                omit-xml-declaration="no"
                indent="yes"/>
                
<xsl:key name="klubIdKEY" match="//liga_piłkarska/kluby/klub" use="@klubId"/>
<xsl:key name="stadionIdKEY" match="//liga_piłkarska/stadiony/stadion" use="@stadionId"/>

<xsl:template match="/">
		<xsl:element name="zadanie">
			<xsl:call-template name="informacje"/>
			<xsl:apply-templates select="zadanie/liga_piłkarska/mecze"/>
			<xsl:call-template name="Podsumowanie"/>
		</xsl:element>
	</xsl:template>    
    
<xsl:template match="kluby"/>
<xsl:template match="stadiony"/>   


<xsl:template match="//informacje" name="informacje">
		<xsl:copy-of select="//informacje"/>
	</xsl:template>    
			
<xsl:template match="zadanie/liga_piłkarska/mecze">
		<xsl:element name="mecze">
			<xsl:apply-templates select="mecz"/>
		</xsl:element>
	</xsl:template>


<xsl:template match="zadanie/liga_piłkarska/mecze/mecz">
		<xsl:element name="mecz">
			<xsl:variable name="klubVAR" select="key('klubIdKEY', @klubId)"/>
			<xsl:element name="klub">
				<xsl:value-of select="concat($klubVAR/nazwa, ' ', $klubVAR/miasto)"/>
			</xsl:element>
		<xsl:variable name="stadionVAR" select="key('stadionIdKEY', @stadionId)"/>
		<xsl:element name="stadion">
			<xsl:value-of select="concat($stadionVAR/nazwa, ' (', $stadionVAR/pojemność, ') ')"/>
		</xsl:element>
		</xsl:element>
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
			<xsl:element name="Londyn">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Londyn'])"/>
			</xsl:element>
			<xsl:element name="Liverpool">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Liverpool'])"/>
			</xsl:element>
			<xsl:element name="Southampton">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Southampton'])"/>
			</xsl:element>
			<xsl:element name="Bournemouth">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Bournemouth'])"/>
			</xsl:element>
			<xsl:element name="WestBromwich">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='West Bromwich'])"/>
			</xsl:element>
			<xsl:element name="Leicester">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Leicester'])"/>
			</xsl:element>
			<xsl:element name="Stoke-on-Trent">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Stoke-on-Trent'])"/>
			</xsl:element>
			<xsl:element name="Swansea">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Swansea'])"/>
			</xsl:element>
			<xsl:element name="Burnley">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Burnley'])"/>
			</xsl:element>
			<xsl:element name="Watford">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Watford'])"/>
			</xsl:element>
			<xsl:element name="Newcastle">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Newcastle'])"/>
			</xsl:element>
			<xsl:element name="Brighton">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Brighton'])"/>
			</xsl:element>
			<xsl:element name="Huddersfield">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Huddersfield'])"/>
			</xsl:element>
			<xsl:element name="CałkowitaIlośćMiast">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub/miasto)"/>
			</xsl:element>
		</Kluby_w_miastach>
		<DataWygenerowania>
			<xsl:element name="DataWygenerowania">
				<xsl:value-of select="current-dateTime()"/>
			</xsl:element>
		</DataWygenerowania>

		<xsl:variable name="PrzelicznikGBP" select="3.90"/>

		<xsl:element name="Przychod_z_biletów">
				<xsl:variable name="PrzychódPLN" select="sum(//cena[@waluta='PLN'])"/>
				<xsl:variable name="PrzychódGBP" select="sum(//cena[@waluta='GBP'])"/>
				<xsl:variable name="PrzychódGBP2" select="sum(//cena[@waluta='GBP']) * $PrzelicznikGBP"/>
				<xsl:variable name="PrzychodCałkowity" select="$PrzychódPLN + $PrzychódGBP2"/>
				<xsl:element name="PrzychódCalkowityPLN">
					<xsl:value-of select="format-number($PrzychódPLN,'.##')"/>
					<xsl:text> zł</xsl:text>
				</xsl:element>
				<xsl:element name="PrzychódCalkowityGBP">
					<xsl:value-of select="format-number($PrzychódGBP,'.##')"/>
					<xsl:text> £</xsl:text>
				</xsl:element>
				<xsl:element name="Przychód">
					<xsl:value-of select="format-number($PrzychodCałkowity,'.##')"/>
					<xsl:text> zł</xsl:text>
				</xsl:element>
				<xsl:element name="Podatek">
					<xsl:value-of select="format-number($PrzychodCałkowity * 0.23,'.##')"/>
					<xsl:text> zł</xsl:text>
				</xsl:element>
				<xsl:element name="Dochód">
					<xsl:value-of select="format-number($PrzychodCałkowity * 0.77,'.##')"/>
					<xsl:text> zł</xsl:text>
				</xsl:element>
		</xsl:element>

	</xsl:element>	
</xsl:template>   				    
					    
</xsl:stylesheet>